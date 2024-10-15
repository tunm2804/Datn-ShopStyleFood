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
        html, body {
            height: 100%;
            margin: 0;
            background-color: #F5F5F5;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            height: 100%;
            margin-left: 220px; /* Để không bị che khuất bởi sidebar */
            padding: 20px;
            width: calc(100% - 220px); /* Đảm bảo nội dung không bị che khuất */
        }

        .sidebar {
            position: fixed; /* Cố định thanh bên */
            top: 0;
            left: 0;
            width: 200px;
            height: 100%;
            background-color: #444444;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            color: white;
        }

        .logo {
            font-family: 'Arial', sans-serif;
            font-size: 36px; /* Kích thước chữ cho logo */
            color: #ffffff; /* Màu chữ cho logo */
            text-align: center; /* Căn giữa chữ */
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); /* Đổ bóng cho chữ */
            margin-bottom: 20px; /* Khoảng cách dưới logo */
            padding: 10px; /* Khoảng cách trong logo */
            border: 3px solid #ff4b2b; /* Viền cho logo */
            border-radius: 10px; /* Bo góc cho viền */
            background: linear-gradient(135deg, #ff416c, #337ab7);
            display: inline-block; /* Để có thể căn giữa theo chiều ngang */
        }

        .sidebar h2 {
            text-align: center;
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }

        .sidebar ul li {
            padding: 10px;
            cursor: pointer;
            position: relative;
        }

        .sidebar ul li a {
            color: white;
            text-decoration: none;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .sidebar ul li.active {
            background-color: white;
            color: black;
            border: 1px solid #800080;
            border-radius: 5px;
        }

        .sidebar ul li ul {
            display: none; /* Ẩn danh sách con ban đầu */
            list-style-type: none;
            padding-left: 10px;
            margin-top: 5px;
        }

        .sidebar ul li ul li {
            padding: 5px;

        }

        .main-content {
            flex: 1;
            padding: 20px;
        }

        h2 {
            margin-bottom: 20px;
        }

        .btn {
            padding: 10px 20px;
            color: white;
            text-decoration: none;
            border-radius: 10px;
            margin-right: 5px;
        }

        .btn-primary {
            background-color: #007bff;
        }

        .btn-danger {
            background-color: #dc3545;
        }

        .btn-warning {
            background-color: #ffc107;
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
            background-color: #f4f4f4;
        }

        .table tr:hover {
            background-color: #e0f7fa; /* Màu nền khi hover */
        }

        .fa-chevron-down,
        .fa-chevron-right {
            transition: transform 0.3s ease;
            color: white;
            margin-right: 20px;
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

        /*Tìm kiếm*/
        .search {
            margin-bottom: 20px; /* Thêm khoảng cách dưới cho khung tìm kiếm */
            display: flex; /* Dùng flexbox để căn hàng cho ô input và nút tìm kiếm */
            align-items: center; /* Căn giữa theo chiều dọc */
        }


        .search input[type="text"] {
            width: 800px; /* Độ rộng của ô input */
            padding: 8px 12px; /* Khoảng cách bên trong của ô input */
            border: 1px solid #ccc; /* Đường viền màu xám nhạt */
            border-radius: 5px; /* Bo tròn các góc */
            font-size: 16px; /* Kích thước font chữ */
            outline: none; /* Bỏ viền outline mặc định */
            margin-right: 10px; /* Khoảng cách giữa ô input và nút */
        }


        .search button {
            padding: 8px 15px; /* Khoảng cách bên trong của nút */
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }


        .search button:hover {
            background-color: #0056b3;
        }

        .btnadd {
            margin-left: 1050px;
        }

        .title {
            font-size: 35px;
        }

    </style>
</head>
<body>

<div class="container">
    <aside class="sidebar">
        <h2 class="logo">Footstyle</h2>
        <ul>
            <li class="menu-item">
                <a href="javascript:void(0)" onclick="toggleMenu(this)">
                    Quản lí tài khoản <i class="fa fa-chevron-right"></i>
                </a>
                <ul>
                    <li><a href="#"><i class="bi bi-dot">Quản lý nhân viên</i></a></li>
                    <li><a href="/khachhang/list"><i class="bi bi-dot">Quản lý khách hàng</i></a></li>
                </ul>
            </li>
            <li>
                <a href="/index">Quản lí sản phẩm</a>
            </li>
        </ul>
    </aside>
    <main class="main-content">
        <h2 class="title">Danh sách Khách Hàng</h2>

        <div class="search">
            <form action="${pageContext.request.contextPath}/khachhang/list" method="get">
                <input type="text" name="searchTerm" placeholder="Nhập tên khách hàng" value="${searchTerm}"/>
                <button type="submit" class="btn btn-primary"><i class="bi bi-search"></i> Tìm kiếm</button>
            </form>
        </div>
        <a class="btn btn-primary btnadd" href="/khachhang/add"><i class="bi bi-plus-square-fill icon"></i>Thêm khách
            hàng</a>
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
