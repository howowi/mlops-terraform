## Create Secret in Kubernetes ##

resource "null_resource" "create_kubeconfig_directory" {
    provisioner "local-exec" {
        command = "mkdir -p $HOME/.kube"
    }
}

resource "null_resource" "create_kubeconfig" {
    depends_on = [null_resource.create_kubeconfig_directory]
    provisioner "local-exec" {
        command = "oci ce cluster create-kubeconfig --cluster-id ${oci_containerengine_cluster.test-oke-cluster.id} --file $HOME/.kube/config --region ${var.region} --token-version 2.0.0  --kube-endpoint PUBLIC_ENDPOINT"
    }
}

resource "null_resource" "set_kubeconfig_env" {
    depends_on = [null_resource.create_kubeconfig]
    provisioner "local-exec" {
        command = "export KUBECONFIG=$HOME/.kube/config"
    }
}

resource "null_resource" "create_namespace" {
    depends_on = [null_resource.set_kubeconfig_env]
    provisioner "local-exec" {
        command = "kubectl create namespace ml-model"
    }
}

resource "null_resource" "create_ocir_secret" {
  depends_on = [null_resource.create_namespace]
  provisioner "local-exec" {
    command = "kubectl create secret docker-registry ocir-secret --docker-username='${var.ocir_username}' --docker-password='${var.ocir_password}' --docker-server=${var.ocir_url} --docker-email='${var.ocir_email}' -n ml-model"
  }
}

resource "null_resource" "deploy_ml_service" {
    depends_on = [null_resource.create_ocir_secret]
    provisioner "local-exec" {
        command = "kubectl apply -f deploy/deploy-ml-model.yml"
    }
}

resource "null_resource" "get_model_ip" {
    depends_on = [null_resource.deploy_ml_service]
    provisioner "local-exec" {
        command = "kubectle get svc ml-model-service -n ml-model | awk -F ' ' '{print $3}' > data/model.api.txt"
    }
}
