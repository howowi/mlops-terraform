output prod-ml-model-predict-endpoint {
  value = "${oci_apigateway_deployment.prod-ml-model.endpoint}/predict"
}

output test-ml-model-predict-endpoint {
  value = "${oci_apigateway_deployment.test-ml-model.endpoint}/predict"
}

output devops-code-repo-url {
    value = oci_devops_repository.mlops-code-repo.http_url
}

output ml-model-container-repo-path {
    value = "${var.ocir_url}/${data.oci_objectstorage_namespace.os_namespace.namespace}/${oci_artifacts_container_repository.mlops_model.display_name}"
}

output container-reg-auth-token-id {
    value = oci_vault_secret.container-registry-auth-token.id
}