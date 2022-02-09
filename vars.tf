terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = ">= 2.1.0"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3.1.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 1.11.2"
    }
    oci = {
      source  = "hashicorp/oci"
      version = ">= 3.30.0"
    }
  }
  required_version = ">= 1.0"
}

provider "kubernetes" {
  config_path = "$HOME/.kube/config"
}

provider "oci" {
  region          = var.region
  tenancy_ocid    = var.tenancy_ocid
}

variable "compartment_ocid" {
  description = "Please provide compartment OCID."
  type        = string
}

variable "tenancy_ocid" {
  description = "Please provide tenancy OCID."
  type = string
}

variable "region" {
  description = "Please provide region for the AWX deployment."
  type        = string
}

variable "generic_vcn_cidr_blocks" {
  description = "VCN CIDR Block for Generic MLOps resources"
  default = "10.0.0.0/16"
}

variable "oke_vcn_cidr_blocks" {
  description = "VCN CIDR Blocks for OKE Cluster"
  default = "10.1.0.0/16"
}

variable "resource_naming_prefix" {
  description = "Prefix for all resource display names"
  type        = string
  default = "demo"
}

data "oci_core_services" "all_services" {
}

output "core services" {
  value = data.oci_core_services.all_services.0.name
}