<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Cập nhật nhân viên</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- Thêm Bootstrap -->
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        form {
            width: 50%;
            margin: 0 auto;
        }

        label {
            display: inline-block;
            width: 150px;
            margin-top: 5px;
        }

        input, select {
            padding: 5px;
            margin-top: 5px;
            width: 100%;
            box-sizing: border-box;
        }

        .error {
            color: red;
        }

        button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<!-- Form for updating employee information -->
<form:form action="${pageContext.request.contextPath}/nhan-vien/update/${nv.id}" method="post" modelAttribute="nv">
    <label for="tenNhanVien">Tên nhân viên:</label>
    <form:input path="ten_nhan_vien" id="tenNhanVien"/>
    <form:errors path="ten_nhan_vien" cssClass="error"/>

    <label for="gioi_tinh">Giới Tính:</label>
    <form:select path="gioi_tinh" id="gioi_tinh">
        <form:option value="1">Nam</form:option>
        <form:option value="0">Nữ</form:option>
    </form:select>

    <label for="chucVu">Chức vụ:</label>
    <form:select path="chucVu.id" id="chucVu">
        <form:options items="${dsChucVu}" itemValue="id" itemLabel="ten_chuc_vu"/>
    </form:select>
    <form:errors path="chucVu.id" cssClass="error"/>

    <label for="taiKhoan">Tài khoản:</label>
    <form:input path="tai_khoan" id="taiKhoan"/>
    <form:errors path="tai_khoan" cssClass="error"/>

    <label for="matKhau">Mật khẩu:</label>
    <form:password path="matKhau" id="matKhau"/>
    <form:errors path="matKhau" cssClass="error"/>

    <label for="trangThai">Trạng thái:</label>
    <form:select path="trang_thai" id="trangThai">
        <option value="1">Đi làm</option>
        <option value="0">Nghỉ</option>
    </form:select>
    <form:errors path="trang_thai" cssClass="error"/>

    <label for="soDienThoai">Số điện thoại:</label>
    <form:input path="so_dien_thoai" id="soDienThoai"/>
    <form:errors path="so_dien_thoai" cssClass="error"/>

    <label for="diaChi">Địa chỉ:</label>
    <form:input path="dia_chi" id="diaChi"/>
    <form:errors path="dia_chi" cssClass="error"/>

    <label for="email">Email:</label>
    <form:input path="email" id="email"/>
    <form:errors path="email" cssClass="error"/>

    <button type="submit" class="btn btn-success">Cập nhật</button> <!-- Sử dụng lớp btn và btn-success -->
</form:form>

<!-- Nút quay lại danh sách -->
<a href="${pageContext.request.contextPath}/nhan-vien/hien-thi" class="btn btn-primary mt-3">Quay lại danh sách</a> <!-- Sử dụng lớp btn và btn-primary -->

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
