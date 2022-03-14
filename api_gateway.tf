## API Gateway ##

resource oci_apigateway_gateway export_prod-ml-model-api-gw {
  compartment_id = var.compartment_ocid
  display_name  = "prod-ml-model-api-gw"
  endpoint_type = "PUBLIC"
  subnet_id = oci_core_subnet.export_api-gw-public-subnet.id
}

resource oci_apigateway_gateway export_test-ml-model-api-gw {
  compartment_id = var.compartment_ocid
  display_name  = "test-ml-model-api-gw"
  endpoint_type = "PUBLIC"
  subnet_id = oci_core_subnet.export_api-gw-public-subnet.id
}

resource oci_apigateway_deployment export_prod-ml-model {
  compartment_id = var.compartment_ocid
  display_name = "prod-ml-model"
  freeform_tags = {
  }
  gateway_id  = oci_apigateway_gateway.export_prod-ml-model-api-gw.id
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
        url  = "http://152.70.155.149:8080/predict"
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
        url  = "http://152.70.155.149:8080/health"
      }
      methods = [
        "ANY",
      ]
      path = "/health"
    }
  }
}

resource oci_apigateway_deployment export_test-ml-model {
  compartment_id = var.compartment_ocid
  display_name = "test-ml-model"
  gateway_id  = oci_apigateway_gateway.export_test-ml-model-api-gw.id
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
        url  = "http://152.70.129.30:8080/predict"
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
        url  = "http://152.70.129.30:8080/health"
      }
      methods = [
        "ANY",
      ]
      path = "/health"
    }
  }
}

