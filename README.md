# API DVSTEAM

## Giới thiệu

DVSTEAM.VN cung cấp các API mạnh mẽ để tích hợp các dịch vụ tài chính và thanh toán vào ứng dụng của bạn. Hai API chính được cung cấp là `AutoBank` và `AutoCard` dành cho các web VPN.

Hiện Tại DVSTEAM Đang Hỗ Các Ngân Hàng
- `VietcomBank`
- `ACB Á Châu`
- `MB Bank`
- `VietinBank`
- [Web API Bank](https://api.dvsteam.vn)
- [Web API Card](https://gachthedvs.com)
- [Nhóm Zalo API Hỗ Trợ Trao Đổi](https://dvsteam.vn/zalo-hotro-api)

Hiện tại code api này chỉ hỗ trợ các Source web VPN
- [AikoPanel](https://aikopanel.edu.vn/vi/)
- [V2board](https://v2board.com/)
- [Xflash](https://dvsteam.vn/zalo-hotro-api)

Và các web Source dựa theo lõi V2board mod ra

- [Demo trang thanh toán](https://dvsteam.net)

Các web dạng khác ko thuộc VPN cần đấu API vui lòng liên hệ riêng
## Ưu điểm dành riêng VPN
- Duyệt đơn hàng đã hủy (Khi người dùng lỡ chuyển tiền trễ, đúng nội dung đơn và số tiền là auto duyệt) đỡ phải ae check lại
- Khi khách chuyển tiền nhầm hoặc thiếu, thì chỉ cần chuyển tiền thêm đếm khi đủ thì sẽ duyệt đơn hàng (miễn sao trong 1 nội dung của đơn đó là được, nếu chuyển tiền dư sẽ cộng lại web cho khách, công bằng không sót 1 đồng)
### Mô tả & hướng dẫn

API Autobank cho phép tự động hóa các giao dịch ngân hàng, bao gồm chuyển khoản và thanh toán hóa đơn. Nó được thiết kế để tối ưu hóa các quy trình tài chính và giảm thiểu thời gian xử lý.

### `Demo` bot thông báo `Ngân Hàng`

<img src="https://github.com/dvsteam/AutoBank-VPN/assets/91702958/c711102f-7387-4fd6-b73e-350533f9a245" width="30%">

### `Demo` bot thông báo `Thẻ Cào`

<img src="https://github.com/dvsteam/AutoBank-VPN/assets/91702958/fde6a41f-2955-4e57-94d5-36f632d7b4a1" width="30%">

# Hướng dẫn tích hợp
### Bước 1: Chạy lệnh setup
Truy cập vào thư mục `public` giống như trong ảnh, và chọn `Terminal` để mở ssh, hoặc bạn truy cập vào ssh sau đó truy cập đường dẫn

* Bắt buộc phải chạy lệnh trong `public` của mã nguồn nha.

Ví dụ: đường dẫn mã nguồn của bạn là `/www/wwwroot/AikoPanel/public/` thì gõ `cd /www/wwwroot/AikoPanel/public/` gõ trong ssh enter sau đó dán lệnh bên dưới vào

Nhìn sơ qua ảnh bên dưới tư duy xíu sẽ hiểu ngay. còn không hiểu thì liên hệ zalo 08353.15551

![Picsart_25-06-20_00-51-38-438](https://github.com/user-attachments/assets/250582c2-646c-48cc-8a01-c579468c88ba)

Sau đó dán lệnh đã sao chép bênh dưới vào chạy, rồi điền tên miền sau đó vào admin setup nốt phần còn lại
### Lệnh Setup Tự Động

Bấm vô nó hiện nút sao chép phía bên phải ấy, bấm sao chép cho tiện.
```
curl -fsSL https://raw.githubusercontent.com/dvsteam/AutoBank-VPN/refs/heads/main/setup_bank.sh -o setup_bank.sh && chmod +x setup_bank.sh && ./setup_bank.sh
```
### Bước 3: Cấu hình API
Nếu chưa cài `iconCube` thì bạn `Install` cài iconCube để tránh trường hợp bị trắng màng hình khi chọn `Tệp Giao Diện`, nếu cài rồi thì bỏ qua

<img src="https://github.com/dvsteam/AutoBank-VPN/assets/91702958/ff59e34e-6b27-4f0d-83fa-fc6e9a00a671" width="100%">

## Cấu Hình Admin
* Truy cập vào web Admin chọn `Cấu Hình Thanh Toán` chọn `Thêm phương thức thanh toán` điền đầy đủ những gì mà Tệp Giao Diện yêu cầu
Trong tệp giao diện có mục `AutoCard_DVS` đó là phần để cấu hình auto thẻ cào nếu bạn muốn web có thêm auto card (AutoCard ko cần cài Cron)

Bạn dùng ngân hàng nào thì, chọn tệp giao diện để phù hợp với `ngân hàng` của bạn
* `AutoACB_DVS` => Ngân Hàng ACB
* `AutoVCB_DVS` => Ngân Hàng VietcomBank
* `AutoViettin_DVS` => Ngân Hàng VietinBank
* `AutoMBBank_DVS` => Ngân Hàng MB Bank
* `AutoCard_DVS` => Auto Thẻ Cào
<img src="https://github.com/dvsteam/AutoBank-VPN/assets/91702958/08dd510f-5ac5-40a5-aa59-1c10c2334bcd" width="45%">

### Bước 4: Cài Cron Auto
Đây là những file chạy `Cron` để chạy auto cho web bạn, vui lòng không di chuyển vị trí file sang thư mục khác

Đây là Cron Tổng nên chỉ cần chạy 1 file `DVS_AutoBank.php` là chạy tất cả bank

* **_Thẻ Cào Không Cần Cron_**

Hướng Dẫn Add Cron Job

Mở tap `Cron` trong aapanel lên chọn `Add Task`

* Task type => `Shell Script`
* Task name => AutoBank DVSTEAM (Đặt tên gì cũng được)
* Execute cycle => `N Minutes` => `1` minutes
* Execute user => root
* Script content => `php /www/wwwroot/{Tên đường dẫn file của bạn}/public/thanhtoan/Cron/DVS_AutoBank.php`

Copy code bên dưới và sửa lại đường dẫn thư mục theo web của bạn
```
php /www/wwwroot/AikoPanel/public/thanhtoan/Cron/DVS_AutoBank.php
```
* `Lưu ý:` Chạy Cron không vượt quá 60giây nếu vượt quá 60giây sẽ `khóa token` (ko trả lại tiền đâu nha 😎), cấu hình bên trên là đã setup sẵn cho bạn chạy 60giây rồi đó

### Bước 5:
Thử xem auto hoạt động duyệt đơn chưa chớ còn chờ gì 

# Hỗ Trợ Thoắc Mắc
- [Zalo: 08353.15551](https://zalo.me/dvsteam)
- [Telegram](https://t.me/DuongVanSy)

* `Hệ Thống API DVSTEAM Cảm Ơn Bạn Đã Quan Tâm`
