## Initialize Test Kubernetes Cluster ##

resource "null_resource" "create_kubeconfig_directory" {
    provisioner "local-exec" {
        command = "mkdir -p $HOME/.kube"
    }
}

resource "null_resource" "create_kubeconfig_test" {
    depends_on = [null_resource.create_kubeconfig_directory]
    provisioner "local-exec" {
        command = "oci ce cluster create-kubeconfig --cluster-id ${oci_containerengine_cluster.test-oke-cluster.id} --file $HOME/.kube/config_test --region ${var.region} --token-version 2.0.0  --kube-endpoint PUBLIC_ENDPOINT"
    }
}

resource "null_resource" "set_kubeconfig_env_test" {
    depends_on = [null_resource.create_kubeconfig_test]
    provisioner "local-exec" {
        command = "export KUBECONFIG=$HOME/.kube/config_test"
    }
}

resource "null_resource" "create_namespace_test" {
    depends_on = [null_resource.set_kubeconfig_env_test]
    provisioner "local-exec" {
        command = "kubectl create namespace ml-model"
    }
}

resource "null_resource" "create_ocir_secret_test" {
  depends_on = [null_resource.create_namespace_test]
  provisioner "local-exec" {
    command = "kubectl create secret docker-registry ocir-secret --docker-username='${var.ocir_username}' --docker-password='${var.ocir_password}' --docker-server=${var.ocir_url} --docker-email='${var.ocir_email}' -n ml-model"
  }
}

resource "null_resource" "deploy_ml_service_test" {
    depends_on = [null_resource.create_ocir_secret_test]
    provisioner "local-exec" {
        command = "kubectl apply -f deploy/deploy-ml-model.yml"
    }
}

resource "null_resource" "get_model_ip_test" {
    depends_on = [null_resource.deploy_ml_service_test]
    provisioner "local-exec" {
        command = "kubectl get svc ml-model-service -n ml-model --no-headers=true | awk -F ' ' '{print $3}' > data/test_model_ip.txt"
    }
}

data "local_file" "test_model_ip" {
    depends_on = [null_resource.get_model_ip_test]
    filename = "data/test_model_ip.txt" 
}

## Initialize Prod Kubernetes Cluster ##

# resource "null_resource" "move_test_kubeconfig" {
#     depends_on = [null_resource.get_model_ip_test]
#     provisioner "local-exec" {
#         command = "mv $HOME/.kube/config $HOME/.kube/test_config_backup"
#     }
# }

resource "null_resource" "create_kubeconfig_prod" {
    depends_on = [null_resource.get_model_ip_test]
    provisioner "local-exec" {
        command = "oci ce cluster create-kubeconfig --cluster-id ${oci_containerengine_cluster.prod-oke-cluster.id} --file $HOME/.kube/config_prod --region ${var.region} --token-version 2.0.0  --kube-endpoint PUBLIC_ENDPOINT"
    }
}

resource "null_resource" "set_kubeconfig_env_prod" {
    depends_on = [null_resource.create_kubeconfig_prod]
    provisioner "local-exec" {
        command = "export KUBECONFIG=$HOME/.kube/config_prod"
    }
}

resource "null_resource" "create_namespace_prod" {
    depends_on = [null_resource.set_kubeconfig_env_prod]
    provisioner "local-exec" {
        command = "kubectl create namespace ml-model"
    }
}

resource "null_resource" "create_ocir_secret_prod" {
  depends_on = [null_resource.create_namespace_prod]
  provisioner "local-exec" {
    command = "kubectl create secret docker-registry ocir-secret --docker-username='${var.ocir_username}' --docker-password='${var.ocir_password}' --docker-server=${var.ocir_url} --docker-email='${var.ocir_email}' -n ml-model"
  }
}

resource "null_resource" "deploy_ml_service_prod" {
    depends_on = [null_resource.create_ocir_secret_prod]
    provisioner "local-exec" {
        command = "kubectl apply -f deploy/deploy-ml-model.yml"
    }
}

resource "null_resource" "get_model_ip_prod" {
    depends_on = [null_resource.deploy_ml_service_prod]
    provisioner "local-exec" {
        command = "kubectl get svc ml-model-service -n ml-model --no-headers=true | awk -F ' ' '{print $3}' > data/prod_model_ip.txt"
    }
}

data "local_file" "prod_model_ip" {
    depends_on = [null_resource.get_model_ip_prod]
    filename = "data/prod_model_ip.txt" 
}