<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>${product.ten} - Chi tiết sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <style>
        body {
            background-color: #f8f9fa; /* Màu nền nhẹ nhàng */
        }
        .product-image {
            width: 100%; /* Đảm bảo hình ảnh chiếm toàn bộ chiều rộng */
            height: auto;
            border-radius: 10px; /* Bo góc cho hình ảnh */
        }
        .product-details {
            background-color: white; /* Nền trắng cho chi tiết sản phẩm */
            padding: 20px; /* Padding cho khoảng cách bên trong */
            border-radius: 10px; /* Bo góc cho khung chi tiết */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Đổ bóng nhẹ */
        }
    </style>
</head>
<body>
<div class="container my-4">
    <div class="row">
        <div class="col-md-6">
            <img class="product-image" alt="${product.ten}" src="/image/${product.anh}">
        </div>
        <div class="col-md-6 mt-5 product-details">
            <h2 class="text-primary">${product.ten}</h2>
            <table class="table table-borderless">
                <tbody>
                <tr>
                    <td><strong>Sản phẩm:</strong></td>
                    <td>${product.ten}</td>
                </tr>
                <tr>
                    <td><strong>Giá bán:</strong></td>
                    <td class="text-danger">${product.giaBan} ₫</td> <!-- Đặt giá màu đỏ -->
                </tr>
                </tbody>
            </table>
            <div class="d-flex justify-content-between mt-4">
                <a class="btn btn-secondary" href="javascript:history.back()">Quay lại</a>
                <a class="btn btn-primary" href="/add-gio-hang/${product.id}">Thêm vào giỏ hàng</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
