<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Thêm Nhân Viên</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .form-container {
            width: 50%;
            margin: auto;
            margin-top: 50px;
            border: 1px solid #dddddd;
            padding: 20px;
            border-radius: 5px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="email"], select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #cccccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            border-radius: 4px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="form-container">
    <form action="${pageContext.request.contextPath}/nhan-vien/them" method="post">
        <form:form modelAttribute="nhanVien" method="post">
            <label for="ten_nhan_vien">Tên Nhân Viên:</label>
            <form:input path="ten_nhan_vien" id="ten_nhan_vien"/>

            <label for="gioi_tinh">Giới Tính:</label>
            <form:select path="gioi_tinh" id="gioi_tinh">
                <form:option value="1">Nam</form:option>
                <form:option value="0">Nữ</form:option>
            </form:select>

            <label for="chuc_vu_id">Chức Vụ:</label>
            <form:select path="chucVu.id" id="chuc_vu_id">
                <c:forEach items="${dsChucVu}" var="cv">
                    <form:option value="${cv.id}">${cv.ten_chuc_vu}</form:option>
                </c:forEach>
            </form:select>

            <label for="tai_khoan">Tài Khoản:</label>
            <form:input path="tai_khoan" id="tai_khoan"/>

            <div class="form-group">
                <label for="matKhau">Mật Khẩu</label>
                <form:password path="matKhau" class="form-control" id="matKhau"/>
                <form:errors path="matKhau" cssClass="text-danger"/>
            </div>
            <label for="trang_thai">Trạng Thái:</label>
            <form:select path="trang_thai" id="trang_thai">
                <form:option value="1">Đi làm</form:option>
                <form:option value="0">Nghỉ</form:option>
            </form:select>

            <label for="so_dien_thoai">Số Điện Thoại:</label>
            <form:input path="so_dien_thoai" id="so_dien_thoai"/>

            <label for="dia_chi">Địa Chỉ:</label>
            <form:input path="dia_chi" id="dia_chi"/>

            <label for="email">Email:</label>
            <form:input path="email" id="email" type="email"/>

            <input type="submit" value="Thêm Nhân Viên"/>
        </form:form>
    </form>
</div>
</body>
</html>
