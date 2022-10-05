# myjenkin_subuntu_installation

#source https://www.digitalocean.com/community/tutorials/how-to-install-jenkins-on-ubuntu-20-04

#also see this link for jenkins installation for different OSs directly from jenkins website https://www.jenkins.io/download/
#add repo key to the system 
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

#system will respond ok
echo "Observe, system should respond ok"
sleep 10s

#add debian package repo to server's resource list
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'


echo "debian package repo to server's resource list"
sleep 10s

echo "updating..."
sleep 5s
sudo apt update -y

echo "installing jenkins"
sleep 5s
sudo apt install jenkins

echo "starting jenkins.."
sleep 5s
sudo systemctl start jenkins


sleep 10s
echo "checking on status of jenkins"
sudo systemctl status jenkins

###############
#reference: https://www.digitalocean.com/community/tutorials/how-to-install-jenkins-on-ubuntu-20-04
#Opening Jenkins firewall


sudo su
echo "changing to root to execute previledged commands"
sleep 5s

sudo ufw default deny
sudo ufw logging on

sudo ufw allow 8080
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
#sudo ufw allow 80,443/tcp

#if the fire wall is in active run these commands (just delete the £ infront of it)
sleep 5s
sudo ufw allow OpenSSH
sudo ufw enable

echo "changing to ubuntu user"
sleep 5s
echo "checking ufw status to confirm new rule"
sleep 5s
sudo ufw status

#you should get this output 

<<8080open

Output
Status: active

To                         Action      From
--                         ------      ----
OpenSSH                    ALLOW       Anywhere
8080                       ALLOW       Anywhere
OpenSSH (v6)               ALLOW       Anywhere (v6)
8080 (v6)                  ALLOW       Anywhere (v6)

8080open

<<note
ensure you instances in the cloud have ports 80 and 8080 also open. Configuring it on the CLI alone won't do it unless you were using an IaC tool like Terraform

after opening ports check your ip address by running curl ifconfig.co

enter ipaddress:8080 or assigned port in browser. You will get this command below. Run it for you initial admin password, then you can reset

sudo cat /var/lib/jenkins/secrets/initialAdminPassword
note
