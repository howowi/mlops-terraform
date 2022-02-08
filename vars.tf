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

data oci_identity_availability_domain export_ZVCk-PHX-AD-1 {
  compartment_id = var.compartment_ocid
  ad_number      = "1"
}
data oci_identity_availability_domain export_ZVCk-PHX-AD-2 {
  compartment_id = var.compartment_ocid
  ad_number      = "2"
}
data oci_identity_availability_domain export_ZVCk-PHX-AD-3 {
  compartment_id = var.compartment_ocid
  ad_number      = "3"
}

variable "vcn_cidr_blocks" {
  description = "VCN CIDR Blocks"
  default = "10.0.0.0/16"
}