resource oci_core_subnet export_api-gw-public-subnet {
  #availability_domain = <<Optional value not found in discovery>>
  cidr_block     = "10.0.1.0/24"
  compartment_id = var.compartment_ocid
  defined_tags = {
    "Oracle-Tags.CreatedBy"   = "oracleidentitycloudservice/howie.owi@oracle.com"
    "Oracle-Tags.CreatedOn"   = "2021-11-04T15:27:29.949Z"
    "Oracle-Tags.CreatorType" = "user"
  }
  dhcp_options_id = oci_core_vcn.export_phoenix-mlops-vcn.default_dhcp_options_id
  display_name    = "api-gw-public-subnet"
  dns_label       = "apigwpublicsubn"
  freeform_tags = {
  }
  #ipv6cidr_block = <<Optional value not found in discovery>>
  prohibit_internet_ingress  = "false"
  prohibit_public_ip_on_vnic = "false"
  route_table_id             = oci_core_route_table.export_public-route-table.id
  security_list_ids = [
    oci_core_security_list.export_api-gw-security-list.id,
  ]
  vcn_id = oci_core_vcn.export_phoenix-mlops-vcn.id
}

resource oci_core_subnet export_oke-k8sApiEndpoint-subnet-quick-prod_oke_cluster_ry-21e30b072-regional {
  #availability_domain = <<Optional value not found in discovery>>
  cidr_block     = "10.0.0.0/28"
  compartment_id = var.compartment_ocid
  defined_tags = {
    "Oracle-Tags.CreatedBy"   = "oracleidentitycloudservice/rishi.r.yadav@oracle.com"
    "Oracle-Tags.CreatedOn"   = "2021-11-03T02:19:03.899Z"
    "Oracle-Tags.CreatorType" = "user"
  }
  dhcp_options_id = oci_core_vcn.export_oke-vcn-quick-prod_oke_cluster_ry-21e30b072.default_dhcp_options_id
  display_name    = "oke-k8sApiEndpoint-subnet-quick-prod_oke_cluster_ry-21e30b072-regional"
  dns_label       = "sub8b6ac1afb"
  freeform_tags = {
  }
  #ipv6cidr_block = <<Optional value not found in discovery>>
  prohibit_internet_ingress  = "false"
  prohibit_public_ip_on_vnic = "false"
  route_table_id             = oci_core_vcn.export_oke-vcn-quick-prod_oke_cluster_ry-21e30b072.default_route_table_id
  security_list_ids = [
    oci_core_security_list.export_oke-k8sApiEndpoint-quick-prod_oke_cluster_ry-21e30b072.id,
  ]
  vcn_id = oci_core_vcn.export_oke-vcn-quick-prod_oke_cluster_ry-21e30b072.id
}

resource oci_core_subnet export_oke-nodesubnet-quick-prod_oke_cluster_ry-21e30b072-regional {
  #availability_domain = <<Optional value not found in discovery>>
  cidr_block     = "10.0.10.0/24"
  compartment_id = var.compartment_ocid
  defined_tags = {
    "Oracle-Tags.CreatedBy"   = "oracleidentitycloudservice/rishi.r.yadav@oracle.com"
    "Oracle-Tags.CreatedOn"   = "2021-11-03T02:19:03.899Z"
    "Oracle-Tags.CreatorType" = "user"
  }
  dhcp_options_id = oci_core_vcn.export_oke-vcn-quick-prod_oke_cluster_ry-21e30b072.default_dhcp_options_id
  display_name    = "oke-nodesubnet-quick-prod_oke_cluster_ry-21e30b072-regional"
  dns_label       = "sub5b734b6b8"
  freeform_tags = {
  }
  #ipv6cidr_block = <<Optional value not found in discovery>>
  prohibit_internet_ingress  = "true"
  prohibit_public_ip_on_vnic = "true"
  route_table_id             = oci_core_route_table.export_oke-private-routetable-prod_oke_cluster_ry-21e30b072.id
  security_list_ids = [
    oci_core_security_list.export_oke-nodeseclist-quick-prod_oke_cluster_ry-21e30b072.id,
  ]
  vcn_id = oci_core_vcn.export_oke-vcn-quick-prod_oke_cluster_ry-21e30b072.id
}

