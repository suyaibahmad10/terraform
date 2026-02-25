## Workspace

1. Create different varaible files for each workspace, e.g variables/*.tfvars
2. Highest precendence has `export TF_WORKSPACE=dev"
3. Use something below to overide the vars with: 
    |- terraform plan -var-file=variables/$(terraform workspace show).tfvars
    |- terraform apply -var-file=variables/$(terraform workspace show).tfvars
4. Remote backend s3, all the workspaces will have it's corresponding statfile in s3 under env:/ path automatically.
