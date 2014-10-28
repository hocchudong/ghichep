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

###Lệnh dùng để kiểm tra các ip đã sử dụng trong một dải mạng: [THAM KHẢO](http://etherealmind.com/tech-notes-ping-sweep-ip-subnet/)
```sh
for i in `seq 1 255`; do ping -c 1 192.168.1.$i | tr \\n ' ' | awk '/1 received/ {print $2}'; done 

hoặc

for i in {1..255}; do timeout 1 ping -c 1 172.16.69.$i >/dev/null && echo $_; done

hoặc

for i in {1..255}; do  ping -c 1 -t 1 172.16.69.$i >/dev/null && echo $_; done
```

### Lệnh đếm số lần truy cập vào Apache trong linux: [Tham khảo](http://frustratedtech.com/post/30324903133/count-ip-addresses-in-apache-access-logs)
```sh
# From CuongLM
awk '{print $1}' access.log | sort | uniq -c | sort -n

hoặc
cat access.log | awk '{print $1}' | sort | uniq -c | sort -n
```
