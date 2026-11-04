# open-source-lms
An open-source Learning Management System (LMS) built with WordPress and TutorLMS, featuring online courses, learning materials, automated quizzes and scoring, and completion certificates. The project also includes custom theme development, open-source license documentation, and WordPress security enhancements.
# G7 Open Source LMS

**Dự án xây dựng hệ thống quản lý học tập trực tuyến sử dụng nền tảng mã nguồn mở WordPress.**

## 1. Giới thiệu dự án

G7 Open Source LMS là dự án xây dựng hệ thống quản lý học tập trực tuyến (Learning Management System – LMS) dựa trên nền tảng WordPress kết hợp với plugin Tutor LMS.

Dự án được thực hiện nhằm nghiên cứu khả năng ứng dụng phần mềm mã nguồn mở trong việc xây dựng hệ thống đào tạo trực tuyến, hỗ trợ quản lý khóa học, bài học, bài kiểm tra và kết quả học tập.

Bên cạnh việc triển khai các chức năng LMS, nhóm còn thực hiện tùy chỉnh giao diện, mở rộng chức năng bằng PHP và đánh giá các vấn đề bảo mật của hệ thống.

## 2. Mục tiêu dự án

- Tìm hiểu và triển khai nền tảng WordPress mã nguồn mở.
- Xây dựng hệ thống quản lý khóa học trực tuyến bằng Tutor LMS.
- Tùy chỉnh giao diện và bổ sung chức năng bằng Astra Child Theme.
- Xây dựng nội dung khóa học, bài học và bài kiểm tra mẫu.
- Nghiên cứu các biện pháp bảo mật cho website WordPress.
- Thực hiện kiểm thử và đánh giá mức độ an toàn của hệ thống.

## 3. Công nghệ sử dụng

| Công nghệ | Vai trò |
|---|---|
| WordPress | Nền tảng quản trị nội dung |
| Tutor LMS | Quản lý khóa học và bài kiểm tra |
| Astra / Astra Child Theme | Giao diện và tùy chỉnh chức năng |
| PHP | Phát triển chức năng mở rộng |
| MySQL | Quản lý cơ sở dữ liệu |
| HTML, CSS | Xây dựng và tùy chỉnh giao diện |
| LocalWP | Môi trường triển khai cục bộ |
| Kali Linux | Môi trường kiểm thử bảo mật |
| WPScan | Quét và đánh giá bảo mật WordPress |

## 4. Chức năng hệ thống

### 4.1. Quản lý khóa học
- Tạo và hiển thị khóa học trực tuyến.
- Quản lý thông tin và nội dung khóa học.
- Tổ chức bài học theo từng khóa học.

### 4.2. Quản lý học tập
- Hỗ trợ học viên truy cập nội dung khóa học.
- Tổ chức bài kiểm tra và câu hỏi trắc nghiệm.
- Thiết lập điều kiện đạt bài kiểm tra.
- Hỗ trợ cấp chứng chỉ khi đáp ứng điều kiện của hệ thống.

### 4.3. Tùy chỉnh giao diện và chức năng
- Sử dụng Astra Child Theme để tùy chỉnh giao diện.
- Bổ sung shortcode `[g7_notice]`.
- Tùy chỉnh CSS cho giao diện website.

### 4.4. Bảo mật hệ thống
- Thay đổi đường dẫn đăng nhập mặc định bằng WPS Hide Login.
- Hạn chế đăng nhập sai nhiều lần.
- Sử dụng Wordfence hỗ trợ bảo vệ website.
- Kiểm tra bảo mật bằng WPScan.

## 5. Cấu trúc thư mục

```text
open-source-lms/
├── .gitignore
├── .htaccess
├── README.md
├── astra-child/
│   ├── style.css
│   └── functions.php
├── assets/
│   ├── css/
│   │   └── custom-style.css
│   └── lms-assets/
├── database.sql
└── wpscan_report.txt
```

## 6. Hướng dẫn cài đặt

### 6.1. Yêu cầu môi trường

- LocalWP hoặc môi trường máy chủ hỗ trợ WordPress.
- PHP tương thích với phiên bản WordPress.
- MySQL hoặc MariaDB.
- WordPress.
- Theme Astra.
- Plugin Tutor LMS.

### 6.2. Các bước triển khai

**Bước 1: Cài đặt WordPress**

Tạo một website WordPress mới bằng LocalWP hoặc môi trường tương đương.

**Bước 2: Cài đặt theme**

- Cài đặt và kích hoạt Astra.
- Sao chép thư mục `astra-child` vào `wp-content/themes/`.
- Kích hoạt Astra Child Theme.

**Bước 3: Cài đặt plugin**

Cài đặt Tutor LMS và các plugin cần thiết theo danh sách cấu hình của dự án.

**Bước 4: Khôi phục cơ sở dữ liệu**

- Tạo database mới.
- Import file `database.sql`.
- Cập nhật thông tin kết nối database trong cấu hình WordPress.
- Cập nhật URL website phù hợp với môi trường triển khai.

**Bước 5: Kiểm tra hệ thống**

Truy cập website, kiểm tra giao diện, khóa học, bài học, quiz và các chức năng liên quan.

## 7. Kiểm thử và đánh giá bảo mật

Nhóm sử dụng WPScan trên Kali Linux để kiểm tra các thành phần của website WordPress, bao gồm phiên bản nền tảng, theme, plugin và các dấu hiệu liên quan đến lỗ hổng bảo mật.

Các kết quả kiểm thử và đánh giá được trình bày trong:

- `wpscan_report.txt`: Kết quả quét WPScan.
- `docs/Vulnerability_Report.docx`: Báo cáo đánh giá lỗ hổng bảo mật.

Các kết quả cần được đối chiếu với phiên bản thực tế của từng thành phần trước khi kết luận về mức độ ảnh hưởng.

## 8. Tài liệu dự án

Các tài liệu và sản phẩm của dự án được lưu trữ trong thư mục `docs/`, bao gồm:

- Báo cáo lý thuyết.
- Bảng kiểm kê giấy phép phần mềm.
- Báo cáo đánh giá bảo mật.
- Slide thuyết trình.

## 9. Nhóm thực hiện

**Nhóm G7 – Open Source LMS**

Dự án được triển khai thông qua sự phân công nhiệm vụ giữa các thành viên:

- TV1: Infrastructure & Theory.
- TV2: WordPress & Code.
- TV3: LMS Content.
- TV4: UI & Security.
- TV5: Tester & Security Assessment.
- TV6: Writer & Speaker.

## 10. Lưu ý

Dự án được thực hiện phục vụ mục đích học tập và nghiên cứu.

Cơ sở dữ liệu đi kèm sử dụng dữ liệu demo. Khi triển khai trên môi trường khác, cần kiểm tra lại cấu hình kết nối database, URL website, tài khoản quản trị và các thiết lập plugin.

Không sử dụng cấu hình demo trực tiếp cho môi trường thực tế khi chưa thực hiện các biện pháp bảo mật cần thiết.