terraform init --backend-config=.config\%1\backend.hcl                                            
terraform plan -var-file .config\%1\variables.auto.tfvars -out ".tfplan"
terraform apply ".tfplan"