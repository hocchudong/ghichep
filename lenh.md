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
