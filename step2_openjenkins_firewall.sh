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



#if the fire wall is in active run these commands (just delete the # infront of it)
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


