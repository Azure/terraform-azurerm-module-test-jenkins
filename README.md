
# Azure RM Jenkins infrastructure for Terraform module test

This is a Terraform module which will create the Jenkins test environment on Azure. You could use this environment to test other modules, including both unit test as well as the end-to-end test.

# Usage

```hcl
module "test-farm-jenkins" {
  source               = "Azure/module-test-jenkins/azurerm"
  version              = "0.1.1"
  
  location             = "West US 2"
  resource_group_name  = "module-test-farm-rg"
  admin_username       = "tfmodtester"
  ssh_public_key_data  = "ssh-rsa <THE SSH PUBLIC KEY HERE> rsa-key-20171102"
  ssh_private_key_data = "${file("<YOUR SSH PRIVATE KEY FILE PATH>")}"
}

output "public_ip" {
  value = "${module.test-farm-jenkins.virtual_machine_public_ip}"
}
