<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách Nhân Viên</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <style>

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


        /*    */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            color: #333;
        }

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
            padding: 10px 20px; /* Giảm padding để nút vừa với chữ */
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 20px;
            display: flex;
            align-items: center;
            white-space: nowrap; /* Đảm bảo nội dung không bị xuống dòng */
            width: 153px;
        }

        /* Style for the container holding the buttons */
        .button-container {
            display: flex; /* Use flexbox layout */
            margin-bottom: 20px; /* Space below the button container */
        }

        /* Style for the back button */
        .btn-ql {

            border: none; /* Remove default border */
            border-radius: 5px; /* Rounded corners */
            padding: 10px 15px; /* Vertical and horizontal padding */
            font-size: 16px; /* Font size */
            margin-left: 10px; /* Space between buttons */
            transition: background-color 0.3s ease; /* Smooth background transition */
        }

        .btn-ql:hover {
            background-color: #FFFFFF; /* Darker shade on hover */
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
        /**/
        /* Pagination styles */
        .pagination {
            display: flex; /* Use flexbox layout for pagination */
            justify-content: center; /* Center pagination items */
            list-style: none; /* Remove default list styles */
            padding: 0; /* Remove default padding */
            margin: 20px 0; /* Space above and below pagination */
        }

        /* Individual page item styles */
        .page-item {
            margin: 0 5px; /* Space between pagination items */
        }

        /* Common styles for page links */
        .page-link {
            display: inline-block; /* Make link block-level */
            padding: 10px 15px; /* Padding for clickable area */
            border: 1px solid #007bff; /* Border color */
            border-radius: 5px; /* Rounded corners */
            color: #007bff; /* Text color */
            text-decoration: none; /* Remove underline */
            transition: background-color 0.3s, color 0.3s; /* Smooth transitions */
        }

        /* Hover state for page links */
        .page-link:hover {
            background-color: #007bff; /* Change background on hover */
            color: white; /* Change text color on hover */
        }

        /* Active state for the current page */
        .page-item.active .page-link {
            background-color: #007bff; /* Active page background */
            color: white; /* Active page text color */
            border: 1px solid #007bff; /* Active page border */
        }

        /* Disabled state for pagination items */
        .page-item.disabled .page-link {
            background-color: #f8f9fa; /* Light background for disabled */
            color: #6c757d; /* Gray text color */
            pointer-events: none; /* Disable pointer events */
            border: 1px solid #ced4da; /* Light border for disabled */
        }
        /*    */


        .d-flex {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .btn {
            padding: 8px 12px;
            border-radius: 5px;
            font-size: 14px;
            transition: background-color 0.3s, transform 0.2s;
            text-decoration: none;
        / margin-right: 5 px;
        }

        .d-flex a:last-child {
            margin-right: 0;
        }

        .btn-info {
            background-color: #17a2b8;
            border: none;
            color: white;
        }

        .btn-info:hover {
            background-color: #138496;
            transform: scale(1.05);
        }


        .btn-warning {
            background-color: #ffc107;
            border: none;
            color: black;
        }

        .btn-warning:hover {
            background-color: #e0a800;
            transform: scale(1.05);
        }

        .btn-danger {
            background-color: #dc3545;
            border: none;
            color: white;
        }

        .btn-danger:hover {
            background-color: #c82333;
            transform: scale(1.05);
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
                <li><a href="#"><i class="bi bi-dot"></i> Quản lí nhân viên</a></li>
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
    <h2 class="title">Danh Sách Nhân Viên</h2>

    <div class="search">
        <form action="${pageContext.request.contextPath}/nhan-vien/hien-thi" method="get"
              style="display: flex; width: 100%;"><input type="text" name="keyword" value="${keyword}"
                                                         placeholder="Tìm kiếm theo tên nhân viên..."
                                                         aria-label="Tìm kiếm theo tên nhân viên"
                                                         class="form-control nowrap">
            <button type="submit" class="btn btn-primary"><i class="bi bi-search"></i> Tìm kiếm</button>
        </form>
    </div>
    <div class="button-container">
        <a class="btn btn-primary btnadd" href="/nhan-vien/them">
            <i class="bi bi-plus-square-fill icon"></i> Thêm nhân viên
        </a>
        <a class="btn btn-primary btn-ql" href="${pageContext.request.contextPath}/nhan-vien/hien-thi">
        </a>
    </div>


    <table class="table">
        <thead>
        <tr>
            <th>STT</th>
            <th>Tên Nhân Viên</th>
            <th>Giới Tính</th>
            <th>Chức Vụ</th>
            <th>Tài Khoản</th>
            <th>Trạng Thái</th>
            <th>Số Điện Thoại</th>
            <th>Địa Chỉ</th>
            <th>Email</th>
            <th>Thao Tác</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${empty list}">
            <tr>
                <td class="text-center" colspan="10">Không có nhân viên nào.</td>
            </tr>
        </c:if>
        <c:forEach items="${list}" var="nv" varStatus="status">
            <tr>
                <td>${status.index + 1 + currentPage * 5}</td>
                <td>${nv.ten_nhan_vien}</td>
                <td>${nv.gioi_tinh == 1 ? 'Nam' : 'Nữ'}</td>
                <td>${nv.chucVu.ten_chuc_vu}</td>
                <td>${nv.tai_khoan}</td>
                <td>${nv.trang_thai == 1 ? 'Đi làm' : 'Nghỉ'}</td>
                <td>${nv.so_dien_thoai}</td>
                <td>${nv.dia_chi}</td>
                <td>${nv.email}</td>
                <td>
                    <div class="d-flex justify-content-between  ">
                        <a href="${pageContext.request.contextPath}/nhan-vien/detail/${nv.id}"
                           class="btn btn-info btn-sm"><i class="bi bi-clipboard"></i></a>
                        <a href="${pageContext.request.contextPath}/nhan-vien/update/${nv.id}"
                           class="btn btn-warning btn-sm"> <i class="bi bi-gear"></i></a>
                        <a href="${pageContext.request.contextPath}/nhan-vien/xoa/${nv.id}"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Bạn có chắc chắn muốn xóa nhân viên này không?');"><i class="bi bi-trash-fill"></i></a>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


    <!-- Pagination with Previous, Page Numbers, and Next -->
    <nav>
        <div class="d-flex justify-content-center">
            <ul class="pagination">
                <!-- Previous Button -->
                <li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
                    <a class="page-link"
                       href="${pageContext.request.contextPath}/nhan-vien/hien-thi?keyword=${keyword}&page=${currentPage - 1}"
                       tabindex="-1">Previous</a>
                </li>

                <!-- Page Numbers -->
                <c:forEach begin="0" end="${totalPages - 1}" var="i">
                    <li class="page-item ${currentPage == i ? 'active' : ''}">
                        <a class="page-link"
                           href="${pageContext.request.contextPath}/nhan-vien/hien-thi?keyword=${keyword}&page=${i}">${i + 1}</a>
                    </li>
                </c:forEach>

                <!-- Next Button -->
                <li class="page-item ${currentPage == totalPages - 1 ? 'disabled' : ''}">
                    <a class="page-link"
                       href="${pageContext.request.contextPath}/nhan-vien/hien-thi?keyword=${keyword}&page=${currentPage + 1}">Next</a>
                </li>
            </ul>
        </div>
    </nav>
</main>

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


</script>
</body>
</html>
