# Ghi chép về postfix

## Postfix là gì ? Để làm gì 

- Là ứng dụng trên môi trường `.NIX`
- Dùng để gửi mail
- Có thể cài đặt `postfix` để gửi mail với các domain
 - @gmail.com
 - @domain_cua_ban

## Môi trường cài đặt

- Ubuntu 14.04 64 bit

## Mục tiêu

- Cài đặt postfix
- Cấu hình để sử dụng postfix gửi mail với tài khoản gmail

## Các bước cài đặt

### Cài đặt 

- Update và cài đặt các gói

```sh
apt-get -y update
apt-get -y install postfix mailutils libsasl2-2 ca-certificates libsasl2-modules
```

### Cấu hình

- Sao lưu file 

```sh
cp /etc/postfix/main.cf /etc/postfix/main.cf.orig  
```

- Chèn thêm 6 dòng dưới vào file. Nếu dòng nào có rồi thì thay thế.

```sh
smtp_use_tls=yes
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt

relayhost = [smtp.gmail.com]:587
```

- Tạo file `/etc/postfix/sasl_passwd` với nội dung sau

```sh
[smtp.gmail.com]:587    tai_khoan_gui@gmail.com:mat_khau
```

- Phân quyền cho file `/etc/postfix/sasl_passwd`

```sh
sudo chmod 400 /etc/postfix/sasl_passwd
sudo postmap /etc/postfix/sasl_passwd
```

- Khởi động lại postfix

```sh
sudo /etc/init.d/postfix reload
```

- Truy cập vào link dưới và bật chế độ `Less secure apps`

```sh
https://support.google.com/accounts/answer/6010255
```

 - Tham khảo ảnh
 
 ```sh
 http://prntscr.com/c9uxke
 ```
 
- Kiểm tra việc gửi mail

```sh
echo “Testing Gmail SMTP service” | mail -s “Test message from GMAIL” tai_khoan_nhan@domain
```

- Check tài khoản email 