resource oci_core_subnet export_oke-svclbsubnet-quick-prod_oke_cluster_ry-21e30b072-regional {
  #availability_domain = <<Optional value not found in discovery>>
  cidr_block     = "10.0.20.0/24"
  compartment_id = var.compartment_ocid
  defined_tags = {
    "Oracle-Tags.CreatedBy"   = "oracleidentitycloudservice/rishi.r.yadav@oracle.com"
    "Oracle-Tags.CreatedOn"   = "2021-11-03T02:19:04.007Z"
    "Oracle-Tags.CreatorType" = "user"
  }
  dhcp_options_id = oci_core_vcn.export_oke-vcn-quick-prod_oke_cluster_ry-21e30b072.default_dhcp_options_id
  display_name    = "oke-svclbsubnet-quick-prod_oke_cluster_ry-21e30b072-regional"
  dns_label       = "lbsub92440a57e"
  freeform_tags = {
  }
  #ipv6cidr_block = <<Optional value not found in discovery>>
  prohibit_internet_ingress  = "false"
  prohibit_public_ip_on_vnic = "false"
  route_table_id             = oci_core_vcn.export_oke-vcn-quick-prod_oke_cluster_ry-21e30b072.default_route_table_id
  security_list_ids = [
    oci_core_vcn.export_oke-vcn-quick-prod_oke_cluster_ry-21e30b072.default_security_list_id,
  ]
  vcn_id = oci_core_vcn.export_oke-vcn-quick-prod_oke_cluster_ry-21e30b072.id
}

resource oci_core_subnet export_oke-k8sApiEndpoint-subnet-quick-test_oke_cluster_ry-7bc0980c4-regional {
  #availability_domain = <<Optional value not found in discovery>>
  cidr_block     = "10.0.0.0/28"
  compartment_id = var.compartment_ocid
  defined_tags = {
    "Oracle-Tags.CreatedBy"   = "oracleidentitycloudservice/rishi.r.yadav@oracle.com"
    "Oracle-Tags.CreatedOn"   = "2021-11-03T02:18:22.236Z"
    "Oracle-Tags.CreatorType" = "user"
  }
  dhcp_options_id = oci_core_vcn.export_oke-vcn-quick-test_oke_cluster_ry-7bc0980c4.default_dhcp_options_id
  display_name    = "oke-k8sApiEndpoint-subnet-quick-test_oke_cluster_ry-7bc0980c4-regional"
  dns_label       = "sub62f5b46c7"
  freeform_tags = {
  }
  #ipv6cidr_block = <<Optional value not found in discovery>>
  prohibit_internet_ingress  = "false"
  prohibit_public_ip_on_vnic = "false"
  route_table_id             = oci_core_vcn.export_oke-vcn-quick-test_oke_cluster_ry-7bc0980c4.default_route_table_id
  security_list_ids = [
    oci_core_security_list.export_oke-k8sApiEndpoint-quick-test_oke_cluster_ry-7bc0980c4.id,
  ]
  vcn_id = oci_core_vcn.export_oke-vcn-quick-test_oke_cluster_ry-7bc0980c4.id
}

resource oci_core_subnet export_oke-svclbsubnet-quick-test_oke_cluster_ry-7bc0980c4-regional {
  #availability_domain = <<Optional value not found in discovery>>
  cidr_block     = "10.0.20.0/24"
  compartment_id = var.compartment_ocid
  defined_tags = {
    "Oracle-Tags.CreatedBy"   = "oracleidentitycloudservice/rishi.r.yadav@oracle.com"
    "Oracle-Tags.CreatedOn"   = "2021-11-03T02:18:22.236Z"
    "Oracle-Tags.CreatorType" = "user"
  }
  dhcp_options_id = oci_core_vcn.export_oke-vcn-quick-test_oke_cluster_ry-7bc0980c4.default_dhcp_options_id
  display_name    = "oke-svclbsubnet-quick-test_oke_cluster_ry-7bc0980c4-regional"
  dns_label       = "lbsub59c65e1b2"
  freeform_tags = {
  }
  #ipv6cidr_block = <<Optional value not found in discovery>>
  prohibit_internet_ingress  = "false"
  prohibit_public_ip_on_vnic = "false"
  route_table_id             = oci_core_vcn.export_oke-vcn-quick-test_oke_cluster_ry-7bc0980c4.default_route_table_id
  security_list_ids = [
    oci_core_vcn.export_oke-vcn-quick-test_oke_cluster_ry-7bc0980c4.default_security_list_id,
  ]
  vcn_id = oci_core_vcn.export_oke-vcn-quick-test_oke_cluster_ry-7bc0980c4.id
}

