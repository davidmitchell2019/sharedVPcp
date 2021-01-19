
variable "shared_networking_project_name" {
  type        = string
  description = "Shared networking project name."
}
variable "labels" {
  type        = map(string)
  description = "Labels to assign to resources."
}
variable "root_id" {
  type        = string
  description = "id for the parent (organization or folder) where these projects will be created."
}
variable "billing_account_id" {
  type        = string
  description = "Id of billing account thi which projects will be assigned"
}
variable "standard_network_subnets" {
  type = list(object({
    name = string
    cidr = string
  }))
  description = "cidr ranges for standard (non-gke) subnetworks"
}
variable "region" {
  type        = string
  description = "region name"
}
variable "shared_networking_project_custom_iam_bindings" {
  description = "List of custom IAM bindings that should be added to the shared networking project's policy. An item consists in a map containing a cloud identity member (such as group:name@example.com) and a IAM role (such as roles/compute.viewer)"
  type = list(object({
    member = string
    role   = string
  }))
}