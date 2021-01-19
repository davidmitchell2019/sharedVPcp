###
# Create a random id
###

resource "random_id" "this" {
  byte_length = 2
}

###
# Create the service projects
###

resource "google_project" "this" {
  count = length(var.service_project_ids)
  name  = element(var.service_project_ids, count.index)
  project_id          = "${element(var.service_project_ids, count.index)}${random_id.this.hex}"
  org_id              = var.root_id
  billing_account     = var.billing_account_id
  auto_create_network = false
  labels              = var.labels
}

###
# Add the service projects
###
resource "google_compute_shared_vpc_service_project" "service_project" {
  count = length(var.service_project_ids)
  host_project    = var.host_project_id
  service_project = "${google_project.this[count.index].project_id}"
}


