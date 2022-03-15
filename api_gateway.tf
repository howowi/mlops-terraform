## API Gateway ##

resource oci_apigateway_gateway prod-ml-model-api-gw {
  compartment_id = var.compartment_ocid
  display_name  = "${var.resource_naming_prefix}-prod-ml-model-api-gw"
  endpoint_type = "PUBLIC"
  subnet_id = oci_core_subnet.mlops-public-subnet.id
}

resource oci_apigateway_gateway test-ml-model-api-gw {
  compartment_id = var.compartment_ocid
  display_name  = "${var.resource_naming_prefix}-test-ml-model-api-gw"
  endpoint_type = "PUBLIC"
  subnet_id = oci_core_subnet.mlops-public-subnet.id
}

resource oci_apigateway_deployment prod-ml-model {
  compartment_id = var.compartment_ocid
  display_name = "${var.resource_naming_prefix}-prod-ml-model-api"
  gateway_id  = oci_apigateway_gateway.prod-ml-model-api-gw.id
  path_prefix = "/v1"
  specification {
    logging_policies {
      execution_log {
        is_enabled = "true"
        log_level  = "INFO"
      }
    }
    routes {
      backend {
        connect_timeout_in_seconds = "60"
        is_ssl_verify_disabled  = "true"
        read_timeout_in_seconds = "10"
        send_timeout_in_seconds = "10"
        type = "HTTP_BACKEND"
        url  = data.local_file.prod_model_predict_url.content
      }
      methods = [
        "ANY",
      ]
      path = "/predict"
    }
    routes {
      backend {
        connect_timeout_in_seconds = "60"
        is_ssl_verify_disabled  = "true"
        read_timeout_in_seconds = "10"
        send_timeout_in_seconds = "10"
        type = "HTTP_BACKEND"
        url  = data.local_file.prod_model_health_url.content
      }
      methods = [
        "ANY",
      ]
      path = "/health"
    }
  }
}

resource oci_apigateway_deployment test-ml-model {
  compartment_id = var.compartment_ocid
  display_name = "${var.resource_naming_prefix}-test-ml-model-api"
  gateway_id  = oci_apigateway_gateway.test-ml-model-api-gw.id
  path_prefix = "/v1"
  specification {
    logging_policies {
      execution_log {
        is_enabled = "true"
        log_level  = "INFO"
      }
    }
    routes {
      backend {
        connect_timeout_in_seconds = "60"
        is_ssl_verify_disabled  = "true"
        read_timeout_in_seconds = "10"
        send_timeout_in_seconds = "10"
        type = "HTTP_BACKEND"
        url  = data.local_file.test_model_predict_url.content
      }
      methods = [
        "ANY",
      ]
      path = "/predict"
    }
    routes {
      backend {
        connect_timeout_in_seconds = "60"
        is_ssl_verify_disabled  = "true"
        read_timeout_in_seconds = "10"
        send_timeout_in_seconds = "10"
        type = "HTTP_BACKEND"
        url  = data.local_file.test_model_health_url.content
      }
      methods = [
        "ANY",
      ]
      path = "/health"
    }
  }
}

