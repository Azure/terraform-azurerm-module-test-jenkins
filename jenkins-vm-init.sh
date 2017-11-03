#cloud-config
package_upgrade: true
runcmd:
  - wget -q -O - https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz | tar -C /usr/local -xz
  - echo "PATH=\"\$PATH:/usr/local/go/bin\"" >> /etc/profile
  - wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | apt-key add -
  - sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
  - apt-get update
  - apt-get install jenkins -y
  - service jenkins restart
  - reboot
