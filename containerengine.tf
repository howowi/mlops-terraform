##----- Production OKE Cluster -----##

resource oci_containerengine_cluster prod-oke-cluster {
  compartment_id = var.compartment_ocid
  endpoint_config {
    is_public_ip_enabled = "true"
    subnet_id = oci_core_subnet.prod-oke-k8sapiendpoint-subnet.id
  }
  image_policy_config {
    is_policy_enabled = "false"
  }
  kubernetes_version = var.kubernetes_version
  name               = "${var.resource_naming_prefix}-prod-oke-cluster"
  options {
    admission_controller_options {
      is_pod_security_policy_enabled = "false"
    }
    kubernetes_network_config {
      pods_cidr     = "10.244.0.0/16"
      services_cidr = "10.96.0.0/16"
    }
    service_lb_subnet_ids = [
      oci_core_subnet.prod-oke-service_lb-subnet.id
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
      availability_domain = data.oci_identity_availability_domain.AD-1.name
      subnet_id           = oci_core_subnet.prod-oke-nodepool-subnet.id
    }
    # placement_configs {
    #   availability_domain = data.oci_identity_availability_domain.AD-2.name
    #   subnet_id           = oci_core_subnet.prod-oke-nodepool-subnet.id
    # }
    # placement_configs {
    #   availability_domain = data.oci_identity_availability_domain.AD-3.name
    #   subnet_id           = oci_core_subnet.prod-oke-nodepool-subnet.id
    # }
    size = "2"
  }
  node_metadata = {
  }
  node_shape = var.node_shape
  node_shape_config {
    memory_in_gbs = var.shape_mems
    ocpus         = var.shape_ocpus
  }
  node_source_details {
    image_id    = var.image_os_id
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
    admission_controller_options {
      is_pod_security_policy_enabled = "false"
    }
    kubernetes_network_config {
      pods_cidr     = "10.244.0.0/16"
      services_cidr = "10.96.0.0/16"
    }
    service_lb_subnet_ids = [
      oci_core_subnet.test-oke-service_lb-subnet.id
    ]
  }
  vcn_id = oci_core_vcn.test-oke-vcn.id
}

## ----- Test OKE Node Pool ----- ##

resource oci_containerengine_node_pool test-oke-pool1 {
  cluster_id     = oci_containerengine_cluster.test-oke-cluster.id
  compartment_id = var.compartment_ocid
  initial_node_labels {
    key   = "name"
    value = "test-oke-cluster"
  }
  kubernetes_version = var.kubernetes_version
  name               = "test-oke-pool1"
  node_config_details {
    nsg_ids = [
    ]
    placement_configs {
      availability_domain = data.oci_identity_availability_domain.AD-1.name
      subnet_id           = oci_core_subnet.test-oke-nodepool-subnet.id
    }
    # placement_configs {
    #   availability_domain = data.oci_identity_availability_domain.AD-2.name
    #   subnet_id           = oci_core_subnet.test-oke-nodepool-subnet.id
    # }
    # placement_configs {
    #   availability_domain = data.oci_identity_availability_domain.AD-3.name
    #   subnet_id           = oci_core_subnet.test-oke-nodepool-subnet.id
    # }
    size = "2"
  }
  node_metadata = {
  }
  node_shape = var.node_shape
  node_shape_config {
    memory_in_gbs = var.shape_mems
    ocpus         = var.shape_ocpus
  }
  node_source_details {
    image_id    = var.image_os_id
    source_type = "IMAGE"
  }
  ssh_public_key = var.ssh_public_key
}

