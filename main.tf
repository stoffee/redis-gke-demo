provider "google" {
  region      = "${var.gcp_region}"
  credentials = "${var.gcp_credentials}"
}

terraform {
  required_version = ">= 0.11.0"
}

module "redis" {
# When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
 # to a specific version of the modules, such as the following example:
 # source = "modules/vault-cluster"
 source = "git::https://github.com/stoffee/redis-gke-demo.git//modules/redis"
  region      = "${var.gcp_region}"
  credentials = "${var.gcp_credentials}"
  gcp_project_id = "${var.gcp_project_id}"
  gcp_zone = "${var.gcp_zone}"
  alternative_gcp_zone = "${var.alternative_gcp_zone}"
  namespace = "${var.namespace}"

}
