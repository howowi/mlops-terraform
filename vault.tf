# ## Vault for OCIR Secret ##

# resource oci_vault_secret export_secret_1 {
#   compartment_id = var.compartment_ocid
#   key_id = "ocid1.key.oc1.iad.bzqybfaqaahqg.abuwcljr2vxnzb244vaaqh573xoysdfgqdqdthhvpp3wbijjci5b4cevgvyq"
#   secret_content = "<placeholder for missing required attribute>" #Required attribute not found in discovery, placeholder value set to avoid plan failure
#   secret_name    = "container-registry-auth-token"
#   vault_id       = oci_kms_vault.export_container-registry-auth-token.id
#   lifecycle {
#     ignore_changes = [secret_content]
#   }
# }

# resource oci_kms_vault export_container-registry-auth-token {
#   compartment_id = var.compartment_ocid
#   display_name = "container-registry-auth-token"
#   vault_type = "DEFAULT"
# }

# resource oci_kms_key export_master-key {
#   compartment_id = var.compartment_ocid
#   desired_state = "ENABLED"
#   display_name  = "master-key"
#   key_shape {
#     algorithm = "AES"
#     curve_id  = ""
#     length    = "32"
#   }
#   management_endpoint = "https://bzqybfaqaahqg-management.kms.us-ashburn-1.oraclecloud.com"
#   protection_mode     = "HSM"
# }

