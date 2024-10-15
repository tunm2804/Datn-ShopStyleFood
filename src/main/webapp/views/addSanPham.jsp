<%@page language="java" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Thêm Sản Phẩm</title>
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
        .product-form input,
        .product-form select {
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
            <a class="nav-link" href="/index">Danh sách sản phẩm</a>
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

<h1>Thêm Sản Phẩm Mới</h1>

<div class="product-form">
    <h2>Thông Tin Sản Phẩm</h2>
    <!-- Form to add product with enctype for file upload -->
    <form action="/addProduct" method="post" enctype="multipart/form-data">
        <label for="ma">Mã Sản Phẩm</label>
        <input type="text" id="ma" name="ma" required>

        <label for="ten">Tên Sản Phẩm</label>
        <input type="text" id="ten" name="ten" required>

        <label for="soLuong">Số Lượng</label>
        <input type="number" id="soLuong" name="soLuong" required>

        <label for="danhMuc">Danh Mục</label>
        <select id="danhMuc" name="danhMuc" required>
            <c:forEach items="${danhMucs}" var="dm">
                <option value="${dm.id}">${dm.ten}</option>
            </c:forEach>
        </select>

        <label for="thuongHieu">Thương Hiệu</label>
        <input type="text" id="thuongHieu" name="thuongHieu" required>

        <label for="chatLieu">Chất Liệu</label>
        <select id="chatLieu" name="chatLieu" required>
            <c:forEach items="${chatLieus}" var="cl">
                <option value="${cl.id}">${cl.ten}</option>
            </c:forEach>
        </select>

        <label for="mauSac">Màu Sắc</label>
        <select id="mauSac" name="mauSac" required>
            <c:forEach items="${mauSacs}" var="ms">
                <option value="${ms.id}">${ms.ten}</option>
            </c:forEach>
        </select>

        <label for="size">Size</label>
        <select id="size" name="size" required>
            <c:forEach items="${sizes}" var="sz">
                <option value="${sz.id}">${sz.ten}</option>
            </c:forEach>
        </select>

        <label for="kieuDang">Kiểu Dáng</label>
        <select id="kieuDang" name="kieuDang" required>
            <c:forEach items="${kieuDangs}" var="kd">
                <option value="${kd.id}">${kd.ten}</option>
            </c:forEach>
        </select>

        <label for="qrcode">QR Code</label>
        <input type="text" id="qrcode" name="qrcode" required>

        <label for="trangThai">Trạng Thái</label>
        <select id="trangThai" name="trangThai" required>
            <option value="1">Còn hàng</option>
            <option value="0">Hết hàng</option>
        </select>

        <!-- Upload image input -->
        <label for="image">Ảnh Sản Phẩm</label>
        <input type="file" id="image" name="image" accept="image/*" required>

        <button type="submit" class="btn btn-primary">Thêm Sản Phẩm</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
