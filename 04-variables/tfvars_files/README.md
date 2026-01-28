# Concept
* The name of the file should be `terraform.tfvars`, it automatically loads the var file during execution.
* If the name is changed, it will not automatically loads it.
* To provide different name apart from `terraform.tfvars`, provide -var-file="dev.terraform.tfvars"
* The file consist only key value pair.
* Check variables.tf file to match the type
