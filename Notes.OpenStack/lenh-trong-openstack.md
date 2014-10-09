Các câu lệnh hay dùng trong OpenStack
===

# Lệnh trong GLANCE
- Lệnh upload một image lên OpenStack
Cú pháp
```sh
glance image-create --name "Ten_cua_file.img" --disk-format qcow2 \
--container-format bare --is-public True --progress < Ten_cua_file.img
```
Ví dụ
```sh
glance image-create --name "cirros-0.3.3-x86_64" --disk-format qcow2 --container-format bare --is-public True --progress < cirros-0.3.3-x86_64-disk.img
```

- Lệnh khởi động lại các dịch vụ trong GLANCE
```sh
service glance-api restart
service glance-registry restart
```
