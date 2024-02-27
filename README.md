# API DVSTEAM

## Giới thiệu

DVSTEAM.VN cung cấp các API mạnh mẽ để tích hợp các dịch vụ tài chính và thanh toán vào ứng dụng của bạn. Hai API chính được cung cấp là `AutoBank` và `AutoCard` dành cho các web VPN.

- [Đăng Ký API AutoBank](https://dvsteam.vn)
- [Đăng Ký API AutoCard](https://gachthedvs.net)
- [Nhóm Zalo API Hỗ Trợ Trao Đổi](https://dvsteam.vn/zalo-hotro-api)

Hiện tại code api này chỉ hỗ trợ các Source web VPN
- [AikoPanel](https://aikopanel.edu.vn/vi/)
- [V2board](https://v2board.com/)
- [Xflash](https://dvsteam.vn/zalo-hotro-api)

Và các web Source dựa theo lõi V2board mod ra

- [Demo trang thanh toán](https://dvsteam.net)

Các web dạng khác ko thuộc VPN cần đấu API vui lòng liên hệ riêng
## AutoBank & AutoCard

### Mô tả

API Autobank cho phép tự động hóa các giao dịch ngân hàng, bao gồm chuyển khoản và thanh toán hóa đơn. Nó được thiết kế để tối ưu hóa các quy trình tài chính và giảm thiểu thời gian xử lý.

### `Demo` bot thông báo `Ngân Hàng`

<img src="https://github.com/dvsteam/AutoBank-VPN/assets/91702958/c711102f-7387-4fd6-b73e-350533f9a245" width="30%">

### `Demo` bot thông báo `Thẻ Cào`

<img src="https://github.com/dvsteam/AutoBank-VPN/assets/91702958/fde6a41f-2955-4e57-94d5-36f632d7b4a1" width="30%">

# Hướng dẫn sử dụng
### Bước 1: Tải tệp và giải nén
Truy cập vào thư mục `public` giống như trong ảnh, và chọn `Remote download` 

<img src="https://github.com/dvsteam/AutoBank-VPN/assets/91702958/71b8e91e-1fca-4169-b297-c7c3cceacb38" width="85%">


Sau đó dán đường dẫn tải tệp này vào `URL address` như trong ảnh và Bấm "Confirm" để tải tệp xuống
```
https://github.com/dvsteam/AutoBank-VPN/archive/refs/heads/main.zip
```
<img src="https://github.com/dvsteam/AutoBank-VPN/assets/91702958/2c1ddf84-60eb-4163-88fa-991fe0be2742" width="85%">

Sau khi đã tải xuống tệp bấm `chuột phải` vào `main.zip` chọn `Unzip` tiếp theo bấm "Confirm" để giải nén ra

<img src="https://github.com/dvsteam/AutoBank-VPN/assets/91702958/154bf2fb-9bdf-4da2-a4ce-77937f8d2c6d" width="85%">

Giải nén xong đổi tên tệp `AutoBank-VPN-main` Rename thành tên `thanhtoan` giống như ví dụ ảnh dưới

<img src="https://github.com/dvsteam/AutoBank-VPN/assets/91702958/bcd1651b-c94b-4766-8e98-826b228318d0" width="85%">

### Bước 2: Cấu hình thư mục
Truy cập vào thư mục `thanhtoan` tìm file `app` và "cut" di chuyển thư mục `app` vào thư mục gốc của web, chọn `Paste` để dán vào thư mục gốc

<img src="https://github.com/dvsteam/AutoBank-VPN/assets/91702958/8a4792b8-6f7b-4353-a99b-76070e0eff31" width="85%">

chọn `Paste` điền phép toán vào `Result` sau đó bấm `OK`

<img src="https://github.com/dvsteam/AutoBank-VPN/assets/91702958/c5ab8c79-2460-41f9-a654-785e25a5eddf" width="85%">


* Truy cập lại vào thư mục `thanhtoan` và tìm đến file `demo_config.php` Rename đổi tên thành `config.php`
điền đầy đủ thông tin trong `config.php` yêu cầu

Nếu bạn không biết lấy thông tin `Databases` ở đâu cho chuẩn, thì hãy truy cập vào thư mục `.env` của web vpn bạn để lấy thông tin

<img src="https://github.com/dvsteam/AutoBank-VPN/assets/91702958/8f766ccf-695f-48eb-a1a2-dcd5b58ed39a" width="85%">

khi có thông tin lấy từ tệp `.env` rồi thì quay lại tệp `config.php` điền thông tin vào cho khớp

<img src="https://github.com/dvsteam/AutoBank-VPN/assets/91702958/0537a75a-c5af-4d6d-bb0f-1312d261f9d2" width="85%">

như vậy là đã xong phần ở máy chủ còn lại cấu hình sửa đổi hoàn toàn ở admin

### Bước 3: Cấu hình API
Nếu chưa cài `iconCube` thì bạn `Install` cài iconCube để tránh trường hợp bị trắng màng hình khi chọn `Tệp Giao Diện`, nếu cài rồi thì bỏ qua

<img src="https://github.com/dvsteam/AutoBank-VPN/assets/91702958/ff59e34e-6b27-4f0d-83fa-fc6e9a00a671" width="100%">

* Truy cập vào web Admin chọn `Cấu Hình Thanh Toán` chọn `Thêm phương thức thanh toán` điền đầy đủ những gì mà Tệp Giao Diện yêu cầu
Trong tệp giao diện có mục `AutoCard_DVS` đó là phần để cấu hình auto thẻ cào nếu bạn muốn web có thêm auto card (AutoCard ko cần cài Cron)

Bạn dùng ngân hàng nào thì, chọn tệp giao diện để phù hợp với `ngân hàng` của bạn
* `AutoACB_DVS` => Ngân Hàng ACB
* `AutoVCB_DVS` => Ngân Hàng VietcomBank
* `AutoCard_DVS` => Auto Thẻ Cào
* `ViettelMoney_DVS` => Ví điện tử ViettelPay
<img src="https://github.com/dvsteam/AutoBank-VPN/assets/91702958/08dd510f-5ac5-40a5-aa59-1c10c2334bcd" width="45%">

### Bước 4: Cài Cron Auto
Đây là những file chạy `Cron` để chạy auto cho web bạn, vui lòng không di chuyển vị trí file sang thư mục khác

<img src="https://github.com/dvsteam/AutoBank-VPN/assets/91702958/0378139b-3fd4-47ec-94ca-fa95f75d36a2" width="85%">

* Hãy thay `dvsteam.net` thành tên đường dẫn file web của bạn nha, Điền thông tin đường dẫn như ví dụ bên dưới vào để chạy auto

Bạn dùng ngân hàng nào thì chọn tệp Cron để phù hợp với `ngân hàng` của bạn
* `DVS_AutoACB.php` => Ngân Hàng ACB
* `DVS_AutoVCB.php` => Ngân Hàng VietcomBank
* `DVS_AutoViettelPay.php` => Ví điện tử ViettelMoney
```
php /www/wwwroot/dvsteam.net/public/AutoBank/Cron/DVS_AutoVCB.php
sleep 30;php /www/wwwroot/dvsteam.net/public/AutoBank/Cron/DVS_AutoVCB.php
```
* `Lưu ý:` Chạy Cron không vượt quá 30giây nếu vượt quá 30giây sẽ `khóa token` (ko trả lại tiền đâu nha 😎), cấu hình bên trên là đã setup sẵn cho bạn chạy 30giây rồi đó

<img src="https://github.com/dvsteam/AutoBank-VPN/assets/91702958/48c4f047-c87a-4adf-a869-367d17a26a73" width="85%">

### Bước 5:
Thử xem auto hoạt động duyệt đơn chưa chớ còn chờ gì 

# Hỗ Trợ Thoắc Mắc
- [Zalo: 08353.15551](https://zalo.me/dvsteam)
- [Telegram](https://t.me/DuongVanSy)

* `Hệ Thống API DVSTEAM Cảm Ơn Bạn Đã Quan Tâm`
