#!/bin/bash

# =============================================
# AutoBank Tự Động Setup Script cho VPN
# Phát triển bởi DVSTEAM - Admin Sỹ
# Tự động tải về và cài đặt AutoBank từ DVSTEAM
# =============================================
set -e  

# Enable debug mode if needed
# set -x

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
WHITE='\033[1;37m'
NC='\033[0m'

GITHUB_URL="https://github.com/dvsteam/AutoBank-VPN/releases/download/v2.0/thanhtoan.zip"
ZIP_FILE="thanhtoan.zip"
EXTRACT_DIR="thanhtoan"

# Trap để xử lý khi script bị ngắt
trap 'echo -e "\n${RED}❌ Script đã bị ngắt!${NC}"; exit 1' INT TERM

log() {
    echo -e "${GREEN}🔹  $1${NC}"
}

error() {
    echo -e "${RED}❌  [LỖI] $1${NC}"
    exit 1
}

warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

success() {
    echo -e "${GREEN}✅  $1${NC}"
}

info() {
    echo -e "${CYAN}ℹ️  $1${NC}"
}

check_requirements() {
    info "Đang kiểm tra các công cụ cần thiết..."
    sleep 1
    
    if ! command -v wget &> /dev/null && ! command -v curl &> /dev/null; then
        error "Cần cài đặt wget hoặc curl để tải file"
    fi
    
    if ! command -v unzip &> /dev/null; then
        error "Cần cài đặt unzip để giải nén file"
    fi
    
    success "Tất cả công cụ đã sẵn sàng!"
    sleep 1
}

download_and_extract() {
    log "Đang tải về AutoBank từ máy chủ DVSTEAM..."
    sleep 1
    
    [ -f "$ZIP_FILE" ] && rm -f "$ZIP_FILE"
    [ -d "$EXTRACT_DIR" ] && rm -rf "$EXTRACT_DIR"
    
    if command -v wget &> /dev/null; then
        wget -q -O "$ZIP_FILE" "$GITHUB_URL" || error "Không thể tải file từ máy chủ"
    elif command -v curl &> /dev/null; then
        curl -s -L -o "$ZIP_FILE" "$GITHUB_URL" || error "Không thể tải file từ máy chủ"
    fi
    
    info "Đang giải nén AutoBank..."
    sleep 1
    unzip -q "$ZIP_FILE" -d "$EXTRACT_DIR" || error "Không thể giải nén file"
    
    rm -f "$ZIP_FILE"
    
    info "Đang thiết lập quyền truy cập..."
    sleep 1
    chown -R www:www "$EXTRACT_DIR" &>/dev/null || true
    find "$EXTRACT_DIR" -type f -exec chmod 644 {} \; &>/dev/null
    find "$EXTRACT_DIR" -type d -exec chmod 755 {} \; &>/dev/null
    
    success "Tải về và giải nén hoàn tất!"
    sleep 1
}

