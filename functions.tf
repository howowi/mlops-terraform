resource oci_functions_application test-ml-model-func-app {
    compartment_id = var.compartment_ocid
    display_name = "${var.resource_naming_prefix}-test-ml-model-func-app"
    subnet_ids = [oci_core_subnet.mlops-public-subnet.id]
}

resource oci_functions_function test-ml-model-func {
    application_id = oci_functions_application.test-ml-model-func-app.id
    display_name = "${var.resource_naming_prefix}-test-ml-model-func"
    image = var.test_ml_model_func_image
    memory_in_mbs = 256
}