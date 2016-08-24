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
    
- Trong quá trình cài đặt lựa chọn mặc định các thông số.
    
### Cấu hình `postfix`

- Sao lưu file 
    ```sh
    cp /etc/postfix/main.cf /etc/postfix/main.cf.orig  
    ```

- Chèn thêm các dòng dưới vào file. Nếu dòng nào chưa có thì chèn mới, chưa đúng thì thay giá trị cho đúng.
    ```sh
    smtp_use_tls=yes
    smtp_sasl_auth_enable = yes
    smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
    smtp_sasl_security_options = noanonymous
    smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt

    relayhost = [smtp.gmail.com]:587
    ```

- Lưu ý: File `/etc/postfix/main.cf` thay đổi dòng `smtpd_use_tls=yes` thành `smtp_use_tls=yes` (bỏ chữ `d` đi)
    
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
    service postfix reload
    ```
    
    hoặc
    
    ```sh
    service postfix restart
    ```

### Khai báo trên `tai_khoan_gui@gmail` để `postfix` sử dụng được

- Truy cập vào link dưới và bật chế độ `Less secure apps`

    ```sh
    https://support.google.com/accounts/answer/6010255
    ```

- Tham khảo ảnh
    
    ```sh
    http://prntscr.com/c9uxke
    ```
    
### Kiểm tra việc gửi mail

- Dùng lệnh dưới để gửi thử

    ```sh
    echo "Test mail from postfix" | mail -s "Test Postfix" tai_khoan_nhan@domain
    ```

- Kiểm tra mail của tài khoản `tai_khoan_nhan@domain`
- Kết quả: http://prntscr.com/c9ve78


- Trong hướng dẫn này sử dụng:
    - Email gửi: vnptcloud@gmail.com
    - Email nhận: ttcong@vnpt.vn

## Tham khảo:
- https://www.howtoforge.com/tutorial/configure-postfix-to-use-gmail-as-a-mail-relay/
- https://easyengine.io/tutorials/linux/ubuntu-postfix-gmail-smtp/

## HẾT.

### Draft
HOST_NAME=`hostname`
debconf-set-selections <<< "postfix postfix/mailname string $HOST_NAME"
debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"


- Bỏ comment dòng 17 trong file `/etc/postfix/master.cf`

http://prntscr.com/c9vb9x
