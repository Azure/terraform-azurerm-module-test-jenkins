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
#   9. After remote connected to the machine, run "sudo cat /var/lib/jenkins/secrets/initialAdminPassword" and remember the output
#  10. Open a browser and navigate to "http://localhost:12345" locally
#  11. Fill in the Jenkins password in Step 9
#  12. Install suggested plugins and your Jenkins is on
#
# Usage (Ubuntu):
#   You are a Linux guy, you could figure it out by yourself.

module "test-farm-jenkins" {
  source               = "../../"
  location             = "West US 2"
  resource_group_name  = "module-test-farm-rg"
  admin_username       = "tfmodtester"
  ssh_public_key_data  = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAuVkDlT5u7WMh4qYyALS45Ldms8PJOiRAwpFFYmOn3AJ83TRm/ucPpCbrEchL5KUMtrISBdEwLXSqqfOGNSq+U6E90f7npuML7Hjm9ZUkXO7/mxm8rdefBwwZSVNaDgBFnphHfppWfYVriCiINo9XQjzxKAQadI7QjO1if7LeTaVJhOoV6VMvOPujP/rS4+as1nQGlrW6xbwNoE4HdA8dQU18Vzh8puYIMk7ISmUm89I8hKJlmyiWJl9OynHnmLtZ5jYc2c2b3USgwzkTr2oRK+F7Md8yJuGVl2ZlaIEK90n87YauHDeSe2StlJLLZB3l8+IdiwADpuwpKHLxkthr4w== rsa-key-20171102"
  ssh_private_key_data = "${file("C:\\Users\\junyi\\SSHKeys\\id_rsa_private")}"
}

output "public_ip" {
  value = "${module.test-farm-jenkins.virtual_machine_public_ip}"
}
