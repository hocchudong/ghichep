- Dành cho Centos 
```sh
http://www.scriptsmy.com/how-to-install-open-vm-tools-in-centos-6-6/
http://www.shellhacks.com/en/HowTo-Install-VMware-Tools-on-CentOS-RHEL
```

### Cai dat vmware  tools cho ubuntu

- Cách 1:
```sh
sudo apt-get update
sudo apt-get install open-vm-tools

Tham khảo
http://partnerweb.vmware.com/GOSIG/Ubuntu_14_04.html 
```

- Cách 2:
```sh
apt-get update -y && apt-get upgrade -y
```
3) Create the mount point
```sh
sudo mkdir -p /media/cdrom
```
4) Mount the ISO
```sh
sudo mount /dev/cdrom /media/cdrom
```
111
5) Change Directory
```sh
cd /media/cdrom
```
6) Copy the tar file to your /tmp directory
```sh
sudo cp VM*.tar.gz /tmp
```
7) Install Build tools if necessary
```sh
sudo apt-get install linux-headers-server build-essential
```
(for desktop is "sudo apt-get install linux-headers-$(uname -r) build-essential")
8) Change Directory
```sh
cd /tmp
```
9) Unmount the ISO
```sh
sudo umount /media/cdrom
```

10) Expand the tar
```sh
sudo tar xzvf VM*.tar.gz
```
11) Change Directory
```sh
cd vmware-tools-distrib
```
12) Create a special directory
```sh
sudo mkdir /usr/lib64
```

13) Run the Install Script
```sh
sudo ./vmware-install.pl -d
```

14) Reboot

sudo reboot
