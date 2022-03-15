## ----- Data Science Project ----- ##
resource oci_datascience_project mlops-datascience-proj {
  compartment_id = var.compartment_ocid
  description = "Data Science Project for MLOps"
  display_name = "${var.resource_naming_prefix}-mlops-datascience-proj"
  freeform_tags = {
    "MLOpsV1" = "V1"
  }
}

## ----- Data Science Notebook Session ----- ##

resource oci_datascience_notebook_session mlops_bank_loan_notebook {
  compartment_id = var.compartment_ocid
  display_name = "MLOps_Bank_Loan_Approval"
  project_id = oci_datascience_project.mlops-datascience-proj.id
  notebook_session_config_details {
    block_storage_size_in_gbs = "1000"
    shape     = "VM.Standard2.8"
    # subnet_id = oci_core_subnet.mlops-public-subnet.id
  }
}