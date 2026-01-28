# Concept
* Terraform will automatically start searching for anything with `*.auto.tfvars`
    and override the terraform.tfvars file.
* Only vars will be overridden.
* If multiple .auto.tfvars are found, then it will add based on alphabetical order.