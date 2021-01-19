variable "service_projects_number" {
  type        = string
  description = "Number of service projects attached to shared vpc host"
}
variable "host_project_id" {
  type        = string
  description = "Identifier for the host project to be used"
}
variable "service_project_ids" {
  type = list(string)
  description = "Associated service projects to link with the host project."
}
variable "root_id" {
  type        = string
  description = "id for the parent (organization or folder) where these projects will be created."
}
variable "billing_account_id" {
  type        = string
  description = "Id of billing account thi which projects will be assigned"
}
variable "labels" {
  type        = map(string)
  description = "Labels to assign to resources."
}