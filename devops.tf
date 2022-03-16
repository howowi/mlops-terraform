## ----- Project ----- ##
resource "oci_ons_notification_topic" "mlops-notification-topic" {
    compartment_id = var.compartment_ocid
    name = "${var.resource_naming_prefix}-mlops-notification-topic"
}

resource "oci_ons_subscription" "test_subscription" {
    compartment_id = var.compartment_ocid
    endpoint = var.email_address
    protocol = "EMAIL"
    topic_id = oci_ons_notification_topic.mlops-notification-topic.id
}

resource "oci_devops_project" "mlops-devops-project" {
    compartment_id = var.compartment_ocid
    name = "${var.resource_naming_prefix}-mlops-devops-project"
    notification_config {
        topic_id = oci_ons_notification_topic.mlops-notification-topic.id
    }
    description = "DevOps project for MLOps"
}

## ----- Environment ----- ##
resource "oci_devops_deploy_environment" "mlops-prod-oke-environment" {
    project_id = oci_devops_project.mlops-devops-project.id
    cluster_id = oci_containerengine_cluster.prod-oke-cluster.id
    deploy_environment_type = "OKE_CLUSTER"
    description = "Production OKE Environment"
    display_name = "${var.resource_naming_prefix}-mlops-prod-oke-environment"
}

resource oci_devops_deploy_environment mlops-test-oke-environment {
    project_id = oci_devops_project.mlops-devops-project.id
    cluster_id = oci_containerengine_cluster.test-oke-cluster.id
    deploy_environment_type = "OKE_CLUSTER"
    description = "Test OKE Environment"
    display_name = "${var.resource_naming_prefix}-mlops-test-oke-environment"
}

resource "oci_devops_deploy_environment" "mlops-func-environment" {
    project_id = oci_devops_project.mlops-devops-project.id
    function_id = oci_functions_function.test-ml-model-func.id
    deploy_environment_type = "FUNCTION"
    description = "Function Environment"
    display_name = "${var.resource_naming_prefix}-mlops-func-environment"
}

## ----- Code Repo ----- ##
resource oci_devops_repository mlops-code-repo {
    name = "${var.resource_naming_prefix}-mlops-code-repo"
    project_id = oci_devops_project.mlops-devops-project.id
    default_branch = "refs/heads/main"
    description = "Code repo for MLOps"
    repository_type = "HOSTED"
}

## ----- Deployment Pipeline ----- ##
resource "oci_devops_deploy_pipeline" "mlops-deploy-pipeline" {
    project_id = oci_devops_project.mlops-devops-project.id
    deploy_pipeline_parameters {
        items {
            name = "dataset_1"
            default_value = "input_test_data_set2_true.json"
            description = "json dataset for testing"
        }
        items {
            name = "dataset_2"
            default_value = "input_test_data_set1_true.json"
            description = "json dataset for testing"
        }
        items {
            name = "bucket"
            default_value = "ml-model-test-datasets"
            description = "Object Storage bucket that contains datasets for testing"
        }
        items {
            name = "url_prod"
            default_value = "${oci_apigateway_deployment.prod-ml-model.endpoint}/predict"
            description = "Prod ML Model URL"
        }
        items {
            name = "url_test"
            default_value = "${oci_apigateway_deployment.test-ml-model.endpoint}/predict"
            description = "Test ML Model URL"
        }
    }
    description = "Deployment pipeline for MLOps"
    display_name = "${var.resource_naming_prefix}-mlops-deploy-pipeline"
}

## ----- Artifacts ----- ##
resource oci_devops_deploy_artifact k8s-manifest-artifact {
    argument_substitution_mode = "SUBSTITUTE_PLACEHOLDERS"
    deploy_artifact_source {
        deploy_artifact_source_type = "INLINE"
        base64encoded_content = "---\napiVersion: v1\nkind: Service\nmetadata:\n  name: ml-model-service\n  namespace: ml-model\nspec:\n  type: LoadBalancer\n  ports:\n  - port: 8080\n  selector:\n    app: ml-model\n---\napiVersion: apps/v1\nkind: Deployment\nmetadata:\n  name: ml-model-deployment\n  namespace: ml-model\n  labels:\n    app: ml-model\nspec:\n  replicas: 3\n  selector:\n    matchLabels:\n      app: ml-model\n  template:\n    metadata:\n      labels:\n        app: ml-model\n    spec:\n      containers:\n      - name: ml-model-container\n        image: ${var.ocir_url}/${data.oci_objectstorage_namespace.os_namespace.namespace}/mlops-model:$${BUILDRUN_HASH}\n        resources:\n          requests:\n            memory: \"500Mi\"\n            cpu: \"1000m\"\n          limits:\n            memory: \"1Gi\"\n            cpu: \"2000m\"\n        ports:\n        - containerPort: 8080\n      imagePullSecrets:\n      - name: ocir-secret\n---"
    }
    deploy_artifact_type = "KUBERNETES_MANIFEST"
    project_id = oci_devops_project.mlops-devops-project.id
    description = "K8s manifest file to deploy ML model"
    display_name = "${var.resource_naming_prefix}-k8s-manifest-artifact"
}

