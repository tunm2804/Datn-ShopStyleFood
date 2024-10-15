<%@page language="java" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Danh Sách Sản Phẩm</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: #f8f9fa;
        }
        .navbar {
            background-color: #343a40;
            padding: 10px;
        }
        .nav {
            list-style: none;
            padding: 0;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            width: 100%;
        }
        .nav-item {
            margin: 0 15px;
        }
        .nav-link {
            font-weight: bold;
            color: #fff;
            transition: color 0.3s;
        }
        .nav-link:hover {
            color: #ffc107;
        }
        h1 {
            text-align: center;
            margin-top: 20px;
            color: #343a40;
        }
        .btn-toolbar {
            margin: 20px;
            display: flex;
            justify-content: flex-end;
        }
        .btn-toolbar button {
            margin-left: 10px;
        }
        table {
            width: 100%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 15px;
            text-align: center;
            border: 1px solid #ddd;
            background-color: #fff;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tbody tr:hover {
            background-color: #e9ecef;
        }
        .action-icons a {
            margin: 0 5px;
            color: #007bff;
            text-decoration: none;
            transition: color 0.3s;
        }
        .action-icons a:hover {
            color: #0056b3;
        }
        .search-input {
            width: 250px;
        }
        .product-form {
            margin: 20px;
            padding: 20px;
            border: 1px solid #ddd;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .product-form h2 {
            margin-bottom: 20px;
            text-align: center;
        }
        .product-form label {
            font-weight: bold;
            margin-top: 10px;
        }
        .product-form input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>

<div class="navbar">
    <ul class="nav">
        <li class="nav-item">
            <a class="nav-link" href="#">Thêm Sản Phẩm</a>
        </li>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="dropdownMenuButton1" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Thuộc Tính Sản Phẩm
            </a>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                <li><a class="dropdown-item" href="#">Màu Sắc</a></li>
                <li><a class="dropdown-item" href="#">Chất liệu</a></li>
                <li><a class="dropdown-item" href="#">Size</a></li>
            </ul>
        </li>
        <li class="nav-item ms-auto">
            <form class="d-flex" action="/search" method="GET">
                <input class="form-control me-2 search-input" type="search" placeholder="Tìm kiếm sản phẩm theo tên..." aria-label="Search" name="query">
                <button class="btn btn-outline-success" type="submit">Tìm kiếm</button>
            </form>
        </li>
    </ul>
</div>

<h1>Danh Sách Sản Phẩm</h1>

<div class="btn-toolbar">
    <button class="btn btn-secondary me-3" onclick="window.location.href='/index'">Quay về trang chủ</button>
    <button class="btn btn-primary" onclick="window.location.href='/importExcel'">Import Excel</button>
    <button class="btn btn-success" onclick="window.location.href='/exportExcel'">Xuất Excel</button>
    <button class="btn btn-danger" onclick="window.location.href='/exportPDF'">Xuất PDF</button>
</div>


<table>
    <thead>
    <tr>
        <th>Mã Sản Phẩm</th>
        <th>Tên Sản Phẩm</th>
        <th>Ảnh</th>
        <th>Số Lượng</th>
        <th>Danh Mục</th>
        <th>Thương Hiệu</th>
        <th>Chất Liệu</th>
        <th>Màu sắc</th>
        <th>Size</th>
        <th>QR Code</th>
        <th>Trạng Thái</th>
        <th>Hành Động</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${dataSpct}" var="spct">
    <tr>
        <td><a href="sanphamDetail?id=${spct.sanPham.id}">${spct.sanPham.ma}</a></td>
        <td>${spct.sanPham.ten}</td>
        <td><img src="/image/${spct.sanPham.anh}" alt="${spct.sanPham.ten}" style="width:100px; height:auto;"></td>
        <td>${spct.sanPham.soLuong}</td>
        <td>${spct.sanPham.danhMuc.ten}</td>
        <td>${spct.sanPham.thuongHieu}</td>
        <td>${spct.sanPham.chatLieu.ten}</td>
        <td>${spct.mauSac.ten}</td>
        <td>${spct.size.ten}</td>
        <td>${spct.qrcode}</td>
        <td>
            <c:choose>
                <c:when test="${spct.sanPham.trangThai == 1}">
                    <span class="status-in-stock">Còn hàng</span>
                </c:when>
                <c:otherwise>
                    <span class="status-out-of-stock">Hết hàng</span>
                </c:otherwise>
            </c:choose>
        </td>
        <td class="action-icons">
            <a href="#"><i class="fa-solid fa-pen"></i></a>
            <a href="#"><i class="fa-solid fa-trash"></i></a>
        </td>
    </tr>
    </c:forEach>

</table>

<c:if test="${not empty selectedProduct}">
    <div class="product-form">
        <h2>Chi Tiết Sản Phẩm</h2>
        <form>
            <label for="ma">Mã Sản Phẩm</label>
            <input type="text" id="ma" value="${selectedProduct.sanPham.ma}" readonly>

            <label for="ten">Tên Sản Phẩm</label>
            <input type="text" id="ten" value="${selectedProduct.sanPham.ten}" readonly>

            <label for="soLuong">Số Lượng</label>
            <input type="text" id="soLuong" value="${selectedProduct.sanPham.soLuong}" readonly>

            <label for="danhMuc">Danh Mục</label>
            <input type="text" id="danhMuc" value="${selectedProduct.sanPham.danhMuc.ten}" readonly>

            <label for="thuongHieu">Thương Hiệu</label>
            <input type="text" id="thuongHieu" value="${selectedProduct.sanPham.thuongHieu}" readonly>

            <label for="thuongHieu">Chất Hiệu</label>
            <input type="text" id="chatLieu" value="${selectedProduct.sanPham.chatLieu.ten}" readonly>

            <label for="mauSac">Màu Sắc</label>
            <input type="text" id="mauSac" value="${selectedProduct.mauSac.ten}" readonly>

            <label for="size">Size</label>
            <input type="text" id="size" value="${selectedProduct.size.ten}" readonly>

            <label for="qrcode">QR Code</label>
            <input type="text" id="qrcode" value="${selectedProduct.qrcode}" readonly>

            <label for="trangThai">Trạng Thái</label>
            <input type="text" id="trangThai" value="${selectedProduct.sanPham.trangThai == 1 ? 'Còn hàng' : 'Hết hàng'}" readonly>
        </form>
    </div>
</c:if>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
