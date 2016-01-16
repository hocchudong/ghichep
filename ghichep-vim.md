# Các chú ý về VIM
- Nơi tổng hợp các kỹ thuật sử dụng VIM hiệu quả hơn.
- Yêu cầu: Đã biết dùng VIM để làm việc, biết các mode trong VIM.

###  Mở file và nhảy đến 1 dòng cụ thể trong file.
Cú pháp
```sh
vi   +so_dong   file_can_mo
```

Ví dụ nhảy tới dòng số 9 trong file etc/passwd
```sh
vi +9  etc/passwd
```

###  Mở file và nhảy đến dòng có chứa ký tự chỉ định
Cú pháp
```sh
vi   +/tu_khoa   file_can_mo
```

- Ví dụ nhảy tới dòng có từ khóa là `mail` trong file etc/passwd
```sh
vi +/mail  etc/passwd
```

###  Mở file và nhảy đến dòng cuối cùng của file
Cú pháp
```sh
vi   +  file_can_mo
```
- Ví dụ nhảy tới dòng cuối cùng trong file etc/passwd
```sh
vi + etc/passwd
```

### Thay thế ký tự, chuỗi ký tự trong VM 
```sh
:%s/192.168.1/172.16.69/g
```

### Xóa các dòng khi biết số thứ tự dòng
```sh
Sử dụng cú pháp sau: :[dong_bat_dau], [dong_ket_thuc]d

Ví dụ xóa từ dòng 5 tới dòng 10 trong vi/vim sử dụng lệnh sau (dùng lệnh ":set nu" để hiển thị số thứ tự dòng trong vim)
:5,10d
```

