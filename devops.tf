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

resource "oci_devops_deploy_environment" "mlops-test-oke-environment" {
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
resource "oci_devops_repository" "mlops-code-repo" {
    name = "${var.resource_naming_prefix}-mlops-code-repo"
    project_id = oci_devops_project.mlops-devops-project.id
    default_branch = "main"
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

## ----- Kubernetes Manifest Artifact ----- ## Pending
resource "oci_devops_deploy_artifact" "k8s-manifest-artifact" {
    argument_substitution_mode = "SUBSTITUTE_PLACEHOLDERS"
    deploy_artifact_source {
        deploy_artifact_source_type = "INLINE"
        base64encoded_content = var.k8s_manifest
    }
    deploy_artifact_type = "KUBERNETES_MANIFEST"
    project_id = oci_devops_project.mlops-devops-project.id
    description = "K8s manifest file to deploy ML model"
    display_name = "${var.resource_naming_prefix}-k8s-manifest-artifact"
}

resource oci_devops_deploy_artifact model-testing-dataset-2 {
  argument_substitution_mode = "SUBSTITUTE_PLACEHOLDERS"
  deploy_artifact_source {
    base64encoded_content = "e3VybDosIGJ1Y2tldDosIG9iamVjdDp9Cg=="
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
    base64encoded_content = "eyJ1cmwiOiI2Mjgze3VybF90ZXN0fSIsICJidWNrZXQiOiI2Mjgze2J1Y2tldH0iLCAib2JqZWN0IjoiNjI4M3tkYXRhc2V0XzJ9In0K"
    deploy_artifact_source_type = "INLINE"
  }
  deploy_artifact_type = "GENERIC_FILE"
  project_id = oci_devops_project.mlops-devops-project.id
  description = "Model Testing Dataset 1"
  display_name = "${var.resource_naming_prefix}-model-testing-dataset-1"
}

## ----- Deployment Stages ----- ## Pending
resource "oci_devops_deploy_stage" "deploy-test-oke-stage" {
    deploy_pipeline_id = oci_devops_deploy_pipeline.mlops-deploy-pipeline.id
    deploy_stage_predecessor_collection {
        items {
            id = oci_devops_deploy_pipeline.mlops-deploy-pipeline.id
        }
    }
    deploy_stage_type = "OKE_DEPLOYMENT"
    description = ""
    display_name = ""
    kubernetes_manifest_deploy_artifact_ids = [""]
    oke_cluster_deploy_environment_id = [""]
    rollback_policy {
        policy_type = "NO_STAGE_ROLLBACK_POLICY"
    }
}