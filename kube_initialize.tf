## Initialize Test Kubernetes Cluster ##

resource "null_resource" "create_kubeconfig_directory" {
    depends_on = [oci_containerengine_node_pool.test-oke-pool1]
    triggers  =  { 
        always_run = "${timestamp()}" 
    }
    provisioner "local-exec" {
        command = "mkdir -p $HOME/.kube"
        interpreter = [ "/bin/bash","-c"]
    }
}

resource "null_resource" "create_kubeconfig_test" {
    triggers  =  { 
        always_run = "${timestamp()}" 
    }
    depends_on = [null_resource.create_kubeconfig_directory]
    provisioner "local-exec" {
        command = "oci ce cluster create-kubeconfig --cluster-id ${oci_containerengine_cluster.test-oke-cluster.id} --file $HOME/.kube/config --region ${var.region} --token-version 2.0.0  --kube-endpoint PUBLIC_ENDPOINT"
        interpreter = [ "/bin/bash","-c"]
    }
}

resource "null_resource" "check_context_test" {
    triggers  =  { 
        always_run = "${timestamp()}" 
    }
    depends_on = [null_resource.create_kubeconfig_test]
    provisioner "local-exec" {
        command = "kubectl config current-context"
        interpreter = [ "/bin/bash","-c"]
    }
}

resource "null_resource" "create_namespace_test" {
    depends_on = [null_resource.check_context_test]
    provisioner "local-exec" {
        command = "kubectl create namespace ml-model"
        interpreter = [ "/bin/bash","-c"]
    }
}

resource "null_resource" "create_ocir_secret_test" {
  depends_on = [null_resource.create_namespace_test, null_resource.check_context_test]
  provisioner "local-exec" {
    command = "kubectl create secret docker-registry ocir-secret --docker-username='${var.ocir_username}' --docker-password='${var.ocir_password}' --docker-server=${var.ocir_url} --docker-email='${var.ocir_email}' -n ml-model"
    interpreter = [ "/bin/bash","-c"]
  }
}

resource "null_resource" "deploy_ml_service_test" {
    depends_on = [null_resource.create_ocir_secret_test, null_resource.check_context_test]
    provisioner "local-exec" {
        command = "kubectl apply -f deploy/deploy-ml-model.yml"
        interpreter = [ "/bin/bash","-c"]
    }
}

resource "null_resource" "get_model_ip_test" {
    triggers  =  { 
        always_run = "${timestamp()}" 
    }
    depends_on = [null_resource.deploy_ml_service_test, null_resource.check_context_test]
    provisioner "local-exec" {
        command = "kubectl get svc ml-model-service -n ml-model --no-headers=true | awk -F ' ' '{print $3}' > data/test_model_ip.txt"
        interpreter = [ "/bin/bash","-c"]
    }
}

data "local_file" "test_model_ip" {
    depends_on = [null_resource.get_model_ip_test]
    filename = "data/test_model_ip.txt" 
}

## Initialize Prod Kubernetes Cluster ##

resource "null_resource" "create_kubeconfig_prod" {
    triggers  =  { 
        always_run = "${timestamp()}" 
    }
    depends_on = [null_resource.get_model_ip_test, oci_containerengine_node_pool.prod-oke-pool1]
    provisioner "local-exec" {
        command = "oci ce cluster create-kubeconfig --cluster-id ${oci_containerengine_cluster.prod-oke-cluster.id} --file $HOME/.kube/config --region ${var.region} --token-version 2.0.0  --kube-endpoint PUBLIC_ENDPOINT"
        interpreter = [ "/bin/bash","-c"]
    }
}

resource "null_resource" "check_context_prod" {
    triggers  =  { 
        always_run = "${timestamp()}" 
    }
    depends_on = [null_resource.create_kubeconfig_prod]
    provisioner "local-exec" {
        command = "kubectl config current-context"
        interpreter = [ "/bin/bash","-c"]
    }
}

resource "null_resource" "create_namespace_prod" {
    depends_on = [null_resource.check_context_prod]
    provisioner "local-exec" {
        command = "kubectl create namespace ml-model"
        interpreter = [ "/bin/bash","-c"]
    }
}

resource "null_resource" "create_ocir_secret_prod" {
  depends_on = [null_resource.create_namespace_prod, null_resource.check_context_prod]
  provisioner "local-exec" {
    command = "kubectl create secret docker-registry ocir-secret --docker-username='${var.ocir_username}' --docker-password='${var.ocir_password}' --docker-server=${var.ocir_url} --docker-email='${var.ocir_email}' -n ml-model"
    interpreter = [ "/bin/bash","-c"]
  }
}

resource "null_resource" "deploy_ml_service_prod" {
    depends_on = [null_resource.create_ocir_secret_prod, null_resource.check_context_prod]
    provisioner "local-exec" {
        command = "kubectl apply -f deploy/deploy-ml-model.yml"
        interpreter = [ "/bin/bash","-c"]
    }
}

resource "null_resource" "get_model_ip_prod" {
    triggers  =  { 
        always_run = "${timestamp()}" 
    }
    depends_on = [null_resource.deploy_ml_service_prod, null_resource.check_context_prod]
    provisioner "local-exec" {
        command = "kubectl get svc ml-model-service -n ml-model --no-headers=true | awk -F ' ' '{print $3}' > data/prod_model_ip.txt"
        interpreter = [ "/bin/bash","-c"]
    }
}

data "local_file" "prod_model_ip" {
    depends_on = [null_resource.get_model_ip_prod]
    filename = "data/prod_model_ip.txt" 
}