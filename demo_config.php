<?php
const CONFIG = [
    'DOMAIN_WEB' => "xxxxxx.xxx", // * Điền tên miền web của bạn

    'DATABASE' => [ // vào file .env của src web để xem thông tin TK, MK DB
        'HOST' => "localhost", // Mặt định là localhost (không cần sửa)
        'DBNAME' => "xxxxxx", // *DB_DATABASE trong file.env
        'USERNAME' => "xxxxxx", // *DB_USERNAME trong file .env
        'PASSWORD' => "xxxxxx", // *DB_PASSWORD trong file .env
    ],
    // Hãy allow ip SERVER_MOMOSV3 trên cloudflare nếu bạn dùng AutoMoMo_DVS
    'SERVER_MOMOSV3' => '103.118.28.183',
    // Đối với MoMo hãy điền link vào mục Đăng Ký Webhook trên "https://momosv3.apimienphi.com" mới auto được
    // Ví dụ: https://xxxxxx.xxx/Webhook/Momosv3.php, (xxxxxx.xxx hãy thay bằng tên miền của bạn)

    // Hãy allow ip SERVER_GACHTHEDVS trên cloudflare nếu bạn dùng AutoCard_DVS
    'SERVER_GACHTHEDVS' => '45.76.176.148'
];
