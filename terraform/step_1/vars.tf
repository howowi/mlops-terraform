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

variable "ssh_public_key" {
  description = "SSH public key to access node"
  type        = string
}

variable "oke_k8sapiendpoint_subnet_cidr_block" {
  description = "Subnet CIDR Block for OKE API Endpoint"
  default = "10.1.0.0/24"
}

variable "oke_service_lb_subnet_cidr_block" {
  description = "Subnet CIDR Block for Service Load Balancer"
  default = "10.1.1.0/24"
}

variable "oke_nodepool_cidr_block" {
  description = "Subnet CIDR Block for worker nodepool"
  default = "10.1.2.0/24"
}

variable "kubernetes_version" {
  description = "Kubernetes version"
}

variable "node_shape" {
  description = "Instance shape of the node"
  default = "VM.Standard.E3.Flex"
}

variable "shape_ocpus" {
  description = "Number of OCPUs of each node"
  default = "8"
}

variable "shape_mems" {
  description = "Memory of each node in GB"
  default = "128"
}

variable "image_os_id" {
  description = "OS Image OCID of the node pool"
}

variable "email_address" {
  description = "Email address for OCI DevOps Notificatio"
}

variable "test_ml_model_func_image" {
  description = "Qualified name of the Docker image for the function"
  default = "lhr.ocir.io/apaccpt01/verify-http-code:0.0.22"
}

data "oci_core_services" "all_services" {
}

data oci_identity_availability_domain AD-1 {
  compartment_id = var.compartment_ocid
  ad_number      = "1"
}
data oci_identity_availability_domain AD-2 {
  compartment_id = var.compartment_ocid
  ad_number      = "2"
}
data oci_identity_availability_domain AD-3 {
  compartment_id = var.compartment_ocid
  ad_number      = "3"
}

data oci_objectstorage_namespace namespace {
  compartment_id = var.compartment_ocid
}