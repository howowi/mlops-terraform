## Object Store ##

# resource oci_objectstorage_bucket export_ml-model-test-datasets {
#   access_type    = "NoPublicAccess"
#   auto_tiering   = "InfrequentAccess"
#   compartment_id = var.compartment_ocid
#   freeform_tags = {
#   }
#   metadata = {
#   }
#   name                  = "ml-model-test-datasets"
#   namespace             = data.oci_objectstorage_namespace.export_namespace.namespace
#   object_events_enabled = "false"
#   storage_tier          = "Standard"
#   versioning            = "Enabled"
# }