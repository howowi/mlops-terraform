## API Gateway ##

resource "null_resource" "check_data_output_test" {
  depends_on = [null_resource.get_model_ip_test]
    triggers  =  { 
        always_run = "${timestamp()}" 
    }
    provisioner "local-exec" {
        command = "cat data/test_model_ip.txt"
        interpreter = [ "/bin/bash","-c"]
    }
}

resource "null_resource" "check_data_output_prod" {
  depends_on = [null_resource.get_model_ip_prod]
    triggers  =  { 
        always_run = "${timestamp()}" 
    }
    provisioner "local-exec" {
        command = "cat data/prod_model_ip.txt"
        interpreter = [ "/bin/bash","-c"]
    }
}

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
  depends_on = [data.local_file.prod_model_ip, null_resource.check_data_output_prod]
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
        url  = "http://${data.local_file.prod_model_ip.content}:8080/predict"
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
        url  = "http://${data.local_file.prod_model_ip.content}:8080/health"
      }
      methods = [
        "ANY",
      ]
      path = "/health"
    }
  }
}

resource oci_apigateway_deployment test-ml-model {
  depends_on = [data.local_file.test_model_ip, null_resource.check_data_output_test]
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
        url  = "http://${data.local_file.test_model_ip.content}:8080/predict"
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
        url  = "http://${data.local_file.test_model_ip.content}:8080/health"
      }
      methods = [
        "ANY",
      ]
      path = "/health"
    }
  }
}

