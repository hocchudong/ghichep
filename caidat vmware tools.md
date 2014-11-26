### Cai dat vmware  tools cho ubuntu

sudo apt-get update
sudo apt-get upgrade
3) Create the mount point

sudo mkdir -p /media/cdrom
4) Mount the ISO

sudo mount /dev/cdrom /media/cdrom
5) Change Directory

cd /media/cdrom
6) Copy the tar file to your /tmp directory

sudo cp VM*.tar.gz /tmp
7) Install Build tools if necessary

sudo apt-get install linux-headers-server build-essential
(for desktop is "sudo apt-get install linux-headers-$(uname -r) build-essential")
8) Change Directory

cd /tmp
9) Unmount the ISO
sudo umount /media/cdrom

10) Expand the tar
sudo tar xzvf VM*.tar.gz

11) Change Directory
cd vmware-tools-distrib

12) Create a special directory
sudo mkdir /usr/lib64

13) Run the Install Script
sudo ./vmware-install.pl -d

14) Reboot

sudo reboot