locals {
  name = "key-${var.ressource_name}-${var.unique_id}-${var.environment}"
  common_tags = {
    "Name" = local.name
    "project_application" = "${var.project_application}"
    "unique_id" = "${var.unique_id}"
    "region" = "${var.region}"
    "infra_provider" = "${var.infra_provider}"
    "owner" = "${var.owner}"
    "environment" = "${var.environment}"
    "managed_by" = "Terraform"
  }
}