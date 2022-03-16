output prod-ml-model-endpoint {
  value = oci_apigateway_deployment.prod-ml-model.endpoint
}

output test-ml-model-endpoint {
  value = oci_apigateway_deployment.test-ml-model.endpoint
}

output devops-code-repo-url {
    value = oci_devops_repository.mlops-code-repo.http_url
}