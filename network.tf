## ------- Virtual Cloud Network -------- ##
resource oci_core_vcn mlops-generic-vcn {
  cidr_blocks = [
    var.generic_vcn_cidr_blocks,
  ]
  compartment_id = var.compartment_ocid
  display_name = "${var.resource_naming_prefix}-mlops-generic-vcn"
  dns_label    = "mlopsvcn"
}

resource oci_core_vcn prod-oke-vcn {
  cidr_blocks = [
    var.oke_vcn_cidr_blocks,
  ]
  compartment_id = var.compartment_ocid
  display_name = "${var.resource_naming_prefix}-prod-oke-vcn"
  dns_label    = "prodokecluster"
}

resource oci_core_vcn test-oke-vcn {
  cidr_blocks = [
    var.oke_vcn_cidr_blocks,
  ]
  compartment_id = var.compartment_ocid
  display_name = "${var.resource_naming_prefix}-test-oke-vcn"
  dns_label    = "testokecluster"
}

## ------- Internet Gateway -------- ##
resource oci_core_internet_gateway mlops-igw {
  depends_on     = [oci_core_vcn.mlops-generic-vcn]
  compartment_id = var.compartment_ocid
  display_name = "${var.resource_naming_prefix}-mlops-igw"
  vcn_id = oci_core_vcn.mlops-generic-vcn.id
}

resource oci_core_internet_gateway prod-oke-igw {
  depends_on     = [oci_core_vcn.prod-oke-vcn]
  compartment_id = var.compartment_ocid
  display_name = "${var.resource_naming_prefix}-prod-oke-igw"
  vcn_id = oci_core_vcn.prod-oke-vcn.id
}

resource oci_core_internet_gateway test-oke-igw {
  depends_on     = [oci_core_vcn.test-oke-vcn]
  compartment_id = var.compartment_ocid
  display_name = "${var.resource_naming_prefix}-test-oke-igw"
  vcn_id = oci_core_vcn.test-oke-vcn.id
}

## ------- Service Gateway ------- ##
resource oci_core_service_gateway prod-oke-sgw {
  compartment_id = var.compartment_ocid
  display_name = "${var.resource_naming_prefix}-prod-oke-sgw"
  services {
    service_id = data.oci_core_services.all_services.services.0.id
  }
  vcn_id = oci_core_vcn.prod-oke-vcn.id
}

resource oci_core_service_gateway test-oke-sgw {
  compartment_id = var.compartment_ocid
  display_name = "${var.resource_naming_prefix}-test-oke-sgw"
  services {
    service_id = data.oci_core_services.all_services.services.0.id
  }
  vcn_id = oci_core_vcn.test-oke-vcn.id
}

# ## ------- NAT Gateway ------- ## Pending
# resource oci_core_nat_gateway export_oke-ngw-quick-prod_oke_cluster_ry-21e30b072 {
#   compartment_id = var.compartment_ocid
#   display_name = "oke-ngw-quick-prod_oke_cluster_ry-21e30b072"
#   vcn_id       = oci_core_vcn.export_oke-vcn-quick-prod_oke_cluster_ry-21e30b072.id
# }

# resource oci_core_nat_gateway export_oke-ngw-quick-test_oke_cluster_ry-7bc0980c4 {
#   compartment_id = var.compartment_ocid
#   display_name = "oke-ngw-quick-test_oke_cluster_ry-7bc0980c4"
#   vcn_id       = oci_core_vcn.export_oke-vcn-quick-test_oke_cluster_ry-7bc0980c4.id
# }

# ## ------- Default Public Route Table ------- ##

# resource oci_core_default_route_table mlops-generic-default-routetable {
#   depends_on     = [oci_core_vcn.mlops-generic-vcn, oci_core_internet_gateway.mlops-igw]
#   compartment_id = var.compartment_ocid
#   display_name = "Default Route Table for mlops-generic-vcn"
#   manage_default_resource_id = oci_core_vcn.mlops-generic-vcn.default_route_table_id
#   route_rules {
#     description       = "traffic to/from internet"
#     destination       = "0.0.0.0/0"
#     destination_type  = "CIDR_BLOCK"
#     network_entity_id = oci_core_internet_gateway.mlops-igw.id
#   }
# }

# resource oci_core_default_route_table oke-public-routetable-prod_oke {
#   depends_on     = [oci_core_vcn.prod-oke-vcn, oci_core_internet_gateway.prod-oke-igw]
#   compartment_id = var.compartment_ocid
#   display_name = "oke-public-routetable-prod_oke"
#   manage_default_resource_id = oci_core_vcn.prod-oke-vcn.default_route_table_id
#   route_rules {
#     description       = "traffic to/from internet"
#     destination       = "0.0.0.0/0"
#     destination_type  = "CIDR_BLOCK"
#     network_entity_id = oci_core_internet_gateway.prod-oke-igw.id
#   }
# }

# resource oci_core_default_route_table oke-public-routetable-test_oke {
#   depends_on     = [oci_core_vcn.test-oke-vcn, oci_core_internet_gateway.test-oke-igw]
#   compartment_id = var.compartment_ocid
#   display_name = "oke-public-routetable-test_oke"
#   manage_default_resource_id = oci_core_vcn.test-oke-vcn.default_route_table_id
#   route_rules {
#     description       = "traffic to/from internet"
#     destination       = "0.0.0.0/0"
#     destination_type  = "CIDR_BLOCK"
#     network_entity_id = oci_core_internet_gateway.test-oke-igw.id
#   }
# }

# ## ------- Private Route Table ------- ## Pending
# resource oci_core_route_table oke-private-routetable-prod_oke {
#   compartment_id = var.compartment_ocid
#   display_name = "oke-private-routetable-prod_oke"
#   route_rules {
#     description       = "traffic to the internet"
#     destination       = "0.0.0.0/0"
#     destination_type  = "CIDR_BLOCK"
#     network_entity_id = oci_core_nat_gateway.export_oke-ngw-quick-prod_oke_cluster_ry-21e30b072.id
#   }
#   route_rules {
#     description       = "traffic to OCI services"
#     destination       = "all-phx-services-in-oracle-services-network"
#     destination_type  = "SERVICE_CIDR_BLOCK"
#     network_entity_id = oci_core_service_gateway.export_oke-sgw-quick-prod_oke_cluster_ry-21e30b072.id
#   }
#   vcn_id = oci_core_vcn.export_oke-vcn-quick-prod_oke_cluster_ry-21e30b072.id
# }


# resource oci_core_route_table export_oke-private-routetable-test_oke_cluster_ry-7bc0980c4 {
#   compartment_id = var.compartment_ocid
#   display_name = "oke-private-routetable-test_oke_cluster_ry-7bc0980c4"
#   route_rules {
#     description       = "traffic to the internet"
#     destination       = "0.0.0.0/0"
#     destination_type  = "CIDR_BLOCK"
#     network_entity_id = oci_core_nat_gateway.export_oke-ngw-quick-test_oke_cluster_ry-7bc0980c4.id
#   }
#   route_rules {
#     description       = "traffic to OCI services"
#     destination       = "all-phx-services-in-oracle-services-network"
#     destination_type  = "SERVICE_CIDR_BLOCK"
#     network_entity_id = oci_core_service_gateway.export_oke-sgw-quick-test_oke_cluster_ry-7bc0980c4.id
#   }
#   vcn_id = oci_core_vcn.export_oke-vcn-quick-test_oke_cluster_ry-7bc0980c4.id
# }