resource oci_events_rule trigger-build-event {
  actions {
    actions {
      action_type = "FAAS"
      description = "trigger build pipeline function"
      function_id = oci_functions_function.trigger-build-func.id
      is_enabled  = "true"
    }
  }
  compartment_id = var.compartment_ocid
  condition      = "{\"eventType\": \"com.oraclecloud.datascience.createmodel\", \"data\": {\"compartmentId\": \"${var.compartment_ocid}\", \"resourceName\": \"MLOPS_BANK*\"}}"
  description  = "Trigger Build Pipeline when Model is created in Model Catalog"
  display_name = "Trigger Build ML Model"
  is_enabled = "true"
}
