###
# Create a random id
###

resource "random_id" "this" {
  byte_length = 2
}
###
# Create the shared vpc project
###

resource "google_project" "this" {
  name                = "${var.shared_networking_project_name}-${random_id.this.hex}"
  project_id          = "${var.shared_networking_project_name}-${random_id.this.hex}"
  org_id           = var.root_id
  billing_account     = var.billing_account_id
  auto_create_network = false
  labels              = var.labels
}

###
# Assign the project as a shared vpc host project
###

resource "google_compute_shared_vpc_host_project" "this" {
  project = google_project.this.name
}

###
# Create the network
###

resource "google_compute_network" "this" {
  name                    = var.shared_networking_project_name
  auto_create_subnetworks = "false"
  routing_mode            = "REGIONAL"
  project                 = google_project.this.project_id
  depends_on              = [google_compute_shared_vpc_host_project.this]
}

###
# Create the subnet
###

resource "google_compute_subnetwork" "standard" {
  count                    = length(var.standard_network_subnets)
  name                     = var.standard_network_subnets[count.index]["name"]
  ip_cidr_range            = var.standard_network_subnets[count.index]["cidr"]
  region                   = var.region
  private_ip_google_access = true
  project                  = google_project.this.project_id
  network                  = google_compute_network.this.name

  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }

  #labels           = "${var.tags}"
  depends_on = [google_compute_network.this]
}

resource "google_project_iam_member" "shared_networking_custom_iam_bindings" {
  count   = length(var.shared_networking_project_custom_iam_bindings)
  project = google_project.this.project_id
  member  = var.shared_networking_project_custom_iam_bindings[count.index].member
  role    = var.shared_networking_project_custom_iam_bindings[count.index].role
}