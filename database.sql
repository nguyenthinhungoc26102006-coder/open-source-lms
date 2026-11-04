# Báo cáo làm sạch database.sql — G7 Open Source LMS

## Phạm vi
- File nguồn: `database.sql` (dump MySQL 8.4 / AdminNeo).
- Đã giữ nguyên 58 câu lệnh tạo bảng (`CREATE TABLE`), tên bảng, prefix `wp_`, cột, index, khóa chính và định nghĩa bảng.
- Không có MySQL server trong môi trường xử lý, vì vậy đã kiểm tra cấu trúc/định dạng bằng bộ phân tích SQL nội bộ nhưng chưa thực hiện import thật vào MySQL.

## Thông tin nhạy cảm phát hiện và xử lý
- Tài khoản WordPress: tìm thấy 1 tài khoản quản trị (`ID=1`). Đã đổi login thành `demo_admin`, display name thành `Demo Administrator`, email thành `demo-admin@example.com`, URL thành `https://example.com`; trường password được thay bằng dấu vô hiệu `!DISABLED_FOR_PUBLIC_DUMP!` và activation key để trống. Tài khoản sẽ không đăng nhập được cho đến khi đặt lại mật khẩu sau khi import.
- Email: địa chỉ cá nhân trong user/admin settings và cấu hình cảnh báo đã được thay bằng địa chỉ `example.com`. Email bình luận cũng được thay bằng `commenter@example.com`. Địa chỉ email demo trong cấu hình mail là `demo-mail@example.com`.
- URL LocalWP: đã thay `http://g7-wordpress.local` bằng `https://example.com` ở các trường URL phù hợp, bao gồm `siteurl`, `home`, URL của bài viết và nội dung có URL đó.
- Session đăng nhập: giá trị `session_tokens` của user đã được thay bằng mảng serialized rỗng `a:0:{}`.
- Wordfence: đã xóa/đặt rỗng các giá trị xác thực và nonce như `apiKey`, `encKey`, `longEncKey`, `supportHash`, `wfsbskipHash`, `whitelistHash`, `dbTest`, `detectProxyNonce`, `cbl_cookieVal`; xóa dữ liệu IP/runtime có tính cục bộ trong `ipResolutionList`, `recentServerAddr`, `serverDNS`; thay `activatingIP` bằng `0.0.0.0`.
- Wordfence Login Security: đã làm rỗng `shared-hash-secret` và `shared-symmetric-secret`.
- Email cảnh báo Wordfence được đổi thành `demo-admin@example.com`; transient `wfRegistrationToken` đã được làm rỗng.
- Đường dẫn Windows và nhật ký truy cập: đã bỏ dữ liệu dòng (rows) khỏi các bảng nhật ký/kiểm kê tệp Wordfence `wp_wffilemods` (1.925 rows), `wp_wfhits` (1.456 rows), `wp_wfknownfilelist` (7.415 rows). Các bảng và schema vẫn được giữ nguyên; dữ liệu này là log/runtime, không phải nội dung khóa học.

## Dữ liệu được giữ
- Toàn bộ 58 schema bảng, không đổi prefix, tên bảng hay cấu trúc.
- `wp_posts`: 64 rows, gồm 4 `courses`, 17 `lesson`, 9 `tutor_quiz`, 7 `topics`, 5 `tutor_assignments` cùng các loại nội dung khác.
- `wp_postmeta`: 139 rows.
- `wp_tutor_quiz_questions`: 39 rows; `wp_tutor_quiz_question_answers`: 92 rows.
- `wp_options`: 193 rows; `wp_usermeta`: 32 rows; các bảng terms/relationships và cấu hình còn lại được giữ.
- Không xóa dữ liệu chỉ vì tên trường có chứa `key`, `token`, `password` hoặc `secret`; chỉ xử lý những trường/giá trị đã nhận diện là thông tin xác thực, session, nonce hoặc dữ liệu runtime nhạy cảm.

## Kiểm tra sau làm sạch
- 58/58 bảng có định nghĩa `CREATE TABLE`; không phát hiện tên bảng trùng.
- 15 câu lệnh `INSERT` còn lại đều được phân tích cấu trúc thành công; số trường trong mỗi hàng khớp với danh sách cột.
- Không phát hiện độ dài chuỗi PHP serialized bị sai trong các giá trị đã kiểm tra.
- Không còn URL LocalWP/localhost được nhận diện hoặc đường dẫn `C:\Users\...` trong file đầu ra.
- Email còn lại chỉ là địa chỉ demo `example.com`.
- `0.0.0.0` còn lại là giá trị placeholder đã chủ động đặt cho trường IP, không phải IP máy cá nhân.

## Giới hạn và việc cần làm thủ công
1. **Chưa kiểm thử import thật** vào MySQL, chưa khởi chạy WordPress/Tutor LMS để xác nhận luồng khóa học, quiz, đăng nhập hoặc chứng chỉ.
2. Các bảng Tutor LMS về customer/order/cart/earnings/withdrawals có schema nhưng không có dữ liệu `INSERT` trong dump nguồn. Không thể xác nhận các dữ liệu này hoặc dữ liệu chứng chỉ đã tồn tại trong nguồn; file làm sạch không tự tạo dữ liệu còn thiếu.
3. Trước khi sử dụng website đã khôi phục, hãy đặt lại mật khẩu quản trị bằng WordPress/WP-CLI và cấu hình URL đúng của môi trường đích. `https://example.com` chỉ là placeholder an toàn, không phải URL khôi phục thực tế.
4. Sau khi import vào môi trường riêng, kiểm tra lại cấu hình Wordfence/Login Security và tạo lại các secret cần thiết. Không đưa secret mới vào GitHub.
5. Nên rà soát thủ công nội dung văn bản trong bài viết/metadata để phát hiện thông tin cá nhân không theo định dạng email/URL/đường dẫn (ví dụ số điện thoại, tên thật trong nội dung tự do). Các chuỗi không thể xác định chắc chắn là dữ liệu thật hay demo không bị tự ý xóa.
6. Nếu bản dump gốc từng được chia sẻ công khai, hãy xoay vòng các mật khẩu/secret tương ứng bên ngoài file; làm sạch bản SQL không thu hồi được bản sao cũ.

## Kết luận
**Đã làm sạch đáng kể, nhưng chưa thể chứng nhận tuyệt đối “đủ điều kiện công khai”** vì chưa thử import trên MySQL và chưa rà soát thủ công mọi trường văn bản tự do. Bản này phù hợp để đưa vào bước review trước khi công khai; hãy hoàn thành các mục thủ công nêu trên trước khi push lên GitHub.
