# terraform-home-lab
Terraform solutions to support the deployment of virtual machines to Proxmox in a home lab environment.

# Environment Setup
Install project dependencies
```
apt install python3-venv
```
Clone down the repository and confgigure the project environment
```
git clone git@github.com:Marcellod1/terraform-home-lab.git
cd terraform-home-lab
export TF_VAR_pve_api_token_id=<API_TOKEN_ID>
export TF_VAR_pve_api_token_secret=<API_TOKEN_SECRET>
terraform init
```

# Running Terraform
```
terraform apply
```