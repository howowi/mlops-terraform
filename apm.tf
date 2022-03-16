## APM ##

resource oci_apm_apm_domain ml-model-domain {
  compartment_id = var.compartment_ocid
  description = "Monitor ML Model API Performance"
  display_name = "ml-model-domain"
  is_free_tier = "false"
}

resource oci_apm_synthetics_monitor test-ml-model-monitor {
    #Required
    apm_domain_id = oci_apm_apm_domain.ml-model-domain.id
    display_name = "test-ml-model-monitor"
    monitor_type = "REST"
    repeat_interval_in_seconds = "300"
    vantage_points = ["OraclePublic-ap-sydney-1", "OraclePublic-ap-singapore-1", "OraclePublic-us-phoenix-1" ]

    configuration {
        config_type = "REST_CONFIG" #Options [BROWSER_CONFIG REST_CONFIG SCRIPTED_BROWSER_CONFIG SCRIPTED_REST_CONFIG]
        is_certificate_validation_enabled = "false"
        is_failure_retried = "true"
        is_redirection_enabled = "false"
        network_configuration {
            probe_mode = "SACK"
            probe_per_hop = "3"
            protocol = "TCP"
        }
        request_method = "GET"
        verify_response_codes = ["200"]
    }
    is_run_once = "false"
    status = "ENABLED"
    target = "${oci_apigateway_deployment.test-ml-model.endpoint}/health"
    timeout_in_seconds = "60"
}

resource oci_apm_synthetics_monitor prod-ml-model-monitor {
    #Required
    apm_domain_id = oci_apm_apm_domain.ml-model-domain.id
    display_name = "prod-ml-model-monitor"
    monitor_type = "REST"
    repeat_interval_in_seconds = "300"
    vantage_points = ["OraclePublic-ap-sydney-1", "OraclePublic-ap-singapore-1", "OraclePublic-us-phoenix-1" ]

    configuration {
        config_type = "REST_CONFIG" #Options [BROWSER_CONFIG REST_CONFIG SCRIPTED_BROWSER_CONFIG SCRIPTED_REST_CONFIG]
        is_certificate_validation_enabled = "false"
        is_failure_retried = "true"
        is_redirection_enabled = "false"
        network_configuration {
            probe_mode = "SACK"
            probe_per_hop = "3"
            protocol = "TCP"
        }
        request_method = "GET"
        verify_response_codes = ["200"]
    }
    is_run_once = "false"
    status = "ENABLED"
    target = "${oci_apigateway_deployment.prod-ml-model.endpoint}/health"
    timeout_in_seconds = "60"
}


