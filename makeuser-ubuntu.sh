#!/bin/bash
username=ansible
sshkey="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEmegYSWcme2WLRF4t2ZFCq+bzoM+q0Ed6LpKsRdQrS7 games@Gamer-PC"
id_ed25519="-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW
QyNTUxOQAAACBJnoGElnJntli0ReLdmRQqvm86DPqtBHei6SrEXUK0uwAAAJjrBtql6wba
pQAAAAtzc2gtZWQyNTUxOQAAACBJnoGElnJntli0ReLdmRQqvm86DPqtBHei6SrEXUK0uw
AAAEAsrmTlWOHfiGyjH8FsD0ZJBEgXX5N2BqPm6cMRbZsx0UmegYSWcme2WLRF4t2ZFCq+
bzoM+q0Ed6LpKsRdQrS7AAAADmdhbWVzQEdhbWVyLVBDAQIDBAUGBw==
-----END OPENSSH PRIVATE KEY-----"
id_ed25519_pub="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEmegYSWcme2WLRF4t2ZFCq+bzoM+q0Ed6LpKsRdQrS7 games@Gamer-PC"
useradd -m -d /home/$username -s /bin/bash $username
mkdir -p /home/$username/.ssh && touch /home/$username/.ssh/authorized_keys && touch /home/$username/.ssh/id_ed25519 && touch /home/$username/.ssh/id_ed25519.pub
chown -R $username:$username /home/$username/.ssh
chmod 700 /home/$username/.ssh
chmod 600 /home/$username/.ssh/authorized_keys && chmod 600 /home/$username/.ssh/id_ed25519 && chmod 600 /home/$username/.ssh/id_ed25519.pub
echo $sshkey > /home/$username/.ssh/authorized_keys
echo $id_ed25519 > /home/$username/.ssh/id_ed25519
echo $id_ed25519_pub > /home/$username/.ssh/id_ed25519.pub
usermod -aG sudo $username
echo "$username ALL=(ALL) NOPASSWD:ALL" >>  /etc/sudoers.d/$username