# Terraform IaC Deployment for OCI MLOps

## **Pre-requisites**
1. Users with `manage` permission for the resources listed
2. Enough service limits in the tenancy
3. Create auth token. Refer to this [link](https://docs.oracle.com/en-us/iaas/Content/Identity/Tasks/managingcredentials.htm#create_swift_password)
4. Convert auth token to base64 using this [link](https://www.base64encode.org/)

Click here to deploy

[![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://github.com/howowi/mlops-terraform/releases/download/beta/mlops-terraform.zip)

## **Provisioned Resources** 

These OCI resources will be provisioned by this stack
- Core Resources
    - VCN x3
    - Internet GW x3
    - Service GW x2
    - NAT GW x2
    - Route Table x5
    - Subnets x7
    - Security List x6
- Kubernetes
    - OKE cluster x2
    - OKE node pool x2
- ADB x1
- API
    - API GW x2
    - API Deployment x2
- APM
    - APM Domain x1
    - Synthetics Monitor x2
- 