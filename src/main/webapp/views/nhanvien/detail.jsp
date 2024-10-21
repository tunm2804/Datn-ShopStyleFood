<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chi Tiết Nhân Viên</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .details {
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 5px;
            max-width: 500px;
            margin-bottom: 20px; /* Tạo khoảng cách giữa thông tin và nút quay lại */
        }
    </style>
</head>
<body>
<h1 class="display-4 text-center">Chi Tiết Nhân Viên</h1> <!-- Thêm lớp display-4 và căn giữa tiêu đề -->
<div class="details">
    <p><strong>Tên Nhân Viên:</strong> ${nhanVien.ten_nhan_vien}</p>
    <p><strong>Chức Vụ:</strong> ${nhanVien.chucVu.ten_chuc_vu}</p>
    <p><strong>Tài Khoản:</strong> ${nhanVien.tai_khoan}</p>
    <p><strong>Trạng Thái:</strong> ${nhanVien.trang_thai == 1 ? 'Đi làm' : 'Nghỉ'}</p>
    <p><strong>Số điện thoại:</strong> ${nhanVien.so_dien_thoai}</p>
    <p><strong>Email:</strong> ${nhanVien.email}</p>
    <p><strong>Địa Chỉ:</strong> ${nhanVien.dia_chi}</p>
</div>

<a href="${pageContext.request.contextPath}/nhan-vien/hien-thi" class="btn btn-primary">Quay lại danh sách nhân viên</a> <!-- Sử dụng lớp btn và btn-primary -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
