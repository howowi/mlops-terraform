## ------- Virtual Cloud Network -------- ##
resource oci_core_vcn mlops-vcn {
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
  depends_on     = [oci_core_vcn.mlops-vcn]
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
  depends_on     = [oci_core_vcn.prod-oke-vcn]
  compartment_id = var.compartment_ocid
  display_name = "${var.resource_naming_prefix}-prod-oke-sgw"
  services {
    service_id = data.oci_core_services.all_services.services.1.id
  }
  vcn_id = oci_core_vcn.prod-oke-vcn.id
}

resource oci_core_service_gateway test-oke-sgw {
  depends_on     = [oci_core_vcn.test-oke-vcn]
  compartment_id = var.compartment_ocid
  display_name = "${var.resource_naming_prefix}-test-oke-sgw"
  services {
    service_id = data.oci_core_services.all_services.services.1.id
  }
  vcn_id = oci_core_vcn.test-oke-vcn.id
}

## ------- NAT Gateway ------- ##
resource oci_core_nat_gateway prod-oke-ngw {
  depends_on     = [oci_core_vcn.prod-oke-vcn]
  compartment_id = var.compartment_ocid
  display_name = "${var.resource_naming_prefix}-prod-oke-ngw"
  vcn_id       = oci_core_vcn.prod-oke-vcn.id
}

resource oci_core_nat_gateway test-oke-ngw {
  depends_on     = [oci_core_vcn.test-oke-vcn]
  compartment_id = var.compartment_ocid
  display_name = "${var.resource_naming_prefix}-test-oke-ngw"
  vcn_id       = oci_core_vcn.test-oke-vcn.id
}

## ------- Default Public Route Table ------- ##

resource oci_core_default_route_table mlops-default-routetable {
  depends_on     = [oci_core_vcn.mlops-vcn, oci_core_internet_gateway.mlops-igw]
  compartment_id = var.compartment_ocid
  display_name = "Default Route Table for mlops-vcn"
  manage_default_resource_id = oci_core_vcn.mlops-vcn.default_route_table_id
  route_rules {
    description       = "traffic to/from internet"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.mlops-igw.id
  }
}

resource oci_core_default_route_table prod-oke-public-routetable {
  depends_on     = [oci_core_vcn.prod-oke-vcn, oci_core_internet_gateway.prod-oke-igw]
  compartment_id = var.compartment_ocid
  display_name = "Default Route Table for prod-oke"
  manage_default_resource_id = oci_core_vcn.prod-oke-vcn.default_route_table_id
  route_rules {
    description       = "traffic to/from internet"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.prod-oke-igw.id
  }
}

resource oci_core_default_route_table test-oke-public-routetable {
  depends_on     = [oci_core_vcn.test-oke-vcn, oci_core_internet_gateway.test-oke-igw]
  compartment_id = var.compartment_ocid
  display_name = "Default Route Table for test-oke"
  manage_default_resource_id = oci_core_vcn.test-oke-vcn.default_route_table_id
  route_rules {
    description       = "traffic to/from internet"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.test-oke-igw.id
  }
}

## ------- Private Route Table ------- ##
resource oci_core_route_table prod-oke-private-routetable {
  depends_on     = [oci_core_vcn.prod-oke-vcn, oci_core_nat_gateway.prod-oke-ngw, oci_core_service_gateway.prod-oke-sgw]
  compartment_id = var.compartment_ocid
  display_name = "Private Route Table for prod-oke"
  route_rules {
    description       = "traffic to the internet"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.prod-oke-ngw.id
  }
  route_rules {
    description       = "traffic to OCI services"
    destination       = data.oci_core_services.all_services.services.1.cidr_block
    destination_type  = "SERVICE_CIDR_BLOCK"
    network_entity_id = oci_core_service_gateway.prod-oke-sgw.id
  }
  vcn_id = oci_core_vcn.prod-oke-vcn.id
}


resource oci_core_route_table test-oke-private-routetable {
  depends_on     = [oci_core_vcn.test-oke-vcn, oci_core_nat_gateway.test-oke-ngw, oci_core_service_gateway.test-oke-sgw]
  compartment_id = var.compartment_ocid
  display_name = "Private Route Table for test-oke"
  route_rules {
    description       = "traffic to the internet"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.test-oke-ngw.id
  }
  route_rules {
    description       = "traffic to OCI services"
    destination       = data.oci_core_services.all_services.services.1.cidr_block
    destination_type  = "SERVICE_CIDR_BLOCK"
    network_entity_id = oci_core_service_gateway.test-oke-sgw.id
  }
  vcn_id = oci_core_vcn.test-oke-vcn.id
}