resource oci_functions_application test-ml-model-func-app {
    compartment_id = var.compartment_ocid
    config = {
    "build_id" = oci_devops_build_pipeline.build-ml-model-pipeline.id
    }
    display_name = "${var.resource_naming_prefix}-test-ml-model-func-app"
    subnet_ids = [oci_core_subnet.mlops-public-subnet.id]
}

# resource oci_functions_function test-ml-model-func {
#     application_id = oci_functions_application.test-ml-model-func-app.id
#     display_name = "${var.resource_naming_prefix}-test-ml-model-func"
#     image = var.test_ml_model_func_image
#     memory_in_mbs = 256
# }

resource null_resource ocir-login {
    provisioner "local-exec" {
        command = "docker login ${var.ocir_repo} -u ${var.ocir_username} -p ${var.ocir_user_password} "
    }
}

