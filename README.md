# Phần mềm Lò Hơi Prime
### Các bước cài đặt môi trường (Sử dụng Ubuntu server 20.04.1 LTS)
A. Cài đặt mạng cho máy Linux Ubuntu Server theo lớp mạng của PLC
B. Khi cài đặt khởi tạo username mặc định myowner
C. Đăng nhập vào máy tính qua SSH Client
D. Cài đặt môi trường
=====>Tạo thư mục script
        myowner@myscada:~$ mkdir script
=====>Truy cập vào thư mục cd /script và copy 2 file installTools.sh, runApp.sh
=====>Chạy lệnh
        myowner@myscada:~/script$ sudo chmod +x installTools.sh
        myowner@myscada:~/script$ sudo chmod +x runApp.sh
        myowner@myscada:~/script$ ./installTools.sh
        myowner@myscada:~/script$ ./runApp.sh

E. Chạy ứng dụng SCADA
=====>Chạy ứng dụng SCADA băng trình duyệt web: xxx.xxx.xxx.xxx:3020  (xxx.xxx.xxx.xxx: là địa chỉ máy tính Ubuntu)
