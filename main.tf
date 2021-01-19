module "shared_vpc_host" {
  source = "./modules/shared_vpc_host"
  billing_account_id = var.billing_account_id
  labels = var.labels
  region = var.region
  root_id = var.root_id
  shared_networking_project_name = var.shared_networking_project_name
  standard_network_subnets = var.standard_network_subnets
  shared_networking_project_custom_iam_bindings = var.shared_networking_project_custom_iam_bindings
}
module "shared_vpc_service" {
  source = "./modules/shared_vpc_service/"
  depends_on = [module.shared_vpc_host]
  billing_account_id = var.billing_account_id
  labels = var.labels
  root_id = var.root_id
  host_project_id = module.shared_vpc_host.host_project_id
  service_project_ids = var.service_project_ids
  service_projects_number = var.service_projects_number
}