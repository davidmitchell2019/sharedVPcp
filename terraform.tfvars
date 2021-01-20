billing_account_id = ""
labels = {
 "foo": "bar", "bar": "baz"
}
region = "europe-west2"
root_id = ""
service_project_ids = [
  "serviceproject1",
  "serviceproject2",
  "serviceproject6"
]
service_projects_number = "two"
shared_networking_project_name = "hosteproject"
standard_network_subnets = [
  {
    name = "firstsubnet"
    cidr = "10.0.0.0/24"
  }
]
shared_networking_project_custom_iam_bindings = [
  {
    member = "serviceAccount:projects-test@testingareaforfun.iam.gserviceaccount.com",
    role = "roles/browser",
  },
  {
    member = "serviceAccount:projects-test@testingareaforfun.iam.gserviceaccount.com",
    role = "roles/resourcemanager.projectIamAdmin",
  },
]
