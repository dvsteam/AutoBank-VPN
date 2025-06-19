# 🏦 AutoBank API - DVSTEAM

> **Hệ thống API tự động hóa thanh toán cho các website VPN**

[![GitHub](https://img.shields.io/badge/GitHub-DVSTEAM-blue?style=flat-square&logo=github)](https://github.com/dvsteam)
[![Website](https://img.shields.io/badge/Website-dvsteam.vn-green?style=flat-square)](https://dvsteam.vn)
[![Support](https://img.shields.io/badge/Support-Zalo-orange?style=flat-square)](https://zalo.me/dvsteam)

## 📖 Tổng quan

**DVSTEAM AutoBank** là giải pháp API mạnh mẽ giúp tự động hóa các giao dịch ngân hàng và thẻ cào cho các website VPN. Hệ thống hỗ trợ tích hợp liền mạch với các platform phổ biến và cung cấp khả năng xử lý thanh toán tự động 24/7.

## 🏛️ Ngân hàng được hỗ trợ

| Ngân hàng | Mã code | Trạng thái |
|-----------|---------|------------|
| 🟢 **VietcomBank** | `VCB` | ✅ Hoạt động |
| 🔵 **ACB (Á Châu)** | `ACB` | ✅ Hoạt động |
| 🟡 **MB Bank** | `MBB` | ✅ Hoạt động |
| 🔴 **VietinBank** | `VTB` | ✅ Hoạt động |

## 🌐 Liên kết quan trọng

- 🌍 **[API Bank Dashboard](https://api.dvsteam.vn)** - Quản lý API ngân hàng
- 💳 **[API Card Dashboard](https://gachthedvs.com)** - Quản lý API thẻ cào  
- 💬 **[Hỗ trợ Zalo Group](https://dvsteam.vn/zalo-hotro-api)** - Nhóm hỗ trợ kỹ thuật
- 🎯 **[Demo Website](https://dvsteam.net)** - Xem demo trang thanh toán

## 🎯 Platform được hỗ trợ

### ✅ VPN Platforms
- **[AikoPanel](https://aikopanel.edu.vn/vi/)** - Panel quản lý VPN hiện đại
- **[V2board](https://v2board.com/)** - Platform VPN phổ biến
- **[Xflash](https://dvsteam.vn/zalo-hotro-api)** - Giải pháp VPN tùy chỉnh
- **V2board mods** - Các phiên bản mod từ V2board

### ⚠️ Lưu ý quan trọng
> Hiện tại API chỉ tối ưu cho các website VPN. Đối với các loại website khác, vui lòng liên hệ riêng để được tư vấn tích hợp.
## 🚀 Tính năng nổi bật

### 💡 Dành riêng cho VPN Services
- ✅ **Auto-approve đơn hàng đã hủy**: Tự động duyệt khi người dùng chuyển tiền đúng nội dung và số tiền
- 💰 **Xử lý thanh toán linh hoạt**: 
  - Tự động cộng dồn khi khách chuyển thiếu tiền
  - Hoàn lại khi chuyển dư (công bằng, minh bạch)
  - Xử lý trong cùng 1 nội dung đơn hàng
- ⚡ **Real-time processing**: Xử lý giao dịch tức thời 24/7
- 🔔 **Thông báo Telegram**: Bot tự động thông báo mọi giao dịch

### 📱 Demo Bot Thông Báo

<div align="center">

| 🏦 **Ngân Hàng** | 💳 **Thẻ Cào** |
|:---:|:---:|
| <img src="https://github.com/dvsteam/AutoBank-VPN/assets/91702958/c711102f-7387-4fd6-b73e-350533f9a245" width="250"> | <img src="https://github.com/dvsteam/AutoBank-VPN/assets/91702958/fde6a41f-2955-4e57-94d5-36f632d7b4a1" width="250"> |

</div>

---

## 🛠️ Hướng dẫn cài đặt

### 📋 Yêu cầu hệ thống
- **aaPanel** Control Panel (khuyến nghị)
- **PHP** 7.4 trở lên
- **Nginx** Web Server
- **ionCube** Loader (bắt buộc)

### 🎯 Bước 1: Chạy lệnh setup tự động

> ⚠️ **Quan trọng**: Bắt buộc phải chạy lệnh trong thư mục `public` của mã nguồn

**Ví dụ đường dẫn:**
```bash
cd /www/wwwroot/AikoPanel/public/
```

<div align="center">
<img src="https://github.com/user-attachments/assets/250582c2-646c-48cc-8a01-c579468c88ba" width="80%">
</div>

**📥 Lệnh setup (Copy và paste vào terminal):**
```bash
curl -fsSL https://raw.githubusercontent.com/dvsteam/AutoBank-VPN/refs/heads/main/setup_bank.sh -o setup_bank.sh && chmod +x setup_bank.sh && ./setup_bank.sh
```

### 🔧 Bước 2: Cài đặt iconCube (nếu chưa có)

Để tránh màn hình trắng khi chọn **Tệp Giao Diện**:

<div align="center">
<img src="https://github.com/dvsteam/AutoBank-VPN/assets/91702958/ff59e34e-6b27-4f0d-83fa-fc6e9a00a671" width="80%">
</div>

### ⚙️ Bước 3: Cấu hình Admin Panel

1. **Truy cập Admin Panel** → **Cấu Hình Thanh Toán**
2. **Chọn "Thêm phương thức thanh toán"**
3. **Chọn Tệp Giao Diện phù hợp với ngân hàng:**

| Tệp Giao Diện | Ngân Hàng | Mô tả |
|---------------|-----------|-------|
| `AutoACB_DVS` | 🔵 ACB | Ngân hàng Á Châu |
| `AutoVCB_DVS` | 🟢 VietcomBank | Ngân hàng Ngoại Thương |
| `AutoViettin_DVS` | 🔴 VietinBank | Ngân hàng Công Thương |
| `AutoMBBank_DVS` | 🟡 MB Bank | Ngân hàng Quân Đội |
| `AutoCard_DVS` | 💳 Thẻ Cào | **Không cần Cron** |

<div align="center">
<img src="https://github.com/dvsteam/AutoBank-VPN/assets/91702958/08dd510f-5ac5-40a5-aa59-1c10c2334bcd" width="60%">
</div>

### ⏰ Bước 4: Cài đặt Cron Job

> 🎯 **Chỉ cần chạy 1 file Cron duy nhất**: `DVS_AutoBank.php` (tự động chạy tất cả ngân hàng)

**📝 Hướng dẫn cài đặt:**

1. **Mở Cron Panel** → **Add Task**
2. **Điền thông tin:**
   - **Task type**: `Shell Script`
   - **Task name**: `AutoBank DVSTEAM`
   - **Execute cycle**: `N Minutes` → `1 minutes`
   - **Execute user**: `root`
   - **Script content**: 

```bash
php /www/wwwroot/{TÊN_ĐƯỜNG_DẪN_CỦA_BẠN}/public/thanhtoan/Cron/DVS_AutoBank.php
```

**💡 Ví dụ cụ thể:**
```bash
php /www/wwwroot/AikoPanel/public/thanhtoan/Cron/DVS_AutoBank.php
```

> ⚠️ **Cảnh báo quan trọng**: Cron không được chạy quá 60 giây, nếu vượt quá sẽ bị khóa token!

### 🎉 Bước 5: Kiểm tra hoạt động

**Test các chức năng:**
- ✅ Tạo đơn hàng mẫu
- ✅ Chuyển tiền test (số tiền nhỏ)
- ✅ Kiểm tra auto duyệt đơn
- ✅ Xem thông báo Telegram Bot

---

## 📞 Hỗ trợ kỹ thuật

<div align="center">

| Kênh hỗ trợ | Thông tin liên hệ | Thời gian |
|:---:|:---:|:---:|
| 📱 **Zalo** | [08353.15551](https://zalo.me/dvsteam) | 24/7 |
| 📧 **Telegram** | [@DuongVanSy](https://t.me/DuongVanSy) | 24/7 |
| 🌐 **Website** | [dvsteam.vn](https://dvsteam.vn) | 24/7 |

</div>

---

## 📄 License & Credits

```
Copyright © 2025 DVSTEAM
Hệ thống API AutoBank được phát triển bởi DVSTEAM
Cảm ơn bạn đã tin tướng và sử dụng dịch vụ của chúng tôi!
```

<div align="center">

**⭐ Nếu project hữu ích, hãy cho chúng tôi 1 Star nhé! ⭐**

[![GitHub stars](https://img.shields.io/github/stars/dvsteam/AutoBank-VPN?style=social)](https://github.com/dvsteam/AutoBank-VPN)

</div>
