# Phần mềm Lò Hơi Prime
### Các bước cài đặt môi trường (Sử dụng Ubuntu server ubuntu-22.04.1-live-server-amd64)
A. Cài đặt mạng cho máy Linux Ubuntu Server theo lớp mạng của PLC
B. Khi cài đặt khởi tạo tài khoản mặc định myowner
C. Đăng nhập vào máy tính qua SSH Client
D. Cài đặt môi trường
1. Tạo thư mục script
    myowner@serverName:~$ mkdir script
2. Truy cập vào thư mục cd /script và copy 2 file installTool.sh, runApp.sh
3. Chạy lệnh
    myowner@serverName:~/script$ sudo chmod +x installTool.sh
    myowner@serverName:~/script$ sudo chmod +x runApp.sh
    myowner@serverName:~/script$ ./installTool.sh
    myowner@serverName:~/script$ ./runApp.sh

E. Chạy ứng dụng SCADA
4. Chạy ứng dụng SCADA băng trình duyệt web: xxx.xxx.xxx.xxx:3020  (xxx.xxx.xxx.xxx: là địa chỉ máy tính Ubuntu)