resource oci_core_subnet export_oke-nodesubnet-quick-test_oke_cluster_ry-7bc0980c4-regional {
  #availability_domain = <<Optional value not found in discovery>>
  cidr_block     = "10.0.10.0/24"
  compartment_id = var.compartment_ocid
  defined_tags = {
    "Oracle-Tags.CreatedBy"   = "oracleidentitycloudservice/rishi.r.yadav@oracle.com"
    "Oracle-Tags.CreatedOn"   = "2021-11-03T02:18:22.233Z"
    "Oracle-Tags.CreatorType" = "user"
  }
  dhcp_options_id = oci_core_vcn.export_oke-vcn-quick-test_oke_cluster_ry-7bc0980c4.default_dhcp_options_id
  display_name    = "oke-nodesubnet-quick-test_oke_cluster_ry-7bc0980c4-regional"
  dns_label       = "sub5bc341409"
  freeform_tags = {
  }
  #ipv6cidr_block = <<Optional value not found in discovery>>
  prohibit_internet_ingress  = "true"
  prohibit_public_ip_on_vnic = "true"
  route_table_id             = oci_core_route_table.export_oke-private-routetable-test_oke_cluster_ry-7bc0980c4.id
  security_list_ids = [
    oci_core_security_list.export_oke-nodeseclist-quick-test_oke_cluster_ry-7bc0980c4.id,
  ]
  vcn_id = oci_core_vcn.export_oke-vcn-quick-test_oke_cluster_ry-7bc0980c4.id
}

