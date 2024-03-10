# API DVSTEAM

## Giới thiệu

DVSTEAM.VN cung cấp các API mạnh mẽ để tích hợp các dịch vụ tài chính và thanh toán vào ứng dụng của bạn. Hai API chính được cung cấp là `AutoBank` và `AutoCard` dành cho các web VPN.

Hiện Tại DVSTEAM Đang Hỗ Các Ngân Hàng
- `VietcomBank`
- `ACB Á Châu`
- `MB Bank`
- `ViettelMoney`
- `VietinBank`
- [Web API Bank](https://api.dvsteam.vn)
- [Web API Card](https://gachthedvs.net)
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
### Bước 1: Tải tệp và giải nén
Truy cập vào thư mục `public` giống như trong ảnh, và chọn `Remote download` 

Sau đó dán đường dẫn tải tệp này vào `URL address` như trong ảnh và Bấm "Confirm" để tải tệp xuống
### Link Tải File
```
https://github.com/dvsteam/AutoBank-VPN/releases/download/AutoBank-AutoCard/thanhtoan.zip
```
Video hướng dẫn thêm file AutoBank vào src web


https://github.com/dvsteam/AutoBank-VPN/assets/91702958/848d1f2b-38b9-481a-975a-814932ea0098


### Bước 2: Cấu hình thư mục
Hãy làm giống video ở trên.

* Truy cập vào thư mục `thanhtoan` tìm file `app` và "cut" di chuyển thư mục `app` vào thư mục gốc của web, chọn `Paste` để dán vào thư mục gốc

* chọn `Paste` điền phép toán vào `Result` sau đó bấm `OK`

* Truy cập lại vào thư mục `thanhtoan` và tìm đến file `demo_config.php` Rename đổi tên thành `config.php`
điền đầy đủ thông tin trong `config.php` yêu cầu

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
* `ViettelMoney_DVS` => Ví điện tử ViettelPay
<img src="https://github.com/dvsteam/AutoBank-VPN/assets/91702958/08dd510f-5ac5-40a5-aa59-1c10c2334bcd" width="45%">

### Bước 4: Cài Cron Auto
Đây là những file chạy `Cron` để chạy auto cho web bạn, vui lòng không di chuyển vị trí file sang thư mục khác

<img src="https://github.com/dvsteam/AutoBank-VPN/assets/91702958/0378139b-3fd4-47ec-94ca-fa95f75d36a2" width="85%">

* Hãy thay `dvsteam.net` thành tên đường dẫn file web của bạn nha, Điền thông tin đường dẫn như ví dụ bên dưới vào để chạy auto

Bạn dùng ngân hàng nào thì chọn tệp Cron để phù hợp với `ngân hàng` của bạn

* `DVS_AutoVCB.php` => Ngân Hàng VietcomBank
* `DVS_AutoViettin.php` => Ngân Hàng VietinBank
* `DVS_AutoACB.php` => Ngân Hàng ACB
* `DVS_AutoMBBank.php` => Ngân Hàng MB Bank
* `DVS_AutoViettelPay.php` => Ví điện tử ViettelMoney
* **_Thẻ Cào Không Cần Cron_**

Copy code bên dưới và sửa lại đường dẫn thư mục theo web của bạn
```
php /www/wwwroot/dvsteam.net/public/thanhtoan/Cron/DVS_AutoVCB.php
sleep 30;php /www/wwwroot/dvsteam.net/public/thanhtoan/Cron/DVS_AutoVCB.php
```
* `Lưu ý:` Chạy Cron không vượt quá 30giây nếu vượt quá 30giây sẽ `khóa token` (ko trả lại tiền đâu nha 😎), cấu hình bên trên là đã setup sẵn cho bạn chạy 30giây rồi đó

<img src="https://github.com/dvsteam/AutoBank-VPN/assets/91702958/48c4f047-c87a-4adf-a869-367d17a26a73" width="85%">

### Bước 5:
Thử xem auto hoạt động duyệt đơn chưa chớ còn chờ gì 

# Hỗ Trợ Thoắc Mắc
- [Zalo: 08353.15551](https://zalo.me/dvsteam)
- [Telegram](https://t.me/DuongVanSy)

* `Hệ Thống API DVSTEAM Cảm Ơn Bạn Đã Quan Tâm`
