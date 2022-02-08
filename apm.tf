resource oci_apm_apm_domain ml-model-domain {
  compartment_id = var.compartment_ocid
  display_name = "ml-model"
  is_free_tier = "false"
}