resource oci_core_security_list export_api-gw-security-list {
  compartment_id = var.compartment_ocid
  defined_tags = {
    "Oracle-Tags.CreatedBy"   = "oracleidentitycloudservice/howie.owi@oracle.com"
    "Oracle-Tags.CreatedOn"   = "2021-11-04T15:28:40.414Z"
    "Oracle-Tags.CreatorType" = "user"
  }
  display_name = "api-gw-security-list"
  egress_security_rules {
    #description = <<Optional value not found in discovery>>
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "all"
    stateless = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  freeform_tags = {
  }
  ingress_security_rules {
    #description = <<Optional value not found in discovery>>
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "all"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  vcn_id = oci_core_vcn.export_phoenix-mlops-vcn.id
}

resource oci_core_default_security_list export_Default-Security-List-for-phoenix-mlops-vcn {
  compartment_id = var.compartment_ocid
  defined_tags = {
    "Oracle-Tags.CreatedBy"   = "oracleidentitycloudservice/howie.owi@oracle.com"
    "Oracle-Tags.CreatedOn"   = "2021-11-04T15:24:47.552Z"
    "Oracle-Tags.CreatorType" = "user"
  }
  display_name = "Default Security List for phoenix-mlops-vcn"
  egress_security_rules {
    #description = <<Optional value not found in discovery>>
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "all"
    stateless = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  freeform_tags = {
  }
  ingress_security_rules {
    #description = <<Optional value not found in discovery>>
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "22"
      min = "22"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    #description = <<Optional value not found in discovery>>
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol    = "1"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    #description = <<Optional value not found in discovery>>
    icmp_options {
      code = "-1"
      type = "3"
    }
    protocol    = "1"
    source      = "10.0.0.0/16"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  manage_default_resource_id = oci_core_vcn.export_phoenix-mlops-vcn.default_security_list_id
}
resource oci_core_security_list export_oke-k8sApiEndpoint-quick-prod_oke_cluster_ry-21e30b072 {
  compartment_id = var.compartment_ocid
  defined_tags = {
    "Oracle-Tags.CreatedBy"   = "oracleidentitycloudservice/rishi.r.yadav@oracle.com"
    "Oracle-Tags.CreatedOn"   = "2021-11-03T02:19:01.123Z"
    "Oracle-Tags.CreatorType" = "user"
  }
  display_name = "oke-k8sApiEndpoint-quick-prod_oke_cluster_ry-21e30b072"
  egress_security_rules {
    description      = "Allow Kubernetes Control Plane to communicate with OKE"
    destination      = "all-phx-services-in-oracle-services-network"
    destination_type = "SERVICE_CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "6"
    stateless = "false"
    tcp_options {
      max = "443"
      min = "443"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  egress_security_rules {
    description      = "All traffic to worker nodes"
    destination      = "10.0.10.0/24"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "6"
    stateless = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  egress_security_rules {
    description      = "Path discovery"
    destination      = "10.0.10.0/24"
    destination_type = "CIDR_BLOCK"
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol  = "1"
    stateless = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  freeform_tags = {
  }
  ingress_security_rules {
    description = "External access to Kubernetes API endpoint"
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "6443"
      min = "6443"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Kubernetes worker to Kubernetes API endpoint communication"
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "10.0.10.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "6443"
      min = "6443"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Kubernetes worker to control plane communication"
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "10.0.10.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "12250"
      min = "12250"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Path discovery"
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol    = "1"
    source      = "10.0.10.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  vcn_id = oci_core_vcn.export_oke-vcn-quick-prod_oke_cluster_ry-21e30b072.id
}

resource oci_core_security_list export_oke-nodeseclist-quick-prod_oke_cluster_ry-21e30b072 {
  compartment_id = var.compartment_ocid
  defined_tags = {
    "Oracle-Tags.CreatedBy"   = "oracleidentitycloudservice/rishi.r.yadav@oracle.com"
    "Oracle-Tags.CreatedOn"   = "2021-11-03T02:19:01.110Z"
    "Oracle-Tags.CreatorType" = "user"
  }
  display_name = "oke-nodeseclist-quick-prod_oke_cluster_ry-21e30b072"
  egress_security_rules {
    description      = "Allow pods on one worker node to communicate with pods on other worker nodes"
    destination      = "10.0.10.0/24"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "all"
    stateless = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  egress_security_rules {
    description      = "Access to Kubernetes API Endpoint"
    destination      = "10.0.0.0/28"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "6"
    stateless = "false"
    tcp_options {
      max = "6443"
      min = "6443"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  egress_security_rules {
    description      = "Kubernetes worker to control plane communication"
    destination      = "10.0.0.0/28"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "6"
    stateless = "false"
    tcp_options {
      max = "12250"
      min = "12250"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  egress_security_rules {
    description      = "Path discovery"
    destination      = "10.0.0.0/28"
    destination_type = "CIDR_BLOCK"
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol  = "1"
    stateless = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  egress_security_rules {
    description      = "Allow nodes to communicate with OKE to ensure correct start-up and continued functioning"
    destination      = "all-phx-services-in-oracle-services-network"
    destination_type = "SERVICE_CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "6"
    stateless = "false"
    tcp_options {
      max = "443"
      min = "443"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  egress_security_rules {
    description      = "ICMP Access from Kubernetes Control Plane"
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol  = "1"
    stateless = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  egress_security_rules {
    description      = "Worker Nodes access to Internet"
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "all"
    stateless = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  freeform_tags = {
  }
  ingress_security_rules {
    description = "Allow pods on one worker node to communicate with pods on other worker nodes"
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "all"
    source      = "10.0.10.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Path discovery"
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol    = "1"
    source      = "10.0.0.0/28"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "TCP access from Kubernetes Control Plane"
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "10.0.0.0/28"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Inbound SSH traffic to worker nodes"
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "22"
      min = "22"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    #description = <<Optional value not found in discovery>>
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "10.0.20.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "10256"
      min = "10256"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    #description = <<Optional value not found in discovery>>
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "10.0.20.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "31593"
      min = "31593"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  vcn_id = oci_core_vcn.export_oke-vcn-quick-prod_oke_cluster_ry-21e30b072.id
}

resource oci_core_default_security_list export_oke-svclbseclist-quick-prod_oke_cluster_ry-21e30b072 {
  compartment_id = var.compartment_ocid
  defined_tags = {
    "Oracle-Tags.CreatedBy"   = "oracleidentitycloudservice/rishi.r.yadav@oracle.com"
    "Oracle-Tags.CreatedOn"   = "2021-11-03T02:18:59.468Z"
    "Oracle-Tags.CreatorType" = "user"
  }
  display_name = "oke-svclbseclist-quick-prod_oke_cluster_ry-21e30b072"
  egress_security_rules {
    #description = <<Optional value not found in discovery>>
    destination      = "10.0.10.0/24"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "6"
    stateless = "false"
    tcp_options {
      max = "10256"
      min = "10256"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  egress_security_rules {
    #description = <<Optional value not found in discovery>>
    destination      = "10.0.10.0/24"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "6"
    stateless = "false"
    tcp_options {
      max = "31593"
      min = "31593"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  freeform_tags = {
  }
  ingress_security_rules {
    #description = <<Optional value not found in discovery>>
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "8080"
      min = "8080"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  manage_default_resource_id = oci_core_vcn.export_oke-vcn-quick-prod_oke_cluster_ry-21e30b072.default_security_list_id
}
resource oci_core_security_list export_oke-nodeseclist-quick-test_oke_cluster_ry-7bc0980c4 {
  compartment_id = var.compartment_ocid
  defined_tags = {
    "Oracle-Tags.CreatedBy"   = "oracleidentitycloudservice/rishi.r.yadav@oracle.com"
    "Oracle-Tags.CreatedOn"   = "2021-11-03T02:18:18.988Z"
    "Oracle-Tags.CreatorType" = "user"
  }
  display_name = "oke-nodeseclist-quick-test_oke_cluster_ry-7bc0980c4"
  egress_security_rules {
    description      = "Allow pods on one worker node to communicate with pods on other worker nodes"
    destination      = "10.0.10.0/24"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "all"
    stateless = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  egress_security_rules {
    description      = "Access to Kubernetes API Endpoint"
    destination      = "10.0.0.0/28"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "6"
    stateless = "false"
    tcp_options {
      max = "6443"
      min = "6443"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  egress_security_rules {
    description      = "Kubernetes worker to control plane communication"
    destination      = "10.0.0.0/28"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "6"
    stateless = "false"
    tcp_options {
      max = "12250"
      min = "12250"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  egress_security_rules {
    description      = "Path discovery"
    destination      = "10.0.0.0/28"
    destination_type = "CIDR_BLOCK"
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol  = "1"
    stateless = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  egress_security_rules {
    description      = "Allow nodes to communicate with OKE to ensure correct start-up and continued functioning"
    destination      = "all-phx-services-in-oracle-services-network"
    destination_type = "SERVICE_CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "6"
    stateless = "false"
    tcp_options {
      max = "443"
      min = "443"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  egress_security_rules {
    description      = "ICMP Access from Kubernetes Control Plane"
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol  = "1"
    stateless = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  egress_security_rules {
    description      = "Worker Nodes access to Internet"
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "all"
    stateless = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  freeform_tags = {
  }
  ingress_security_rules {
    description = "Allow pods on one worker node to communicate with pods on other worker nodes"
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "all"
    source      = "10.0.10.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Path discovery"
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol    = "1"
    source      = "10.0.0.0/28"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "TCP access from Kubernetes Control Plane"
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "10.0.0.0/28"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Inbound SSH traffic to worker nodes"
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "22"
      min = "22"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    #description = <<Optional value not found in discovery>>
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "10.0.20.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "10256"
      min = "10256"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    #description = <<Optional value not found in discovery>>
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "10.0.20.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "31439"
      min = "31439"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    #description = <<Optional value not found in discovery>>
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "10.0.20.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "30756"
      min = "30756"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    #description = <<Optional value not found in discovery>>
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "10.0.20.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "31750"
      min = "31750"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  vcn_id = oci_core_vcn.export_oke-vcn-quick-test_oke_cluster_ry-7bc0980c4.id
}

resource oci_core_security_list export_oke-k8sApiEndpoint-quick-test_oke_cluster_ry-7bc0980c4 {
  compartment_id = var.compartment_ocid
  defined_tags = {
    "Oracle-Tags.CreatedBy"   = "oracleidentitycloudservice/rishi.r.yadav@oracle.com"
    "Oracle-Tags.CreatedOn"   = "2021-11-03T02:18:18.914Z"
    "Oracle-Tags.CreatorType" = "user"
  }
  display_name = "oke-k8sApiEndpoint-quick-test_oke_cluster_ry-7bc0980c4"
  egress_security_rules {
    description      = "Allow Kubernetes Control Plane to communicate with OKE"
    destination      = "all-phx-services-in-oracle-services-network"
    destination_type = "SERVICE_CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "6"
    stateless = "false"
    tcp_options {
      max = "443"
      min = "443"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  egress_security_rules {
    description      = "All traffic to worker nodes"
    destination      = "10.0.10.0/24"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "6"
    stateless = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  egress_security_rules {
    description      = "Path discovery"
    destination      = "10.0.10.0/24"
    destination_type = "CIDR_BLOCK"
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol  = "1"
    stateless = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  freeform_tags = {
  }
  ingress_security_rules {
    description = "External access to Kubernetes API endpoint"
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "6443"
      min = "6443"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Kubernetes worker to Kubernetes API endpoint communication"
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "10.0.10.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "6443"
      min = "6443"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Kubernetes worker to control plane communication"
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "10.0.10.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "12250"
      min = "12250"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Path discovery"
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol    = "1"
    source      = "10.0.10.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  vcn_id = oci_core_vcn.export_oke-vcn-quick-test_oke_cluster_ry-7bc0980c4.id
}

resource oci_core_default_security_list export_oke-svclbseclist-quick-test_oke_cluster_ry-7bc0980c4 {
  compartment_id = var.compartment_ocid
  defined_tags = {
    "Oracle-Tags.CreatedBy"   = "oracleidentitycloudservice/rishi.r.yadav@oracle.com"
    "Oracle-Tags.CreatedOn"   = "2021-11-03T02:18:16.964Z"
    "Oracle-Tags.CreatorType" = "user"
  }
  display_name = "oke-svclbseclist-quick-test_oke_cluster_ry-7bc0980c4"
  egress_security_rules {
    #description = <<Optional value not found in discovery>>
    destination      = "10.0.10.0/24"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "6"
    stateless = "false"
    tcp_options {
      max = "10256"
      min = "10256"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  egress_security_rules {
    #description = <<Optional value not found in discovery>>
    destination      = "10.0.10.0/24"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "6"
    stateless = "false"
    tcp_options {
      max = "31439"
      min = "31439"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  egress_security_rules {
    #description = <<Optional value not found in discovery>>
    destination      = "10.0.10.0/24"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "6"
    stateless = "false"
    tcp_options {
      max = "30756"
      min = "30756"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  egress_security_rules {
    #description = <<Optional value not found in discovery>>
    destination      = "10.0.10.0/24"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "6"
    stateless = "false"
    tcp_options {
      max = "31750"
      min = "31750"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  freeform_tags = {
  }
  ingress_security_rules {
    #description = <<Optional value not found in discovery>>
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "8080"
      min = "8080"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    #description = <<Optional value not found in discovery>>
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "80"
      min = "80"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    #description = <<Optional value not found in discovery>>
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "443"
      min = "443"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  manage_default_resource_id = oci_core_vcn.export_oke-vcn-quick-test_oke_cluster_ry-7bc0980c4.default_security_list_id
}

