<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Tiêu Đề Trang</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</head>
<body>
<table class="table">
    <thead>
    <th>Sản phẩm</th>
    <th>Đơn giá</th>
    <th>Số lượng</th>
    <th>Thành tiền</th>
    <th>Thao tác</th>
    </thead>
    <tbody>
    <c:forEach var="gh" items="${giohang}">
        <form action="/update/${gh.chiTietSanPham.sanPham.id}" method="post">
        <tr>
            <!-- Lấy tên sản phẩm từ chi tiết sản phẩm -->
            <td>${gh.chiTietSanPham.sanPham.ten}</td>
            <!-- Lấy giá bán từ chi tiết sản phẩm -->
            <td>${gh.chiTietSanPham.sanPham.giaBan}</td>
            <td>
                <input type="number" class="form-control"
                       min="1"
                       name="soLuong"
                       value="${gh.soLuong}"
                       onchange="this.form.submit()"
                       style="width:100px;">
            </td>
            <!-- Thành tiền = số lượng * giá bán -->
            <td>${gh.chiTietSanPham.sanPham.giaBan * gh.soLuong}</td>
            <td>
                <a href="/delete/${gh.chiTietSanPham.sanPham.id}">Xóa</a>
            </td>
        </tr>
        </form>
    </c:forEach>
    </tbody>
</table>
<div class="my-2">Tổng số tiền thanh toán: ${tongGiaTri}</div>
<a class="btn btn-secondary" href="/product">Tiếp tục mua hàng</a>
<a class="btn btn-success" href="">Thanh toán</a>
</body>
</html>
