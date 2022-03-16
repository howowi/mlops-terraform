## Oracle Analytics Cloud ##

resource oci_analytics_analytics_instance mlops-monitoring-oac {
    count = var.create_oac ? 1 : 0
    capacity {
        capacity_type  = "USER_COUNT"
        capacity_value = "10"
    }
    compartment_id = var.compartment_ocid
    description = "OAC Dashboard for ML Model Monitoring"
    feature_set = "ENTERPRISE_ANALYTICS"
    idcs_access_token = var.idsc_access_token
    license_type      = "LICENSE_INCLUDED"
    name              = "MLOpsMonitoring"
    network_endpoint_details {
        network_endpoint_type = "PUBLIC"
    }
    state = "ACTIVE"
}