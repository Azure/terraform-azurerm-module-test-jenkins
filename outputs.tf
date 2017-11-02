output "virtual_machine_public_ip" {
  description = "The public IP address of the Jenkins virtual machine."
  value       = "${azurerm_public_ip.pip.ip_address}"
}
