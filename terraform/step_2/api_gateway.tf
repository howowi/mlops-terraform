## API Gateway ##

# resource oci_apigateway_gateway export_MLOpsV1 {
#   compartment_id = var.compartment_ocid
#   display_name  = "MLOpsV1"
#   endpoint_type = "PUBLIC"
#   network_security_group_ids = [
#   ]
#   response_cache_details {
#     #authentication_secret_id = <<Optional value not found in discovery>>
#     #authentication_secret_version_number = <<Optional value not found in discovery>>
#     #connect_timeout_in_ms = <<Optional value not found in discovery>>
#     #is_ssl_enabled = <<Optional value not found in discovery>>
#     #is_ssl_verify_disabled = <<Optional value not found in discovery>>
#     #read_timeout_in_ms = <<Optional value not found in discovery>>
#     #send_timeout_in_ms = <<Optional value not found in discovery>>
#     #servers = <<Optional value not found in discovery>>
#     type = "NONE"
#   }
#   subnet_id = oci_core_subnet.export_Public-Subnet-datascience-vcn.id
# }