# Set up the full test farm of Jenkins
# Usage (Windows):
#   1. [Generate your SSH public and private keys](https://docs.joyent.com/public-cloud/getting-started/ssh-keys/generating-an-ssh-key-manually/manually-generating-your-ssh-key-in-windows)
#   2. Save your private key (*.ppk) generated in step one
#   3. Replace the following "ssh_public_key_data" and "ssh_private_key_data" with your generated keys (you can see both raw data and file path are used here)
#   4. Run "terraform init" "terraform plan" "terraform apply"
#   5. Remember your {public_ip} from the terraform output which is your host IP address
#   6. Remember the "admin_username" specified below
#   7. Using the above information to remote connect to your Jenkins machine by [Putty](https://support.rackspace.com/how-to/logging-in-with-an-ssh-private-key-on-windows/#log-in-to-putty-with-the-private-key)
#   8. Set up SSH port forwarding using [Putty](http://realprogrammers.com/how_to/set_up_an_ssh_tunnel_with_putty.html)
#      - Source port: 12345 (Or any port your like)
#      - Destination: 127.0.0.1:8080
#   9. Open a browser and navigate to "http://localhost:12345" locally
#  10. Following the instructions to initialize the Jenkins
#
# Usage (Ubuntu):
#   You are a Linux guy, you could figure it out by yourself.

module "test-farm-jenkins" {
  source               = "../../"
  location             = "West US 2"
  resource_group_name  = "module-test-farm-rg"
  admin_username       = "tfmodtester"
  public_domain_name   = "tfci"
  ssh_public_key_data  = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAj4v5pRh3Lx0zs8pSYoRQiZdT7PlsTqQJn12J9zh8ebC/Prs2Xyyex8n34k9UC8Q293ALbyE4DZE66aphCU9Dqtb5+LTCK7b/DCGFSaGwDHC/jej2YP3UBGbiBKBFtVrOSFLzul8d9r+ssjdJw+u6wBKpF+fIt9O2eHlOjAHuhuEMQnTnqdQpNsMq5Jjo/XzAf/yxcDhVLUUN9kLTuHpbvW6UHxYT1ejx+f6+WTk8p5lfW2J7B/qAbdIF4823/lCcTd3RfRmmRY8MkK4RtDAWZxHfqtkct04ZVoaTVZh5qDFaYnhsgoTJ2rut7VsUF3Q+gMTlKNk6ES4XGTZIUJFfHQ== rsa-key-20171116"
  ssh_private_key_data = "${file("MyOneDrive\\Working\\JenkinsSSH.privatessh")}"
}

output "public_ip" {
  value = "${module.test-farm-jenkins.virtual_machine_public_ip}"
}

output "dns" {
  value = "${module.test-farm-jenkins.virtual_machine_dns_name}"
}
