Khi bạn `snapshot` một VM trên `VMware Workstation` hoặc `KVM` đôi khi có thể xảy ra tình trạng phân vùng `swap` bị mất mặc dù trước đó vẫn có.

Ví dụ như hình sau:

<img src=http://i.imgur.com/RasUh35.png>

Khi soi các phân vùng ổ cứng thì có phân vùng cho swap nhưng phân vùng này chưa có mount point 

> lsblk

<img src=http://i.imgur.com/J5svCHh.png>

> blkid

```
/dev/vda1: UUID="396fc430-43b1-4d31-88eb-47847b952640" TYPE="ext2"
/dev/vda5: UUID="kMSXkB-bqTn-Bh8r-G3AF-cDoH-01FB-VNPBM2" TYPE="LVM2_member"
/dev/sr0: LABEL="Ubuntu-Server 14.04.1 LTS amd64" TYPE="iso9660"
/dev/mapper/cong--log--vg-root: UUID="d2042ceb-7806-4d8d-b6d2-7d0008f36007" TYPE="ext4"
```

Nội dung file fstab cũng đã bị thay đổi:

<img src=http://i.imgur.com/tgxkkmp.png>

**Để sửa lỗi này ta thực hiện như sau:**

- B1: Xác định phân vùng swap trong ổ cứng

> ls /dev/mapper/

```
cong--log--vg-root  cong--log--vg-swap_1  control
```

Phân vùng swap thường sẽ có chữ swap trong đó, như trong trường hợp này là `/dev/mapper/cong--log--vg-swap_1`

- B2: Thực hiện các lệnh sau:

> mkswap /dev/mapper/cong--log--vg-swap_1

Sử dụng lện `blkid` sẽ thấy UUID của phân vùng swap

```sh
/dev/vda1: UUID="396fc430-43b1-4d31-88eb-47847b952640" TYPE="ext2"
/dev/vda5: UUID="kMSXkB-bqTn-Bh8r-G3AF-cDoH-01FB-VNPBM2" TYPE="LVM2_member"
/dev/sr0: LABEL="Ubuntu-Server 14.04.1 LTS amd64" TYPE="iso9660"
/dev/mapper/cong--log--vg-root: UUID="d2042ceb-7806-4d8d-b6d2-7d0008f36007" TYPE="ext4"
/dev/mapper/cong--log--vg-swap_1: UUID="b0d8bd2b-e0b0-4c7e-96e8-89fc3fcafabd" TYPE="swap"
```

> swapon /dev/mapper/cong--log--vg-swap_1

Lúc này phân vùng /dev/mapper/cong--log--vg-swap_1 đã được mount vào Swap

> lsblk

<img src=http://i.imgur.com/w3uxD5L.png>

> free -m

<img src=http://i.imgur.com/tnMXKVn.png>

Nhưng để phân vùng này được mount vào Swap từ những lần khởi động lại sau, ta cần sửa nội dung file `/etc/fstab` như sau:

uncomment dòng `/dev/mapper/cong--log--vg-swap_1 none            swap    sw              0       0`

comment dòng `/dev/mapper/cryptswap1 none swap sw 0 0`

<img src=http://i.imgur.com/uhNp0aW.png>

- B3: Reboot

