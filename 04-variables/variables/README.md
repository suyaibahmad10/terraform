# Concept
* Generally declare variables in variables.tf file.
* Use it with var.<NAME>
* When defining variables, can set type, provide description and a defualt value, set sensitive to a boolean as true (sensitive no output but remain in statefile)
* When default is not provided it will ask when apply or plan interactively


## Options to provide var (below is precendence as well low to high) 
* default value in variable
* Environment variable (`TF_VAR_<name_of_variable_comes_here>`)
* creating `terraform.tfvars` file as well
* creating `terraform.tfvars.json` or `*.auto.tfvars` or `*.auto.tfvars.json` file as well
* command line with `-var=<name_of_variable_comes_here>` and `--var-file`