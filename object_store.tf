## Object Store ##

resource oci_objectstorage_bucket ml-model-test-datasets {
  access_type    = "NoPublicAccess"
  auto_tiering   = "InfrequentAccess"
  compartment_id = var.compartment_ocid
  name                  = "${var.resource_naming_prefix}-ml-model-test-datasets-buckets"
  namespace             = data.oci_objectstorage_namespace.os_namespace.namespace
  object_events_enabled = "false"
  storage_tier          = "Standard"
}

data local_file input_test_data_set1_false {
    filename = "files/input_test_data_set1_false.json"
}

resource oci_objectstorage_object ml-model-test-datasets_object_1 {
  depends_on = [oci_objectstorage_bucket.ml-model-test-datasets]
  bucket = oci_objectstorage_bucket.ml-model-test-datasets.name
  content = data.local_file.input_test_data_set1_false.content
  content_type = "application/json"
  namespace = data.oci_objectstorage_namespace.os_namespace.namespace
  object    = "input_test_data_set1_false.json"
  storage_tier = "Standard"
}

data local_file input_test_data_set2_true {
    filename = "files/input_test_data_set2_true.json"
}

resource oci_objectstorage_object ml-model-test-datasets_object_2 {
  depends_on = [oci_objectstorage_bucket.ml-model-test-datasets]
  bucket = oci_objectstorage_bucket.ml-model-test-datasets.name
  content = data.local_file.input_test_data_set2_true.content
  content_type = "application/json"
  namespace = data.oci_objectstorage_namespace.os_namespace.namespace
  object    = "input_test_data_set2_true.json"
  storage_tier = "Standard"
}