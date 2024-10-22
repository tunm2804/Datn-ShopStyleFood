<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách Khách Hàng</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            color: #333;
        }

        /* Sidebar */
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            width: 240px;
            height: 100%;
            background-color: #2c3e50;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .logo {
            font-size: 28px;
            color: white;
            margin-bottom: 40px;
            display: flex;
            align-items: center;
        }

        .logo i {
            font-size: 40px;
            margin-right: 10px;
        }

        .logo span {
            font-weight: bold;
            color: #ff6600;
            font-size: 22px;
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            flex-grow: 1;
        }

        .sidebar ul li {
            padding: 15px 10px;
            cursor: pointer;
            border-bottom: 1px solid #ff6600;
        }

        .sidebar ul li a {
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: start;
            font-size: 16px;
        }

        .sidebar ul li a i {
            margin-right: 15px;
            font-size: 18px;
        }

        .sidebar ul li:hover {
            background-color: #34495e;
        }

        .logout a {
            color: white;
            background-color: #e74c3c;
            padding: 10px 20px;
            border-radius: 5px;
            text-align: center;
        }

        .logout a:hover {
            background-color: #c0392b;
        }
        .sidebar ul li ul {
            display: none;
            list-style-type: none;
            padding-left: 20px;
            margin: 0;
        }

        .sidebar ul li ul li {
            padding: 10px 0;
        }

        .sidebar ul li ul li a {
            font-size: 14px;
            color: #cccccc;
        }
        .logout a {
            color: white;
            background-color: #e74c3c;
            padding: 10px 20px;
            border-radius: 5px;
            text-align: center;
        }

        .logout a:hover {
            background-color: #c0392b;
        }
        /* Main content */
        .container {
            margin-left: 280px;
            padding: 20px;
        }

        .title {
            font-size: 28px;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 20px;
            text-transform: uppercase;
        }

        .search {
            display: flex;
            justify-content: flex-start; /* Căn trái cho hàng tìm kiếm */
            align-items: center; /* Căn giữa theo chiều dọc */
            margin-bottom: 20px;
        }

        .search input[type="text"] {
            width: 500px; /* Tùy chỉnh kích thước ô nhập */
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            margin-right: 10px;
        }

        .search button {
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            display: flex;
            align-items: center;
            margin-right: 20px;
        }

        .search button:hover {
            background-color: #2980b9;
        }

        .btnadd {
            background-color: #28a745;
            padding: 10px 15px; /* Giảm padding để nút vừa với chữ */
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            display: flex;
            align-items: center;
            margin-left: auto; /* Đẩy nút sang bên phải */
            white-space: nowrap; /* Đảm bảo nội dung không bị xuống dòng */
            width: 153px;
        }



        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .table th,
        .table td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }

        .table th {
            background-color: #f8f9fa;
            text-transform: uppercase;
            font-weight: 600;
            color: #2c3e50;
        }

        .table tr:hover {
            background-color: #e9ecef;
        }

        .btn-warning,
        .btn-danger {
            padding: 5px 10px;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 14px;
        }

        .btn-warning {
            background-color: #ffc107;
        }

        .btn-warning:hover {
            background-color: #e0a800;
        }

        .btn-danger {
            background-color: #dc3545;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        .pagination {
            display: flex;
            justify-content: space-between; /* Căn giữa các phần */
            align-items: center; /* Căn giữa theo chiều dọc */
            margin: 50px 0;
        }

        .pagination-item {
            flex: 1; /* Để mỗi phần chiếm đều không gian */
            text-align: center;
        }

        .current-page {
            font-weight: bold;
            color: white;
            background-color: blue;
            border-radius: 5px;
            padding: 10px;
            border: 2px solid darkblue; /* Viền cho trang hiện tại */
        }

        .other-page {
            color: black;
            text-decoration: none; /* Không gạch chân */
            border: 2px solid transparent;
            border-radius: 5px; /* Bo góc cho các trang khác */
            padding: 10px;
            margin: 0 5px;
        }

        .other-page:hover {
            border: 2px solid #AEEEEE;
        }

        .btn {
            padding: 10px 15px; /* Khoảng cách bên trong cho nút */
            border-radius: 5px; /* Bo góc cho nút */
            margin: 0 5px; /* Khoảng cách giữa các nút */
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
        }

        .btn-primary.disabled {
            background-color: lightgray;
            color: darkgray;
        }

        .icon {
            margin-right: 10px;
        }
        /* Submenu toggle */
        .fa-chevron-right {
            margin-left: auto;
        }

        .fa-chevron-down {
            margin-left: auto;
        }
        .alert {
            padding: 15px;
            margin-top: 10px;
            margin-bottom: 10px;
            border: 1px solid transparent;
            border-radius: 4px;
            position: relative;
        }

        .alert-success {
            color: #155724;
            background-color: #d4edda;
            border-color: #c3e6cb;
        }

        .alert-dismissible {
            padding-right: 35px;
        }

        .alert .close {
            position: absolute;
            top: 0;
            right: 10px;
            color: inherit;
            font-weight: bold;
            border: none;
            background: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
<aside class="sidebar">
    <div class="logo">
        <span>F</span><span style="color: white;">ootStyle</span>
    </div>
    <ul>
        <li><a href="#"><i class="bi bi-clock"></i> Thống kê</a></li>
        <li><a href="#"><i class="bi bi-cash"></i> Bán hàng tại quầy</a></li>
        <li><a href="#"><i class="bi bi-receipt"></i> Quản lý đơn hàng</a></li>
        <li>
            <a href="javascript:void(0)" onclick="toggleMenu(this)">
                <i class="bi bi-box"></i> Quản lý sản phẩm <i class="fa fa-chevron-right"></i>
            </a>
            <ul>
                <li><a href="#"><i class="bi bi-dot"></i> Sản phẩm</a></li>
                <li><a href="#"><i class="bi bi-dot"></i> Size</a></li>
                <li><a href="#"><i class="bi bi-dot"></i> Chất liệu</a></li>
                <li><a href="#"><i class="bi bi-dot"></i> Thương hiệu</a></li>
            </ul>
        </li>
        <li><a href="#"><i class="bi bi-tags"></i> Khuyến mãi</a></li>
        <li>
            <a href="javascript:void(0)" onclick="toggleMenu(this)">
                <i class="bi bi-person"></i> Quản lý tài khoản <i class="fa fa-chevron-right"></i>
            </a>
            <ul>
                <li><a href="/nhan-vien/hien-thi"><i class="bi bi-dot"></i> Quản lí nhân viên</a></li>
                <li><a href="/khachhang/list"><i class="bi bi-dot"></i> Quản lí khách hàng</a></li>
            </ul>
        </li>
        <!-- Logout button -->
        <li class="logout">
            <a href="/logout"><i class="bi bi-box-arrow-right"></i> Đăng xuất</a>
        </li>
    </ul>
</aside>

<main class="container">
        <h2 class="title">Danh sách Khách Hàng</h2>

        <div class="search">
            <form action="${pageContext.request.contextPath}/khachhang/list" method="get" style="display: flex; width: 100%;">
                <input type="text" name="searchTerm" placeholder="Nhập tên khách hàng" value="${searchTerm}" />
                <button type="submit" class="btn btn-primary"><i class="bi bi-search"></i> Tìm kiếm</button>
            </form>

        </div>
        <a class="btn btn-primary btnadd" href="/khachhang/add">
            <i class="bi bi-plus-square-fill icon"></i> Thêm khách hàng
        </a>
        <table class="table">
            <thead>
            <tr>
                <th>STT</th>
                <th>Họ Tên</th>
                <th>Email</th>
                <th>Trạng Thái</th>
                <th>Tài Khoản</th>
                <th>SDT</th>
                <th>Địa Chỉ</th>
                <th>Thao tác</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="khachHang" items="${khachHangs}" varStatus="i">
                <tr>
                    <td>${currentPage * pageSize + i.index + 1}</td>
                    <td>${khachHang.hoTen}</td>
                    <td>${khachHang.email}</td>
                    <td>${khachHang.trangThai == 1 ? 'Hoạt động' : 'Không hoạt động'}</td>
                    <td>${khachHang.taiKhoan}</td>
                    <td>${khachHang.sdt}</td>
                    <td>${khachHang.diaChi}</td>
                    <td>
                        <a class="btn btn-danger" href="/khachhang/delete/${khachHang.id}"
                           onclick="return confirm('Bạn có chắc chắn muốn xóa khách hàng này?');">
                            <i class="bi bi-trash-fill"></i>
                        </a>
                        <a class="btn btn-warning" href="/khachhang/update/${khachHang.id}"><i
                                class="bi bi-gear"></i></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <c:if test="${not empty message}">
            <div class="alert alert-success alert-dismissible" id="successAlert">
                    ${message}
                <button type="button" class="close" onclick="this.parentElement.style.display='none';">
                    &times;
                </button>
            </div>
        </c:if>

        <div class="pagination">
            <div class="pagination-item previous-button">
                <c:if test="${currentPage > 0}">
                    <a href="${pageContext.request.contextPath}/khachhang/list?page=${currentPage - 1}"
                       class="btn btn-primary">Previous</a>
                </c:if>
                <c:if test="${currentPage == 0}">
                    <span class="btn btn-primary disabled">Previous</span>
                </c:if>
            </div>

            <div class="pagination-item page-numbers">
                <c:forEach begin="0" end="${totalPages - 1}" var="i">
                    <c:choose>
                        <c:when test="${i == currentPage}">
                            <span class="current-page">${i + 1}</span> <!-- Trang hiện tại -->
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/khachhang/list?page=${i}"
                               class="other-page">${i + 1}</a> <!-- Các trang khác -->
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>

            <div class="pagination-item next-button">
                <c:if test="${currentPage < totalPages - 1}">
                    <a href="${pageContext.request.contextPath}/khachhang/list?page=${currentPage + 1}"
                       class="btn btn-primary">Next</a>
                </c:if>
                <c:if test="${currentPage >= totalPages - 1}">
                    <span class="btn btn-primary disabled">Next</span>
                </c:if>
            </div>
        </div>
    </main>

</div>

<script>
    function toggleMenu(element) {
        const parentLi = element.parentElement;
        const subMenu = parentLi.querySelector('ul');
        const icon = element.querySelector('.fa');

        if (subMenu.style.display === 'block') {
            subMenu.style.display = 'none'; // Đóng menu
            icon.classList.remove('fa-chevron-down');
            icon.classList.add('fa-chevron-right'); // Đổi mũi tên sang phải
        } else {
            subMenu.style.display = 'block'; // Mở menu
            icon.classList.remove('fa-chevron-right');
            icon.classList.add('fa-chevron-down'); // Đổi mũi tên sang xuống
        }
    }

    // Tìm phần tử thông báo
    const successAlert = document.getElementById('successAlert');

    // Nếu phần tử thông báo tồn tại, tự động ẩn sau 2 giây
    if (successAlert) {
        setTimeout(() => {
            successAlert.style.display = 'none';
        }, 2000);
    }
</script>

</body>
</html>