resource oci_devops_deploy_artifact model-testing-dataset-2 {
  argument_substitution_mode = "SUBSTITUTE_PLACEHOLDERS"
  deploy_artifact_source {
    base64encoded_content = "{\"url\":\"$${url_test}\", \"bucket\":\"$${bucket}\", \"object\":\"$${dataset_2}\"}"
    deploy_artifact_source_type = "INLINE"
  }
  deploy_artifact_type = "GENERIC_FILE"
  project_id = oci_devops_project.mlops-devops-project.id
  description = "Model Testing Dataset 2"
  display_name = "${var.resource_naming_prefix}-model-testing-dataset-2"
}

resource oci_devops_deploy_artifact model-testing-dataset-1 {
  argument_substitution_mode = "SUBSTITUTE_PLACEHOLDERS"
  deploy_artifact_source {
    base64encoded_content = "{\"url\":\"$${url_test}\", \"bucket\":\"$${bucket}\", \"object\":\"$${dataset_1}\"}"
    deploy_artifact_source_type = "INLINE"
  }
  deploy_artifact_type = "GENERIC_FILE"
  project_id = oci_devops_project.mlops-devops-project.id
  description = "Model Testing Dataset 1"
  display_name = "${var.resource_naming_prefix}-model-testing-dataset-1"
}

resource oci_devops_deploy_artifact model-testing-config {
  argument_substitution_mode = "SUBSTITUTE_PLACEHOLDERS"
  deploy_artifact_source {
    base64encoded_content = "{\"url\":\"$${url_test}\", \"bucket\":\"$${bucket}\", \"object\":\"$${object}\"}"
    deploy_artifact_source_type = "INLINE"
  }
  deploy_artifact_type = "GENERIC_FILE"
  project_id = oci_devops_project.mlops-devops-project.id
  description = "Model Testing Configuration"
  display_name = "${var.resource_naming_prefix}-model-testing-config"
}

## ----- Deployment Stages ----- ## 
resource oci_devops_deploy_stage deploy-test-oke-stage {
    deploy_pipeline_id = oci_devops_deploy_pipeline.mlops-deploy-pipeline.id
    deploy_stage_predecessor_collection {
        items {
            id = oci_devops_deploy_pipeline.mlops-deploy-pipeline.id
        }
    }
    deploy_stage_type = "OKE_DEPLOYMENT"
    description = "Deploy ML Model to Test Env"
    display_name = "deploy-test-oke-stage"
    kubernetes_manifest_deploy_artifact_ids = [oci_devops_deploy_artifact.k8s-manifest-artifact.id]
    oke_cluster_deploy_environment_id = oci_devops_deploy_environment.mlops-test-oke-environment.id
    rollback_policy {
        policy_type = "NO_STAGE_ROLLBACK_POLICY"
    }
}

resource oci_devops_deploy_stage test-ml-model-dataset-1 {
  deploy_artifact_id = oci_devops_deploy_artifact.model-testing-dataset-1.id
  deploy_pipeline_id = oci_devops_deploy_pipeline.mlops-deploy-pipeline.id
  deploy_stage_predecessor_collection {
    items {
      id = oci_devops_deploy_stage.deploy-test-oke-stage.id
    }
  }
  deploy_stage_type = "INVOKE_FUNCTION"
  description  = "Test ML Model Dataset 1"
  display_name = "test-ml-model-dataset-1"
  function_deploy_environment_id = oci_devops_deploy_environment.mlops-func-environment.id
  is_async              = "false"
  is_validation_enabled = "true"
}

