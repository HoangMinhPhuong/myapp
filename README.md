# myapp
 
# Phần mềm Lò Hơi Prime

### Các bước cài đặt môi trường (Sử dụng Ubuntu server 20.04.1 LTS)
A. Cài đặt mạng cho máy Linux Ubuntu Server theo lớp mạng của PLC
B. Khi cài đặt khởi tạo username mặc định myowner
C. Đăng nhập vào máy tính qua SSH Client
D. Cài đặt môi trường
- Tạo thư mục: script
- Truy cập vào thư mục cd /script
- Copy file script InstallTool.sh vào thư mục script
- Chạy lện bash InstallTool.sh

E. Cấu hình node-red
- Mở ứng dụng node-red băng trình duyệt web: xxx.xxx.xxx.xxx:1880  (xxx.xxx.xxx.xxx: là địa chỉ máy tính Ubuntu)
- Import file cấu hình  NodeRedFlow.json  
- Cấu hình lại địa chỉ PLC mới
- Cấu hình lại thông tin user và pass của database với tài khoản: user "mydbs" -password "Kipy9Q5w"

F. Chạy ứng dụng SCADA
- Chạy ứng dụng SCADA băng trình duyệt web: xxx.xxx.xxx.xxx:3020  (xxx.xxx.xxx.xxx: là địa chỉ máy tính Ubuntu)
