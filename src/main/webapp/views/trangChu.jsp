<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sản Phẩm Mới Nhất</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .product-section {
            padding: 50px 0;
        }
        .product-item {
            text-align: center;
        }
        .product-item img {
            width: 100%;
            height: auto;
        }
        .product-title {
            font-size: 18px;
            margin-top: 10px;
        }
        .product-price {
            font-size: 20px;
            font-weight: bold;
            color: #d9534f;
        }
        .view-all {
            text-align: center;
            margin-top: 30px;
        }
    </style>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Footstyle</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active"><a class="nav-link" href="#">Hàng Mới</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Sản phẩm</a></li>
                <li class="nav-item"><a class="nav-link" href="#">SALE</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Tìm kiếm</a></li>
                <li class="nav-item"><a class="nav-link" href="#"><i class="fas fa-user"></i></a></li>
                <li class="nav-item"><a class="nav-link" href="/giohang"><i class="fas fa-shopping-bag"></i></a></li>
            </ul>
        </div>
    </nav>
</header>

<section class="product-section">
    <div class="container">
        <h2 class="text-center">Sản phẩm</h2>
        <p class="text-center">Nâng thời thượng không thể bỏ lỡ những mẫu túi giày hợp mốt</p>
        <div class="row">
            <!-- Product List -->
            <c:forEach var="product" items="${sanphams}">
                <div class="col-md-3">
                    <div class="product-item">
                        <a href="/detail/${product.id}">
                        <img src="/image/${product.anh}" alt="${product.ten}">
                        <h5 class="product-title">${product.ten}</h5>
                        <p class="product-price">${product.giaBan}₫</p>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="view-all">
            <a href="#" class="btn btn-outline-primary">Xem Tất Cả</a>
        </div>
    </div>
</section>

<footer class="text-center">
    <p>&copy; 2024 Footstyle. All rights reserved.</p>
</footer>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