get_domain() {
    echo
    echo -e "${PURPLE}═══════════════════════════════════════════════${NC}"
    echo -e "${WHITE}            🌐  CẤU HÌNH TÊN MIỀN WEB            ${NC}"
    echo -e "${PURPLE}═══════════════════════════════════════════════${NC}"
    echo
    
    while true; do
        echo -e "${CYAN}Vui lòng nhập tên miền website của bạn:${NC}"
        echo -e "${YELLOW}Ví dụ: dvsteam.net, dvsteam.vn${NC}"
        echo -n "👉  Tên miền: "
        read -r DOMAIN_WEB
        
        # Kiểm tra nếu người dùng nhấn Ctrl+C hoặc EOF
        if [ $? -ne 0 ]; then
            error "Đã hủy quá trình nhập tên miền"
        fi
        
        if [ -z "$DOMAIN_WEB" ]; then
            warning "Vui lòng nhập tên miền!"
            echo
            continue
        fi
        
        # Loại bỏ khoảng trắng đầu và cuối
        DOMAIN_WEB=$(echo "$DOMAIN_WEB" | xargs)
        
        if [[ $DOMAIN_WEB =~ ^[a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?(\.[a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)*$ ]]; then
            success "Tên miền hợp lệ: $DOMAIN_WEB"
            echo
            break
        else
            warning "Tên miền không hợp lệ! Vui lòng nhập lại."
            echo -e "${CYAN}Tên miền phải có định dạng: domain.com, subdomain.domain.com${NC}"
            echo
        fi
    done
}

setup_paths() {
    info "Đang kiểm tra đường dẫn thư mục..."
    sleep 1
    
    CURRENT_DIR=$(pwd)
    
    if [[ "$CURRENT_DIR" != */public ]]; then
        warning "Script được khuyến nghị chạy từ thư mục /public"
        echo -e "${CYAN}Bạn có muốn tiếp tục với thư mục hiện tại không?${NC}"
        echo -n "👉 Tiếp tục? (y/N): "
        read -r continue_anyway
        if [[ ! $continue_anyway =~ ^[Yy]$ ]]; then
            error "Vui lòng chạy script từ thư mục /public"
        fi
    fi
    
    SOURCE_PAYMENTS="$CURRENT_DIR/$EXTRACT_DIR/app/Payments"
    TARGET_PAYMENTS="$CURRENT_DIR/../app/Payments"
    TARGET_APP_DIR="$CURRENT_DIR/../app"
    
    if [ ! -d "$TARGET_APP_DIR" ]; then
        warning "Thư mục ../app không tồn tại"
        echo -e "${CYAN}Bạn có muốn tạo thư mục này không?${NC}"
        echo -n "👉 Tạo thư mục? (Y/n): "
        read -r create_app
        if [[ ! $create_app =~ ^[Nn]$ ]]; then
            mkdir -p "$TARGET_APP_DIR" || error "Không thể tạo thư mục $TARGET_APP_DIR"
            success "Đã tạo thư mục: $TARGET_APP_DIR"
            sleep 1
        else
            error "Cần thư mục app để tiếp tục"
        fi
    fi
    
    success "Đường dẫn đã được thiết lập!"
    sleep 1
}

move_payments_directory() {
    info "Đang kiểm tra thư mục Payments..."
    sleep 1
    
    if [ ! -d "$SOURCE_PAYMENTS" ]; then
        error "Không tìm thấy thư mục Payments trong: $SOURCE_PAYMENTS"
    fi
    
    if [ ! -d "$TARGET_PAYMENTS" ]; then
        mkdir -p "$TARGET_PAYMENTS" || error "Không thể tạo thư mục $TARGET_PAYMENTS"
    fi
    
    SOURCE_FILES=$(find "$SOURCE_PAYMENTS" -maxdepth 1 -type f | wc -l)
    if [ $SOURCE_FILES -eq 0 ]; then
        warning "Không có file nào trong thư mục Payments source"
        return 0
    fi
    
    log "Đang di chuyển $SOURCE_FILES file thanh toán..."
    sleep 1
    
    MOVED_COUNT=0
    FAILED_COUNT=0
    
    for file in "$SOURCE_PAYMENTS"/*; do
        if [ -f "$file" ]; then
            if mv "$file" "$TARGET_PAYMENTS/" &>/dev/null; then
                MOVED_COUNT=$((MOVED_COUNT + 1))
            else
                FAILED_COUNT=$((FAILED_COUNT + 1))
            fi
        fi
    done
    
    info "Đang thiết lập quyền truy cập cho file thanh toán..."
    sleep 1
    chown -R www:www "$TARGET_PAYMENTS" &>/dev/null || true
    find "$TARGET_PAYMENTS" -type f -exec chmod 644 {} \; &>/dev/null
    find "$TARGET_PAYMENTS" -type d -exec chmod 755 {} \; &>/dev/null

    sleep 1
    SOURCE_APP_DIR="$CURRENT_DIR/$EXTRACT_DIR/app"
    if [ -d "$SOURCE_APP_DIR" ]; then
        rm -rf "$SOURCE_APP_DIR" &>/dev/null || true
    fi
    
    if [ $FAILED_COUNT -eq 0 ]; then
        success "Di chuyển $MOVED_COUNT file thanh toán hoàn tất!"
    else
        warning "Di chuyển hoàn tất với $FAILED_COUNT lỗi (thành công: $MOVED_COUNT)"
    fi
    sleep 1
}

create_config() {
    info "Đang tạo file cấu hình config.php..."
    sleep 1
    
    if [ -d "$EXTRACT_DIR" ]; then
        CONFIG_DIR="$EXTRACT_DIR"
        
        if [ $(find "$EXTRACT_DIR" -mindepth 1 -maxdepth 1 -type d | wc -l) -eq 1 ]; then
            CONFIG_DIR=$(find "$EXTRACT_DIR" -mindepth 1 -maxdepth 1 -type d | head -1)
        fi
        
        cat > "$CONFIG_DIR/config.php" << EOF
<?php
const CONFIG = [
    'DOMAIN_WEB' => "$DOMAIN_WEB", //Tên miền web của bạn

    // RETURN_URL nếu bạn dùng landing thì mới cần điền, còn không thì thôi kệ nó, nếu điền hãy điền "index.php"
    'RETURN_URL' => "",
    
    // Hãy allow ip SERVER_MOMOSV3 trên cloudflare nếu bạn dùng AutoMoMo_DVS
    // Allow ip SERVER_MOMOSV3 trên cloudflare nếu bạn dùng AutoMoMo_DVS
    'SERVER_MOMOSV3' => "103.118.28.183",

    // Hãy allow ip SERVER_GACHTHEDVS trên cloudflare nếu bạn dùng AutoCard_DVS
    'SERVER_GACHTHEDVS' => [
        '103.82.23.210'
    ]

];
EOF
        
        success "File config.php đã được tạo với domain: $DOMAIN_WEB"
        sleep 1
        return 0
    else
        error "Không tìm thấy thư mục đã giải nén"
    fi
}

set_permissions() {
    info "Đang thiết lập quyền truy cập cuối cùng..."
    sleep 1
    
    CONFIG_DIR="$EXTRACT_DIR"
    if [ $(find "$EXTRACT_DIR" -mindepth 1 -maxdepth 1 -type d | wc -l) -eq 1 ]; then
        CONFIG_DIR=$(find "$EXTRACT_DIR" -mindepth 1 -maxdepth 1 -type d | head -1)
    fi
    
    find "$CONFIG_DIR" -type d -exec chmod 755 {} \; &>/dev/null
    find "$CONFIG_DIR" -type f -exec chmod 644 {} \; &>/dev/null
    
    for dir in "logs" "uploads" "cache" "tmp"; do
        if [ -d "$CONFIG_DIR/$dir" ]; then
            chmod -R 777 "$CONFIG_DIR/$dir" &>/dev/null
        fi
    done
    
    success "Quyền truy cập đã được thiết lập!"
    sleep 1
}

show_completion_info() {
    echo
    echo -e "${GREEN}═══════════════════════════════════════════════${NC}"
    echo -e "${WHITE}            🎉  CÀI ĐẶT HOÀN TẤT!                ${NC}"
    echo -e "${GREEN}═══════════════════════════════════════════════${NC}"
    echo
    
    FINAL_DIR="$EXTRACT_DIR"
    if [ $(find "$EXTRACT_DIR" -mindepth 1 -maxdepth 1 -type d | wc -l) -eq 1 ]; then
        FINAL_DIR=$(find "$EXTRACT_DIR" -mindepth 1 -maxdepth 1 -type d | head -1)
    fi
        
    echo -e "${PURPLE}📝  CÁC BƯỚC TIẾP THEO:${NC}"
    echo -e "${WHITE}   1.${NC} Truy cập trang ${CYAN}Admin${NC} => ${CYAN}Cấu hình thanh toán${NC}"
    echo -e "${WHITE}   2.${NC} Thêm cấu hình thanh toán => Chọn ${CYAN}Tệp Giao Diện${NC} tương ứng"
    echo -e "${WHITE}   3.${NC} Điền tên ${CYAN}\"Thư Mục Thanh Toán\"${NC} trong Admin là: ${YELLOW}$EXTRACT_DIR${NC}"
    echo -e "${WHITE}   4.${NC} Hãy điền đầy đủ thông tin theo yêu cầu trong Admin.${NC}"
    echo
    
    echo -e "${CYAN}📋  THÔNG TIN DỰ ÁN:${NC}"
    echo -e "${WHITE}   • Tên miền:${NC} ${GREEN}$DOMAIN_WEB${NC}"
    echo -e "${WHITE}   • Thư mục dự án:${NC} ${YELLOW}$(pwd)/$FINAL_DIR${NC}"
    echo -e "${WHITE}   • File cấu hình:${NC} ${YELLOW}config.php${NC}"
    echo -e "${WHITE}   • Phiên bản:${NC} ${YELLOW}AutoBank + AutoCard v2.0${NC}"
    echo

    echo -e "${BLUE}💡  HỖ TRỢ KỸ THUẬT:${NC}"
    echo -e "${WHITE}   • Zalo:${NC} ${CYAN}08353.15551 (Sỹ)${NC}"
    echo -e "${WHITE}   • Telegram:${NC} ${CYAN}@DuongVanSy${NC}"
    echo
    
    success "AutoBank by DVSTEAM đã được cài đặt thành công! 🚀"
}

main() {
    echo -e "${BLUE}"
    echo "════════════════════════════════════════════════════════"
    echo "             ⚡ AUTOBANK SETUP SCRIPT ⚡"
    echo "               by DVSTEAM - Admin Sỹ"
    echo "════════════════════════════════════════════════════════"
    echo -e "${NC}"
    echo -e "${CYAN}🔧  Tự động tải về và cài đặt AutoBank từ máy chủ DVSTEAM${NC}"
    echo -e "${YELLOW}📅  Phiên bản: AutoBank + Auto Card v2.0${NC}"
    echo
    sleep 2
    
    check_requirements
    download_and_extract
    get_domain
    create_config
    setup_paths
    move_payments_directory
    set_permissions
    show_completion_info
}

main "$@"
rm setup_bank.sh
