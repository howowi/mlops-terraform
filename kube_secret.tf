## Create Secret in Kubernetes ##

resource "null_resource" "create_kubeconfig_directory" {
    provisioner "local-exec" {
        command = "mkdir -p $HOME/.kube"
    }
}

resource "null_resource" "create_kubeconfig" {
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



resource kubernetes_secret ocir_secret {
  metadata {
    name = "ocir-secret"
    namespace = "ml-model"
  }
  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "${var.ocir_url}" = {
          auth = "${base64encode("${var.ocir_username}:'${var.ocir_password}'")}"
        }
      }
    })
  }
  type = "kubernetes.io/dockerconfigjson"
}