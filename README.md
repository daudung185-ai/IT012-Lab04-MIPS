# IT012 Lab 04 — MIPS Assembly

Lab 04 thực hành mảng, truy cập bộ nhớ và lệnh điều khiển trong MIPS. Các chương trình dùng dữ liệu công tơ điện để tính mức tiêu thụ theo tháng và phân bậc điện năng.

## Nội dung và kết quả trên MARS 4.4

| Tệp | Nội dung | Kết quả đã kiểm chứng |
| --- | --- | --- |
| [TN1](IT012_Lab04_25520350_TN1.asm) | Đọc mảng chỉ số công tơ bằng `lw`, tính chênh lệch và lưu vào mảng `usage` bằng `sw`. | Ba phần tử đầu của `usage` là 95, 110, 140 kWh. |
| [TN2](IT012_Lab04_25520350_TN2.asm) | Đọc điện năng và dùng lệnh so sánh, rẽ nhánh để chọn một trong bốn bậc. | Kết quả của bảy ca kiểm thử nằm trong bảng bên dưới. |
| [TN3](IT012_Lab04_25520350_TN3.asm) | Duyệt mảng để tính điện năng 12 tháng, tổng năm và tháng dùng nhiều nhất. | Tổng 1995 kWh, tháng 7 cao nhất với 255 kWh. |
| [MR](IT012_Lab04_25520350_MR.asm) | Duyệt `usage` và tăng bộ đếm trong bộ nhớ cho từng bậc. | Số tháng ở bậc 1 đến 4 lần lượt là 2, 4, 2, 4. |

| Điện năng nhập (kWh) | 50 | 100 | 101 | 150 | 151 | 200 | 201 |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bậc quan sát | 1 | 1 | 2 | 2 | 3 | 3 | 4 |

Các khoảng bậc lần lượt là 0–100, 101–150, 151–200 và từ 201 kWh.

## Cách chạy

1. Mở MARS 4.4 bằng `java -jar Mars4_4.jar`.
2. Giữ cấu hình bộ nhớ **Default**. Trong **Settings**, bật pseudo instructions và khởi tạo PC tại `main`, tắt delayed branching và popup input.
3. Mở từng tệp ASM riêng, chọn **Run → Assemble** (F3), rồi **Run → Go** (F5).
4. Với TN1, xem mảng `usage` trong **Data Segment**. Với TN2, nhập một giá trị vào **Run I/O** mỗi lần chạy. TN3 và MR in kết quả trong **Run I/O**.

