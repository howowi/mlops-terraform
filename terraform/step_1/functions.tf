##----- Function to test ml model -----##

resource oci_functions_application test-ml-model-func-app {
    compartment_id = var.compartment_ocid
    config = {
    }
    display_name = "test-ml-model-func-app"
    subnet_ids = [oci_core_subnet.mlops-public-subnet.id]
}

resource oci_functions_function test-ml-model-func {
    depends_on = [null_resource.build-test-ml-model-func]
    application_id = oci_functions_application.test-ml-model-func-app.id
    display_name = "test-ml-model-func"
    image = "${var.ocir_url}/${data.oci_objectstorage_namespace.os_namespace.namespace}/${oci_artifacts_container_repository.test_mlmodel_function.display_name}:0.0.1"
    memory_in_mbs = 256
}

resource null_resource build-test-ml-model-func {
    provisioner "local-exec" {
        command = "docker login ${var.ocir_url} -u ${var.ocir_username} -p '${var.ocir_password}' "
    }

    provisioner "local-exec" {
        command = "fn build --verbose"
        working_dir = "../src/test-ml-model"
    }

    provisioner "local-exec" {
        command = "image=$(docker images | grep ${oci_artifacts_container_repository.test_mlmodel_function.display_name} | awk -F ' ' '{print $3}') ; docker tag $image ${var.ocir_url}/${data.oci_objectstorage_namespace.os_namespace.namespace}/${oci_artifacts_container_repository.test_mlmodel_function.display_name}:0.0.1"
        working_dir = "../src/test-ml-model"
    }

    provisioner "local-exec" {
        command = "docker push ${var.ocir_url}/${data.oci_objectstorage_namespace.os_namespace.namespace}/${oci_artifacts_container_repository.test_mlmodel_function.display_name}:0.0.1"
        working_dir = "../src/test-ml-model"
    }
}

##----- Function to trigger build pipeline -----##

resource oci_functions_application trigger-build-func-app {
    compartment_id = var.compartment_ocid
    config = {
        "build_id" = oci_devops_build_pipeline.build-ml-model-pipeline.id
    }
    display_name = "trigger-build-func-app"
    subnet_ids = [oci_core_subnet.mlops-public-subnet.id]
}

resource oci_functions_function trigger-build-func {
    depends_on = [null_resource.build-trigger-build-func]
    application_id = oci_functions_application.trigger-build-func-app.id
    display_name = "trigger-build-func"
    image = "${var.ocir_url}/${data.oci_objectstorage_namespace.os_namespace.namespace}/${oci_artifacts_container_repository.trigger_build_function.display_name}:0.0.1"
    memory_in_mbs = 256
}

resource null_resource build-trigger-build-func {
    provisioner "local-exec" {
        command = "docker login ${var.ocir_url} -u ${var.ocir_username} -p '${var.ocir_password}' "
    }

    provisioner "local-exec" {
        command = "fn build --verbose"
        working_dir = "../src/trigger-build"
    }

    provisioner "local-exec" {
        command = "image=$(docker images | grep ${oci_artifacts_container_repository.trigger_build_function.display_name} | awk -F ' ' '{print $3}') ; docker tag $image ${var.ocir_url}/${data.oci_objectstorage_namespace.os_namespace.namespace}/${oci_artifacts_container_repository.trigger_build_function.display_name}:0.0.1"
        working_dir = "../src/trigger-build"
    }

    provisioner "local-exec" {
        command = "docker push ${var.ocir_url}/${data.oci_objectstorage_namespace.os_namespace.namespace}/${oci_artifacts_container_repository.trigger_build_function.display_name}:0.0.1"
        working_dir = "../src/trigger-build"
    }
}
