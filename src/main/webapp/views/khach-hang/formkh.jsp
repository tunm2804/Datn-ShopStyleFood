<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Tạo Khách Hàng</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
</head>
<body>
<div class="container">
  <h2>Tạo Khách Hàng</h2>

  <!-- Form bắt đầu -->
  <form:form action="/khachhang/add" modelAttribute="khachHang" method="post"> <!-- Model Attribute là "khachHang" -->

    <div class="form-group">
      <label for="hoTen">Họ Tên</label>
      <form:input path="hoTen" class="form-control" id="hoTen" /> <!-- Sử dụng path để ánh xạ -->
      <form:errors path="hoTen" cssClass="text-danger"/> <!-- Hiển thị lỗi nếu có -->
    </div>

    <div class="form-group">
      <label for="email">Email</label>
      <form:input path="email" type="email" class="form-control" id="email" />
      <form:errors path="email" cssClass="text-danger"/>
    </div>

    <div class="form-group">
      <label for="trangThai">Trạng Thái</label>
      <form:select path="trangThai" class="form-control" id="trangThai" >
        <form:option value="0" label="Không hoạt động"/> <!-- Tùy chọn Không hoạt động -->
        <form:option value="1" label="Hoạt động"/> <!-- Tùy chọn Hoạt động -->
      </form:select>
      <form:errors path="trangThai" cssClass="text-danger"/>
    </div>

    <div class="form-group">
      <label for="taiKhoan">Tài Khoản</label>
      <form:input path="taiKhoan" class="form-control" id="taiKhoan" />
      <form:errors path="taiKhoan" cssClass="text-danger"/>
    </div>

    <div class="form-group">
      <label for="matKhau">Mật Khẩu</label>
      <form:password path="matKhau" class="form-control" id="matKhau" />
      <form:errors path="matKhau" cssClass="text-danger"/>
    </div>

    <div class="form-group">
      <label for="sdt">Số Điện Thoại</label>
      <form:input path="sdt" class="form-control" id="sdt"  maxlength="15"/>
      <form:errors path="sdt" cssClass="text-danger"/>
    </div>

    <div class="form-group">
      <label for="diaChi">Địa Chỉ</label>
      <form:input path="diaChi" class="form-control" id="diaChi" />
      <form:errors path="diaChi" cssClass="text-danger"/>
    </div>

    <button type="submit" class="btn btn-primary">Tạo Khách Hàng</button>
  </form:form>
  <!-- Form kết thúc -->

</div>
</body>
</html>
