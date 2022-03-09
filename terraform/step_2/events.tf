# resource oci_events_rule trigger-build-event {
#   actions {
#     actions {
#       action_type = "FAAS"
#       description = "trigger build pipeline function"
#       function_id = oci_functions_function.export_trigger-build.id
#       is_enabled  = "true"
#     }
#   }
#   compartment_id = var.compartment_ocid
#   condition      = "{\"eventType\":[\"com.oraclecloud.datascience.createmodel\"],\"data\":{}}"
#   description  = "Trigger Build Pipeline when Model is created in Model Catalog"
#   display_name = "Trigger Build ML Model"
#   freeform_tags = {
#   }
#   is_enabled = "true"
# }
