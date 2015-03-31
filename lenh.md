Các lệnh hay dùng
==================


* [Lệnh update sau khi cài đặt] (#update-upgrade-dist-upgrade)
* [Lệnh đổi tên máy nhanh ] (#chang-names)
* [Lệnh dùng để kiểm tra các ip đã sử dụng trong một dải mạng] (#check-range-ip)
* [Lệnh đếm số lần truy cập vào Apache trong linux] (#count-access-ip)
* [Lệnh đặt timezone](#set-timezone)
* [Các lệnh làm việc với VIM](#VIM)
* [Lệnh thay chuỗi trong VIM](#thay-chuoi-vim)
* [Lệnh add repo proxy](#add-repo-proxy)
* [Lệnh tăng tốc đố truy cập ssh vào server](#ssh)
* [Lệnh kiểm tra trạng thái của các dịch vụ](#dichvu)
* [Lệnh tìm file có nội dung chứa từ khóa cần tìm](#grep)

<a name="update-upgrade-dist-upgrade"></a>
### Lệnh update sau khi cài đặt 
```sh
apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y
```

<a name="chang-names"> </a>
### Lệnh đổi tên máy nhanh 
- Trong Ubuntu
```sh
echo "u12-monitor.testcong.vn" > /etc/hostname
hostname -F /etc/hostname
```
- CENTOS
```sh
echo "HOSTNAME=Cen65-monitor-T7" >> /etc/sysconfig/network
hostname "Cen65-monitor-T7"
```

<a name="check-range-ip"> </a>
### Lệnh dùng để kiểm tra các ip đã sử dụng trong một dải mạng: [THAM KHẢO](http://etherealmind.com/tech-notes-ping-sweep-ip-subnet/)

```sh
for i in `seq 1 255`; do ping -c 1 192.168.1.$i | tr \\n ' ' | awk '/1 received/ {print $2}'; done 

hoặc

for i in {1..255}; do timeout 1 ping -c 1 172.16.69.$i >/dev/null && echo $_; done

hoặc

for i in {1..255}; do  ping -c 1 -t 1 172.16.69.$i >/dev/null && echo $_; done
```

<a name="count-access-ip"> </a>
### Lệnh đếm số lần truy cập vào Apache trong linux: [Tham khảo](http://frustratedtech.com/post/30324903133/count-ip-addresses-in-apache-access-logs)
```sh
# From CuongLM
awk '{print $1}' access.log | sort | uniq -c | sort -n

hoặc
cat access.log | awk '{print $1}' | sort | uniq -c | sort -n
```

<a name="set-timezone"> </a>
### Lệnh đặt timezone
Trước khi setup: http://i.imgur.com/Ws23zs2.png
```sh
sudo timedatectl set-timezone  Asia/Ho_Chi_Minh
```
Sau khi setup : http://i.imgur.com/R7ENZ7H.png

<a name="VIM"> </a>
## Các lệnh làm việc với VIM

<a name="thay-chuoi-vim"> </a>
### Lệnh thay chuỗi nhanh trong VIM
```sh
:%s/192.168.1/172.16.69/g
```
<a name="add-repo-proxy"></a>
### Lệnh add repo proxy server cho client
```sh
echo 'Acquire::http { Proxy "http://172.16.69.21:3142"; };' >  /etc/apt/apt.conf.d/02proxy
```
<a name="ssh"></a>
### Lệnh tăng tốc độ truy cập ssh vào server
```sh
sed -i 's/GSSAPIAuthentication yes/GSSAPIAuthentication no/g' /etc/ssh/sshd_config
echo "UseDNS no" >> /etc/ssh/sshd_config
```

<a name="dichvu"></a>
### Lệnh kiểm tra trạng thái dịch vụ
```sh
root@u14:~# initctl list | grep ssh
ssh start/running, process 1231
root@u14:~# initctl list | grep ufw
ufw start/running
```

<a name="grep"></a>
### Lệnh tìm file có nội dung chứa từ khóa cần tìm
```
grep -Rin <từ khóa> <đường dẫn>
```
