Các lệnh hay dùng
==================

### Lệnh update sau khi cài đặt 
```sh
apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y
```

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

- Lệnh dùng để kiểm tra các ip đã sử dụng trong một dải mạng: [THAM KHẢO](http://etherealmind.com/tech-notes-ping-sweep-ip-subnet/)
```sh
for i in `seq 1 255`; do ping -c 1 192.168.1.$i | tr \\n ' ' | awk '/1 received/ {print $2}'; done 
```
