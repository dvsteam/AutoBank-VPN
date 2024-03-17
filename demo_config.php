<?php
const CONFIG = [
    'DOMAIN_WEB' => "dvsteam.net", //Tên miền web của bạn
    'DATABASE' => [ // vào file .env của src web để xem thông tin TK, MK DB
        'HOST' => "localhost",
        'DBNAME' => "bbbb" , // DB_DATABASE trong file.env
        'USERNAME' => "aaaa", // DB_USERNAME trong file .env
        'PASSWORD' => "xxxx", // DB_PASSWORD trong file .env
    ],
    'GATE' => [
        'CARD_DVS' => [
            'hookCard_DVS' => "xxx", //link hookcard mà dvsteam đã setup trước đó
            'WEBHOOK' => "xxx", // link (Địa Chỉ Thông Báo) trong web admin mục (Cấu Hình Thanh Toán)
            'KEY_CARD' => "xxxxx", // Key API https://gachthedvs.net
            'CHIEUKHAU' => "1", // Chiếu Khấu Thẻ
            'CHAT_ID' => "102345xxxx" // lấy ID telegram tại https://t.me/getmyid_bot
            // Bấm Start bot https://t.me/AutoCardDVS_Bot để nhận thông báo giao dịch Card
        ]
    ],
];
