# Azure Container Instance sftp HowTo

[Based on MarkusMcNugen Docker container](https://hub.docker.com/r/markusmcnugen/sftp/)

It's a fork of [Atmoz/sftp](https://hub.docker.com/r/atmoz/sftp/) and runs on
top of [phusion/baseimage](https://hub.docker.com/r/phusion/baseimage/)(Ubuntu
16.04 LTS). It has fail2ban added and extremely clever config mechanizm which
allows use Azure File Share as persistent storage for server keys,
sshd_config, fail2ban jail.conf and user ssh keys.

00. Check and modify deploysftp_persistentserverkeys_v1.json template.
01. Create storage account
02. Create 2 file shares: config and upload
03. Under config create folders: fail2ban, sshd and userkeys
04. Under config/sshd create 2 folders: keys and scripts
05. Upload shares/config/sshd/sshd_config file under config/sshd
06. Upload shares/config/fail2ban/jail.conf file under config/fail2ban
07. Upload server keys under config/sshd/keys
08. Upload shares/config/sshd/scripts/persistentkeys.sh script under config/sshd/scripts
09. Upload user pub ssh key under config/userkeys - file must be named after username of the user.
10. Check deploy.txt about instructions on how to deploy your sftp Azure Container Instance using deploysftp_persistentkeys_v1.json template inculded in this repo.

'shares' folder in this repo contains all the shares needed on Azure File Share and represents the entire directory structure described above, use it as reference.

Check and modify deploysftp_persistentserverkeys_v1.json template.

The script config/sshd/scripts/persistentkeys.sh is used to copy server ssh key
from Azure File Share to /etc/ssh and modify keys access permissions to 600.

Included here config/sshd/sshd_config file was modified to point for server keys
under /etc/ssh/

Included here config/fail2ban/jail.conf file was modified to disable ssh jail.
If you want this enabled - edit this file or do not upload it to your Azure File
Share at all. By default it is enabled in the container.

For more detailed instructions and information about MarkusNcNugen docker contaner: https://hub.docker.com/r/markusmcnugen/sftp/

For more detailed instructions and information about Atmoz docker container: https://hub.docker.com/r/atmoz/sftp/
