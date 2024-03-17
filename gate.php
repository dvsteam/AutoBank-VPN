<?php
if ($gate == "ViettelMoney_DVS") {
	include('Views/MBBank_DVS.php');
}
if ($gate == "AutoVCB_DVS") {
	include('Views/VCB_DVS.php');
}
if ($gate == "AutoACB_DVS") {
	include('Views/ACB_DVS.php');
}
if ($gate == "AutoCard_DVS") {
	include('Views/data_CardDVS.php');
}
if ($gate == "AutoViettin_DVS") {
	include('Views/Viettin_DVS.php');
}
if ($gate == "AutoMBBank_DVS") {
	include('Views/MBBank_DVS.php');
}
