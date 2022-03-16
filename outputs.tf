output prod-ml-model-predict-endpoint {
  value = "${oci_apigateway_deployment.prod-ml-model.endpoint}/predict"
}

output test-ml-model-predict-endpoint {
  value = "${oci_apigateway_deployment.test-ml-model.endpoint}/predict"
}

output devops-code-repo-url {
    value = oci_devops_repository.mlops-code-repo.http_url
}