resource oci_devops_deploy_stage test-ml-model-dataset-2 {
  deploy_artifact_id = oci_devops_deploy_artifact.model-testing-dataset-2.id
  deploy_pipeline_id = oci_devops_deploy_pipeline.mlops-deploy-pipeline.id
  deploy_stage_predecessor_collection {
    items {
      id = oci_devops_deploy_stage.deploy-test-oke-stage.id
    }
  }
  deploy_stage_type = "INVOKE_FUNCTION"
  description  = "Test ML Model Dataset 2"
  display_name = "test-ml-model-dataset-2"
  function_deploy_environment_id = oci_devops_deploy_environment.mlops-func-environment.id
  is_async              = "false"
  is_validation_enabled = "true"
}

resource oci_devops_deploy_stage approval-deploy-to-prod {
  approval_policy {
    approval_policy_type         = "COUNT_BASED_APPROVAL"
    number_of_approvals_required = "1"
  }
  deploy_pipeline_id = oci_devops_deploy_pipeline.mlops-deploy-pipeline.id
  deploy_stage_predecessor_collection {
    items {
      id = oci_devops_deploy_stage.test-ml-model-dataset-1.id
    }
    items {
      id = oci_devops_deploy_stage.test-ml-model-dataset-2.id
    }
  }
  deploy_stage_type = "MANUAL_APPROVAL"
  description  = "Approval to deploy to Prod Env"
  display_name = "approval-deploy-to-prod"
}

resource oci_devops_deploy_stage deploy-prod-oke-stage {
    deploy_pipeline_id = oci_devops_deploy_pipeline.mlops-deploy-pipeline.id
    deploy_stage_predecessor_collection {
        items {
            id = oci_devops_deploy_stage.approval-deploy-to-prod.id
        }
    }
    deploy_stage_type = "OKE_DEPLOYMENT"
    description = "Deploy ML Model to Prod Env"
    display_name = "deploy-prod-oke-stage"
    kubernetes_manifest_deploy_artifact_ids = [oci_devops_deploy_artifact.k8s-manifest-artifact.id]
    oke_cluster_deploy_environment_id = oci_devops_deploy_environment.mlops-prod-oke-environment.id
    rollback_policy {
        policy_type = "NO_STAGE_ROLLBACK_POLICY"
    }
}

## ----- Build Pipeline ----- ## 
resource oci_devops_build_pipeline build-ml-model-pipeline {
  build_pipeline_parameters {
    items {
      default_value = oci_datascience_project.mlops-datascience-proj.id
      description   = "Data Science Project ID"
      name          = "PROJ_ID"
    }
    items {
      default_value = "MLOPS_BANK_LOAN_Prediction"
      description   = "ML Model Display Name"
      name          = "DISP_NAME"
    }
    items {
      default_value = var.compartment_ocid
      description   = "AnalyticsBD compartment"
      name          = "COMPARTMENT_ID"
    }
  }
  description  = "build ML Model Container"
  display_name = "build-ml-model-pipeline"
  project_id = oci_devops_project.mlops-devops-project.id
}

## ----- Build Stages ----- ##

resource oci_devops_build_pipeline_stage build-test-ml-model-stage {
  build_pipeline_id = oci_devops_build_pipeline.build-ml-model-pipeline.id
  build_pipeline_stage_predecessor_collection {
    items {
      id = oci_devops_build_pipeline.build-ml-model-pipeline.id
    }
  }
  build_pipeline_stage_type = "BUILD"
  build_source_collection {
    items {
      branch = "main"
      connection_type = "DEVOPS_CODE_REPOSITORY"
      name            = "main"
      repository_id   = oci_devops_repository.mlops-code-repo.id
      repository_url  = oci_devops_repository.mlops-code-repo.http_url
    }
  }
  build_spec_file = "build/build_spec.yml"
  description  = "build and test ML Model"
  display_name = "build-test-ml-model-stage"
  image = "OL7_X86_64_STANDARD_10"
  primary_build_source               = "main"
  stage_execution_timeout_in_seconds = "36000"
}

resource oci_devops_build_pipeline_stage trigger-deployment-pipeline {
  build_pipeline_id = oci_devops_build_pipeline.build-ml-model-pipeline.id
  build_pipeline_stage_predecessor_collection {
    items {
      id = oci_devops_build_pipeline_stage.build-test-ml-model-stage.id
    }
  }
  build_pipeline_stage_type = "TRIGGER_DEPLOYMENT_PIPELINE"
  deploy_pipeline_id = oci_devops_deploy_pipeline.mlops-deploy-pipeline.id
  description        = "Trigger Deployment Pipeline"
  display_name       = "trigger-deployment-pipeline"
  is_pass_all_parameters_enabled = "true"
}