##----- Production OKE Cluster -----##

resource oci_containerengine_cluster prod-oke-cluster {
  compartment_id = var.compartment_ocid
  endpoint_config {
    is_public_ip_enabled = "true"
    nsg_ids = [
    ]
    subnet_id = oci_core_subnet.prod-oke-k8sapiendpoint-subnet.id
  }
  image_policy_config {
    is_policy_enabled = "false"
  }
  kubernetes_version = var.kubernetes_version
  name               = "${var.resource_naming_prefix}-prod-oke-cluster"
  options {
    add_ons {
      is_kubernetes_dashboard_enabled = "false"
      is_tiller_enabled               = "false"
    }
    admission_controller_options {
      is_pod_security_policy_enabled = "false"
    }
    kubernetes_network_config {
      pods_cidr     = "10.244.0.0/16"
      services_cidr = "10.96.0.0/16"
    }
    service_lb_subnet_ids = [
      oci_core_subnet.prod-oke-service_lb-subnet.id,
    ]
  }
  vcn_id = oci_core_vcn.prod-oke-vcn.id
}

## ----- Production OKE Node Pool ----- ##

resource oci_containerengine_node_pool prod-oke-pool1 {
  cluster_id     = oci_containerengine_cluster.prod-oke-cluster.id
  compartment_id = var.compartment_ocid
  initial_node_labels {
    key   = "name"
    value = "prod-oke-cluster"
  }
  kubernetes_version = var.kubernetes_version
  name               = "prod-oke-pool1"
  node_config_details {
    nsg_ids = [
    ]
    placement_configs {
      availability_domain = data.oci_identity_availability_domain.export_ZVCk-PHX-AD-3.name
      subnet_id           = oci_core_subnet.export_oke-nodesubnet-quick-test_oke_cluster_ry-7bc0980c4-regional.id
    }
    placement_configs {
      availability_domain = data.oci_identity_availability_domain.export_ZVCk-PHX-AD-2.name
      subnet_id           = oci_core_subnet.export_oke-nodesubnet-quick-test_oke_cluster_ry-7bc0980c4-regional.id
    }
    placement_configs {
      availability_domain = data.oci_identity_availability_domain.export_ZVCk-PHX-AD-1.name
      subnet_id           = oci_core_subnet.export_oke-nodesubnet-quick-test_oke_cluster_ry-7bc0980c4-regional.id
    }
    size = "3"
  }
  node_metadata = {
  }
  node_shape = var.node_shape
  node_shape_config {
    memory_in_gbs = var.shape_mems
    ocpus         = var.shape_ocpus
  }
  node_source_details {
    image_id    = "ocid1.image.oc1.phx.aaaaaaaanq3ltdsl5ij3cuvqimjwt5yctb7eolglzvkbq2u6wypanj5aazga"
    source_type = "IMAGE"
  }
  ssh_public_key = var.ssh_public_key
}

##----- Test OKE Cluster -----##

resource oci_containerengine_cluster test-oke-cluster {
  compartment_id = var.compartment_ocid
  endpoint_config {
    is_public_ip_enabled = "true"
    nsg_ids = [
    ]
    subnet_id = oci_core_subnet.test-oke-k8sapiendpoint-subnet.id
  }
  image_policy_config {
    is_policy_enabled = "false"
  }
  kubernetes_version = var.kubernetes_version
  name               = "${var.resource_naming_prefix}-test-oke-cluster"
  options {
    add_ons {
      is_kubernetes_dashboard_enabled = "false"
      is_tiller_enabled               = "false"
    }
    admission_controller_options {
      is_pod_security_policy_enabled = "false"
    }
    kubernetes_network_config {
      pods_cidr     = "10.244.0.0/16"
      services_cidr = "10.96.0.0/16"
    }
    service_lb_subnet_ids = [
      oci_core_subnet.test-oke-service_lb-subnet.id,
    ]
  }
  vcn_id = oci_core_vcn.test-oke-vcn.id
}

# resource oci_containerengine_node_pool export_pool1_1 {
#   cluster_id     = oci_containerengine_cluster.export_prod_oke_cluster_ry.id
#   compartment_id = var.compartment_ocid
#   initial_node_labels {
#     key   = "name"
#     value = "prod_oke_cluster_ry"
#   }
#   kubernetes_version = "v1.20.11"
#   name               = "pool1"
#   node_config_details {
#     nsg_ids = [
#     ]
#     placement_configs {
#       availability_domain = data.oci_identity_availability_domain.export_ZVCk-PHX-AD-3.name
#       subnet_id           = oci_core_subnet.export_oke-nodesubnet-quick-prod_oke_cluster_ry-21e30b072-regional.id
#     }
#     placement_configs {
#       availability_domain = data.oci_identity_availability_domain.export_ZVCk-PHX-AD-1.name
#       subnet_id           = oci_core_subnet.export_oke-nodesubnet-quick-prod_oke_cluster_ry-21e30b072-regional.id
#     }
#     placement_configs {
#       availability_domain = data.oci_identity_availability_domain.export_ZVCk-PHX-AD-2.name
#       subnet_id           = oci_core_subnet.export_oke-nodesubnet-quick-prod_oke_cluster_ry-21e30b072-regional.id
#     }
#     size = "3"
#   }
#   node_metadata = {
#   }
#   node_shape = "VM.Standard.E3.Flex"
#   node_shape_config {
#     memory_in_gbs = "128"
#     ocpus         = "8"
#   }
#   node_source_details {
#     #boot_volume_size_in_gbs = <<Optional value not found in discovery>>
#     image_id    = "ocid1.image.oc1.phx.aaaaaaaanq3ltdsl5ij3cuvqimjwt5yctb7eolglzvkbq2u6wypanj5aazga"
#     source_type = "IMAGE"
#   }
#   #quantity_per_subnet = <<Optional value not found in discovery>>
#   #ssh_public_key = <<Optional value not found in discovery>>
#   #subnet_ids = <<Optional value not found in discovery>>
# }

