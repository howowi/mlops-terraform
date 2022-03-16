# ## Vault for OCIR Secret ##

resource oci_kms_vault ml-ops-kms-vault {
  compartment_id = var.compartment_ocid
  display_name = "ml-ops-kms-vault"
  vault_type = "DEFAULT"
}

resource oci_kms_key ml-ops-kms-master-key {
  compartment_id = var.compartment_ocid
  desired_state = "ENABLED"
  display_name  = "ml-ops-kms-master-key"
  key_shape {
    algorithm = "AES"
    length    = "32"
  }
  management_endpoint = oci_kms_vault.ml-ops-kms-vault.management_endpoint
  protection_mode     = "HSM"
}

resource oci_vault_secret container-registry-auth-token {
  compartment_id = var.compartment_ocid
  key_id = oci_kms_key.ml-ops-kms-master-key.id
  vault_id       = oci_kms_vault.ml-ops-kms-vault.id
  secret_content {
      content_type = "BASE64" #Options [BASE64]
      content = var.ocir_password_base64
      name = "container-registry-auth-token"
  } 
  secret_name    = "container-registry-auth-token"
}

