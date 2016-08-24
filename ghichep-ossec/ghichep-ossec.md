## Ghi chép về OSSEC

## Môi trường thực hiện

Ubuntu 14.04 64 bit

##  Update OS  và cài đặt gói bổ trợ

- Update OS 

apt-get update -y 

- Cài đặt gói bổ trợ

apt-get -y install build-essential inotify-tools 


## Cài đăt OSSEC

apt-key adv --fetch-keys http://ossec.wazuh.com/repos/apt/conf/ossec-key.gpg.key
echo "deb http://ossec.wazuh.com/repos/apt/ubuntu trusty main" >> /etc/apt/sources.list
apt-get update

apt-get install ossec-hids
apt-get install ossec-hids-agent


wget https://bintray.com/artifact/download/ossec/ossec-hids/ossec-hids-2.8.3.tar.gz


- Cai postfix-as-a-send-only-smtp-server-on-ubuntu-14-04
https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-postfix-as-a-send-only-smtp-server-on-ubuntu-14-04