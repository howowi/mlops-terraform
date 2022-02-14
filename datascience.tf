## ----- Data Science Project ----- ##
resource oci_datascience_project mlops-datascience-proj {
  compartment_id = var.compartment_ocid
  description = "Data Science Project for MLOps"
  display_name = "${var.resource_naming_prefix}-mlops-datascience-proj"
  freeform_tags = {
    "MLOpsV1" = "V1"
  }
}