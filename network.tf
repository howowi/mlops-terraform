## ------- Virtual Cloud Network -------- ##
resource oci_core_vcn mlops-vcn {
  cidr_blocks = [
    var.generic_vcn_cidr_blocks,
  ]
  compartment_id = var.compartment_ocid
  display_name = "${var.resource_naming_prefix}-mlops-vcn"
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
  vcn_id = oci_core_vcn.mlops-vcn.id
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

## ----- Production OKE Subnets and Security Lists ----- ##

resource oci_core_subnet prod-oke-k8sapiendpoint-subnet {
  depends_on     = [oci_core_vcn.prod-oke-vcn, oci_core_default_route_table.prod-oke-public-routetable, oci_core_security_list.prod-oke-k8sapiendpoint-sl]
  cidr_block = var.oke_k8sapiendpoint_subnet_cidr_block
  compartment_id = var.compartment_ocid
  vcn_id = oci_core_vcn.prod-oke-vcn.id
  display_name = "${var.resource_naming_prefix}-prod-oke-k8sapiendpoint-subnet"
  route_table_id =  oci_core_default_route_table.prod-oke-public-routetable.id
  security_list_ids = oci_core_security_list.prod-oke-k8sapiendpoint-sl.id
}

resource oci_core_subnet prod-oke-service_lb-subnet {
  cidr_block = var.oke_service_lb_subnet_cidr_block
  compartment_id = var.compartment_ocid
  vcn_id = oci_core_vcn.prod-oke-vcn.id
  display_name = "${var.resource_naming_prefix}-prod-oke-service_lb-subnet"
  route_table_id = oci_core_default_route_table.prod-oke-public-routetable.id
  security_list_ids = oci_core_security_list.prod-oke-service_lb-sl.id
}

resource oci_core_subnet prod-oke-nodepool-subnet {
  cidr_block = var.oke_nodepool_cidr_block
  compartment_id = var.compartment_ocid
  vcn_id = oci_core_vcn.prod-oke-vcn.id
  display_name = "${var.resource_naming_prefix}-prod-oke-nodepool-subnet"
  route_table_id = oci_core_route_table.prod-oke-private-routetable.id
  security_list_ids = oci_core_security_list.prod-oke-nodepool-sl.id
}

resource oci_core_security_list prod-oke-k8sapiendpoint-sl {
  compartment_id = var.compartment_ocid
  vcn_id = oci_core_vcn.prod-oke-vcn.id
  display_name = "${var.resource_naming_prefix}-prod-oke-k8sapiendpoint-sl"
  
  egress_security_rules {
		description = "Allow Kubernetes Control Plane to communicate with OKE"
		destination = data.oci_core_services.all_services.services.1.cidr_block
		destination_type = "SERVICE_CIDR_BLOCK"
		protocol = "6"
		stateless = "false"
	}
	egress_security_rules {
		description = "All traffic to worker nodes"
		destination = var.oke_nodepool_cidr_block
		destination_type = "CIDR_BLOCK"
		protocol = "6"
		stateless = "false"
	}
	egress_security_rules {
		description = "Path discovery"
		destination = var.oke_nodepool_cidr_block
		destination_type = "CIDR_BLOCK"
		icmp_options {
			code = "4"
			type = "3"
		}
		protocol = "1"
		stateless = "false"
	}
	ingress_security_rules {
		description = "External access to Kubernetes API endpoint"
		protocol = "6"
		source = "0.0.0.0/0"
		stateless = "false"
	}
	ingress_security_rules {
		description = "Kubernetes worker to Kubernetes API endpoint communication"
		protocol = "6"
		source = var.oke_nodepool_cidr_block
		stateless = "false"
	}
	ingress_security_rules {
		description = "Kubernetes worker to control plane communication"
		protocol = "6"
		source = var.oke_nodepool_cidr_block
		stateless = "false"
	}
	ingress_security_rules {
		description = "Path discovery"
		icmp_options {
			code = "4"
			type = "3"
		}
		protocol = "1"
		source = var.oke_nodepool_cidr_block
		stateless = "false"
	}
}

resource oci_core_security_list prod-oke-service_lb-sl {
  compartment_id = var.compartment_ocid
  vcn_id = oci_core_vcn.prod-oke-vcn.id
  display_name = "${var.resource_naming_prefix}-prod-oke-service_lb-sl"
}

resource oci_core_security_list prod-oke-nodepool-sl {
  compartment_id = var.compartment_ocid
  vcn_id = oci_core_vcn.prod-oke-vcn.id
  display_name = "${var.resource_naming_prefix}-prod-oke-nodepool-sl"

  egress_security_rules {
		description = "Allow pods on one worker node to communicate with pods on other worker nodes"
		destination = var.oke_nodepool_cidr_block
		destination_type = "CIDR_BLOCK"
		protocol = "all"
		stateless = "false"
	}
	egress_security_rules {
		description = "Access to Kubernetes API Endpoint"
		destination = oci_core_subnet.prod-oke-k8sapiendpoint-subnet.cidr_block
		destination_type = "CIDR_BLOCK"
		protocol = "6"
		stateless = "false"
    tcp_options {
      max = "6443"
      min = "6443"
      source_port_range {
        max = "all"
        min = "all"
      }
    }
	}
	egress_security_rules {
		description = "Kubernetes worker to control plane communication"
		destination = oci_core_subnet.prod-oke-k8sapiendpoint-subnet.cidr_block
		destination_type = "CIDR_BLOCK"
		protocol = "6"
		stateless = "false"
    tcp_options {
      max = "12250"
      min = "12250"
      source_port_range {
        max = "all"
        min = "all"
      }
    }
	}
	egress_security_rules {
		description = "Path discovery"
		destination = oci_core_subnet.prod-oke-k8sapiendpoint-subnet.cidr_block
		destination_type = "CIDR_BLOCK"
		icmp_options {
			code = "4"
			type = "3"
		}
		protocol = "1"
		stateless = "false"
	}
	egress_security_rules {
		description = "Allow nodes to communicate with OKE to ensure correct start-up and continued functioning"
		destination = data.oci_core_services.all_services.services.1.cidr_block
		destination_type = "SERVICE_CIDR_BLOCK"
		protocol = "6"
		stateless = "false"
    tcp_options {
      max = "443"
      min = "443"
      source_port_range {
        max = "all"
        min = "all"
      }
    }
	}
	egress_security_rules {
		description = "ICMP Access from Kubernetes Control Plane"
		destination = "0.0.0.0/0"
		destination_type = "CIDR_BLOCK"
		icmp_options {
			code = "4"
			type = "3"
		}
		protocol = "1"
		stateless = "false"
	}
	egress_security_rules {
		description = "Worker Nodes access to Internet"
		destination = "0.0.0.0/0"
		destination_type = "CIDR_BLOCK"
		protocol = "all"
		stateless = "false"
	}
	ingress_security_rules {
		description = "Allow pods on one worker node to communicate with pods on other worker nodes"
		protocol = "all"
		source = var.oke_nodepool_cidr_block
		stateless = "false"
	}
	ingress_security_rules {
		description = "Path discovery"
		icmp_options {
			code = "4"
			type = "3"
		}
		protocol = "1"
		source = oci_core_subnet.prod-oke-k8sapiendpoint-subnet.cidr_block
		stateless = "false"
	}
	ingress_security_rules {
		description = "TCP access from Kubernetes Control Plane"
		protocol = "6"
		source = oci_core_subnet.prod-oke-k8sapiendpoint-subnet.cidr_block
		stateless = "false"
	}
	ingress_security_rules {
		description = "Inbound SSH traffic to worker nodes"
		protocol = "6"
		source = "0.0.0.0/0"
		stateless = "false"
    tcp_options {
      max = "22"
      min = "22"
      source_port_range {
        max = "all"
        min = "all"
      }
    }
	}
}

## ----- Test OKE Subnets and Security Lists ----- ##

resource oci_core_subnet test-oke-k8sapiendpoint-subnet {
  depends_on     = [oci_core_vcn.test-oke-vcn, oci_core_default_route_table.test-oke-public-routetable, oci_core_security_list.test-oke-k8sapiendpoint-sl]
  cidr_block = var.oke_k8sapiendpoint_subnet_cidr_block
  compartment_id = var.compartment_ocid
  vcn_id = oci_core_vcn.test-oke-vcn.id
  display_name = "${var.resource_naming_prefix}-test-oke-k8sapiendpoint-subnet"
  route_table_id =  oci_core_default_route_table.test-oke-public-routetable.id
  security_list_ids = oci_core_security_list.test-oke-k8sapiendpoint-sl.id
}

resource oci_core_subnet test-oke-service_lb-subnet {
  cidr_block = var.oke_service_lb_subnet_cidr_block
  compartment_id = var.compartment_ocid
  vcn_id = oci_core_vcn.test-oke-vcn.id
  display_name = "${var.resource_naming_prefix}-test-oke-service_lb-subnet"
  route_table_id = oci_core_default_route_table.test-oke-public-routetable.id
  security_list_ids = oci_core_security_list.test-oke-service_lb-sl.id
}

resource oci_core_subnet test-oke-nodepool-subnet {
  cidr_block = var.oke_nodepool_cidr_block
  compartment_id = var.compartment_ocid
  vcn_id = oci_core_vcn.test-oke-vcn.id
  display_name = "${var.resource_naming_prefix}-test-oke-nodepool-subnet"
  route_table_id = oci_core_route_table.test-oke-private-routetable.id
  security_list_ids = oci_core_security_list.test-oke-nodepool-sl.id
}

resource oci_core_security_list test-oke-k8sapiendpoint-sl {
  compartment_id = var.compartment_ocid
  vcn_id = oci_core_vcn.test-oke-vcn.id
  display_name = "${var.resource_naming_prefix}-test-oke-k8sapiendpoint-sl"
  
  egress_security_rules {
		description = "Allow Kubernetes Control Plane to communicate with OKE"
		destination = data.oci_core_services.all_services.services.1.cidr_block
		destination_type = "SERVICE_CIDR_BLOCK"
		protocol = "6"
		stateless = "false"
	}
	egress_security_rules {
		description = "All traffic to worker nodes"
		destination = var.oke_nodepool_cidr_block
		destination_type = "CIDR_BLOCK"
		protocol = "6"
		stateless = "false"
	}
	egress_security_rules {
		description = "Path discovery"
		destination = var.oke_nodepool_cidr_block
		destination_type = "CIDR_BLOCK"
		icmp_options {
			code = "4"
			type = "3"
		}
		protocol = "1"
		stateless = "false"
	}
	ingress_security_rules {
		description = "External access to Kubernetes API endpoint"
		protocol = "6"
		source = "0.0.0.0/0"
		stateless = "false"
	}
	ingress_security_rules {
		description = "Kubernetes worker to Kubernetes API endpoint communication"
		protocol = "6"
		source = var.oke_nodepool_cidr_block
		stateless = "false"
	}
	ingress_security_rules {
		description = "Kubernetes worker to control plane communication"
		protocol = "6"
		source = var.oke_nodepool_cidr_block
		stateless = "false"
	}
	ingress_security_rules {
		description = "Path discovery"
		icmp_options {
			code = "4"
			type = "3"
		}
		protocol = "1"
		source = var.oke_nodepool_cidr_block
		stateless = "false"
	}
}

resource oci_core_security_list test-oke-service_lb-sl {
  compartment_id = var.compartment_ocid
  vcn_id = oci_core_vcn.test-oke-vcn.id
  display_name = "${var.resource_naming_prefix}-test-oke-service_lb-sl"
}

resource oci_core_security_list test-oke-nodepool-sl {
  compartment_id = var.compartment_ocid
  vcn_id = oci_core_vcn.test-oke-vcn.id
  display_name = "${var.resource_naming_prefix}-test-oke-nodepool-sl"

  egress_security_rules {
		description = "Allow pods on one worker node to communicate with pods on other worker nodes"
		destination = var.oke_nodepool_cidr_block
		destination_type = "CIDR_BLOCK"
		protocol = "all"
		stateless = "false"
	}
	egress_security_rules {
		description = "Access to Kubernetes API Endpoint"
		destination = oci_core_subnet.test-oke-k8sapiendpoint-subnet.cidr_block
		destination_type = "CIDR_BLOCK"
		protocol = "6"
		stateless = "false"
    tcp_options {
      max = "6443"
      min = "6443"
      source_port_range {
      }
    }
	}
	egress_security_rules {
		description = "Kubernetes worker to control plane communication"
		destination = oci_core_subnet.test-oke-k8sapiendpoint-subnet.cidr_block
		destination_type = "CIDR_BLOCK"
		protocol = "6"
		stateless = "false"
    tcp_options {
      max = "12250"
      min = "12250"
      source_port_range {
        max = "all"
        min = "all"
      }
    }
	}
	egress_security_rules {
		description = "Path discovery"
		destination = oci_core_subnet.test-oke-k8sapiendpoint-subnet.cidr_block
		destination_type = "CIDR_BLOCK"
		icmp_options {
			code = "4"
			type = "3"
		}
		protocol = "1"
		stateless = "false"
	}
	egress_security_rules {
		description = "Allow nodes to communicate with OKE to ensure correct start-up and continued functioning"
		destination = data.oci_core_services.all_services.services.1.cidr_block
		destination_type = "SERVICE_CIDR_BLOCK"
		protocol = "6"
		stateless = "false"
    tcp_options {
      max = "443"
      min = "443"
      source_port_range {
        max = "all"
        min = "all"
      }
    }
	}
	egress_security_rules {
		description = "ICMP Access from Kubernetes Control Plane"
		destination = "0.0.0.0/0"
		destination_type = "CIDR_BLOCK"
		icmp_options {
			code = "4"
			type = "3"
		}
		protocol = "1"
		stateless = "false"
	}
	egress_security_rules {
		description = "Worker Nodes access to Internet"
		destination = "0.0.0.0/0"
		destination_type = "CIDR_BLOCK"
		protocol = "all"
		stateless = "false"
	}
	ingress_security_rules {
		description = "Allow pods on one worker node to communicate with pods on other worker nodes"
		protocol = "all"
		source = var.oke_nodepool_cidr_block
		stateless = "false"
	}
	ingress_security_rules {
		description = "Path discovery"
		icmp_options {
			code = "4"
			type = "3"
		}
		protocol = "1"
		source = oci_core_subnet.test-oke-k8sapiendpoint-subnet.cidr_block
		stateless = "false"
	}
	ingress_security_rules {
		description = "TCP access from Kubernetes Control Plane"
		protocol = "6"
		source = oci_core_subnet.test-oke-k8sapiendpoint-subnet.cidr_block
		stateless = "false"
	}
	ingress_security_rules {
		description = "Inbound SSH traffic to worker nodes"
		protocol = "6"
		source = "0.0.0.0/0"
		stateless = "false"
    tcp_options {
      max = "22"
      min = "22"
      source_port_range {
        max = "all"
        min = "all"
      }
    }
	}
}