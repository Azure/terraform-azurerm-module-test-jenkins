### General Variables

variable "location" {
  description = "The data center location where all resources will be put into."
}

variable "resource_group_name" {
  description = "The name of the resource group which the Jenkins test farm will be created in."
}


### Network Variables

variable "virtual_network_name" {
  description = "The name of the virtual network connecting all resources."
  default     = "module-test-farm-vnet"
}

variable "subnet_name" {
  description = "The name of the subnet where the Jenkins virtual machine will be put into."
  default     = "jenkins-subnet"
}

variable "public_ip_name" {
  description = "The name of the public IP address for Jenkins virtual machine."
  default     = "jenkins-pip"
}

variable "public_domain_name" {
  description = "The domain name of the Jenkins virtual machine (without azure subdomain)."
}

variable "network_security_group_name" {
  description = "The name of the network security group (firewall rules) for Jenkins virtual machine."
  default     = "ssh-allow"
}

variable "network_interface_name" {
  description = "The name of the primary network interface which will be used by the Jenkins virtual machine."
  default     = "jenkins-nic"
}


### Virtual Machine Variables

variable "virtual_machine_name" {
  description = "The name of the Jenkins virtual machine which contains the Jenkins server."
  default     = "jenkins-vm"
}

variable "virtual_machine_size" {
  description = "The size of the Jenkins virtual machine."
  default     = "Standard_A2_v2"
}

variable "virtual_machine_osdisk_name" {
  description = "The managed OS disk name of the Jenkins virtual machine."
  default     = "jenkins-osdisk"
}

variable "virtual_machine_osdisk_type" {
  description = "The managed OS disk type of the Jenkins virtual machine."
  default     = "Standard_LRS"
}

variable "virtual_machine_computer_name" {
  description = "The computer name of the Jenkins virtual machine."
  default     = "tfmod-jenkins"
}

variable "admin_username" {
  description = "The username of the administrator of the Jenkins virtual machine."
}

variable "ssh_public_key_data" {
  description = "The SSH public key for remote connection of the Jenkins virtual machine."
}

variable "ssh_private_key_data" {
  description = "The SSH private key for remote connection. It is used to configure the environment after the virtual machine is created."
}
