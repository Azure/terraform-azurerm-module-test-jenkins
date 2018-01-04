output "virtual_machine_public_ip" {
  description = "The public IP address of the Jenkins virtual machine."
  value       = "${azurerm_public_ip.pip.ip_address}"
}

output "virtual_machine_dns_name" {
  description = "The DNS name of the Jenkins virtual machine."
  value       = "${azurerm_public_ip.pip.fqdn}"
}
