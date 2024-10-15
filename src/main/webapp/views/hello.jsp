<%@page language="java" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Quản Lý Sản Phẩm</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* Chiều cao tối thiểu của body */
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
        footer {
            text-align: center;
            padding: 20px;
            background-color: #343a40;
            color: white;
            margin-top: auto; /* Đẩy footer xuống dưới */
        }
    </style>
</head>
<body>

<div class="navbar">
    <ul class="nav">
        <li class="nav-item">
            <a class="nav-link" href="/addSp">Thêm Sản Phẩm</a>
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
        <th>Trạng Thái</th>
        <th>Hành Động</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${dataSp}" var="sp">
        <tr>
            <td>${sp.ma}</td>
            <td>${sp.ten}</td>
                            <td>
                                <img src="/image/${sp.anh}" alt="${sp.ten}" style="width:100px; height:auto;">
                            </td>
            <td>${sp.soLuong}</td>
            <td>${sp.danhMuc.ten}</td>
            <td>${sp.thuongHieu}</td>
            <td>
                <c:choose>
                    <c:when test="${sp.trangThai == 1}">
                        Còn hàng
                    </c:when>
                    <c:otherwise>
                        Hết hàng
                    </c:otherwise>
                </c:choose>
            </td>
            <td class="action-icons">
                <a href="#"><i class="fa-solid fa-pen"></i></a>
                <a href="#"><i class="fa-solid fa-trash"></i></a>
                <a href="/spct"><i class="fa-solid fa-circle-info"></i></a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
