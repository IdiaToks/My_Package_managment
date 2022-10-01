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



