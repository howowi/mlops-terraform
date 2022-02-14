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
    repository_type = "Hosted"
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
            # default_value = "ml-model-test-datasets"
            description = "Object Storage bucket that contains datasets for testing"
        }
        items {
            name = "url_test"
            # default_value = "ml-model-test-datasets"
            description = "Object Storage bucket that contains datasets for testing"
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
        base64encoded_content = "LS0tCmFwaVZlcnNpb246IHYxCmtpbmQ6IFNlcnZpY2UKbWV0YWRhdGE6CiAgbmFtZTogbWwtbW9kZWwtc2VydmljZQogIG5hbWVzcGFjZTogbWwtbW9kZWwKc3BlYzoKICB0eXBlOiBMb2FkQmFsYW5jZXIKICBwb3J0czoKICAtIHBvcnQ6IDgwODAKICBzZWxlY3RvcjoKICAgIGFwcDogbWwtbW9kZWwKLS0tCmFwaVZlcnNpb246IGFwcHMvdjEKa2luZDogRGVwbG95bWVudAptZXRhZGF0YToKICBuYW1lOiBtbC1tb2RlbC1kZXBsb3ltZW50CiAgbmFtZXNwYWNlOiBtbC1tb2RlbAogIGxhYmVsczoKICAgIGFwcDogbWwtbW9kZWwKc3BlYzoKICByZXBsaWNhczogMwogIHNlbGVjdG9yOgogICAgbWF0Y2hMYWJlbHM6CiAgICAgIGFwcDogbWwtbW9kZWwKICB0ZW1wbGF0ZToKICAgIG1ldGFkYXRhOgogICAgICBsYWJlbHM6CiAgICAgICAgYXBwOiBtbC1tb2RlbAogICAgc3BlYzoKICAgICAgY29udGFpbmVyczoKICAgICAgLSBuYW1lOiBtbC1tb2RlbC1jb250YWluZXIKICAgICAgICBpbWFnZTogaWFkLm9jaXIuaW8vYXBhY2NwdDAzL21sb3BzLW1vZGVsOiR7QlVJTERSVU5fSEFTSH0KICAgICAgICByZXNvdXJjZXM6CiAgICAgICAgICByZXF1ZXN0czoKICAgICAgICAgICAgbWVtb3J5OiAiNTAwTWkiCiAgICAgICAgICAgIGNwdTogIjEwMDBtIgogICAgICAgICAgbGltaXRzOgogICAgICAgICAgICBtZW1vcnk6ICIxR2kiCiAgICAgICAgICAgIGNwdTogIjIwMDBtIgogICAgICAgIHBvcnRzOgogICAgICAgIC0gY29udGFpbmVyUG9ydDogODA4MAogICAgICBpbWFnZVB1bGxTZWNyZXRzOgogICAgICAtIG5hbWU6IG9jaXItc2VjcmV0Ci0tLQ=="
    }
    deploy_artifact_type = "KUBERNETES_MANIFEST"
    project_id = oci_devops_project.mlops-devops-project.id
    description = "K8s manifest file to deploy ML model"
    display_name = "${var.resource_naming_prefix}-k8s-manifest-artifact"
}

resource oci_devops_deploy_artifact model-testing-dataset-2 {
  argument_substitution_mode = "SUBSTITUTE_PLACEHOLDERS"
  deploy_artifact_source {
    base64encoded_content = "eyJ1cmwiOiIke3VybF90ZXN0fSIsICJidWNrZXQiOiIke2J1Y2tldH0iLCAib2JqZWN0IjoiJHtkYXRhc2V0XzJ9In0="
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
    base64encoded_content = "eyJ1cmwiOiIke3VybF90ZXN0fSIsICJidWNrZXQiOiIke2J1Y2tldH0iLCAib2JqZWN0IjoiJHtkYXRhc2V0XzF9In0="
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
    base64encoded_content = "eyJ1cmwiOiIke3VybF90ZXN0fSIsICJidWNrZXQiOiIke2J1Y2tldH0iLCAib2JqZWN0IjoiJHtvYmplY3R9In0="
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