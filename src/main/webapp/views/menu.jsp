<%@page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en"
      xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/side-bar.css"/>
    <title>Quản Lý CV</title>
</head>
<body>
<div class="wrapper">
    <aside id="sidebar">
        <div class="d-flex">
            <button id="toggle-btn" type="button">
                <i class="lni lni-grid-alt"></i>
            </button>
            <div class="sidebar-logo">
                <a href="#">Quản Lý Sản phẩm</a>
            </div>
        </div>
        <ul class="sidebar-nav">
            <li class="sidebar-item">
                <a href="/index" class="sidebar-link">
                    <i class="lni lni-notion"></i>
                    <span>QL Sản phẩm</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="#" class="sidebar-link">
                    <i class="lni lni-notion"></i>
                    <span>QL Tài khoản</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="#" class="sidebar-link">
                    <i class="lni lni-user"></i>
                    <span>QL Hóa đơn</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="#" class="sidebar-link">
                    <i class="lni lni-write"></i>
                    <span>QL Khuyến Mại</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="#" class="sidebar-link">
                    <i class="lni lni-printer"></i>
                    <span>QL Thống kê</span>
                </a>
            </li>
        </ul>

        <div class="sidebar-footer" style="margin-right: 15px">
            <form action="${pageContext.request.contextPath}/logout" method="post">
                <button type="submit" class="btn btn-warning">Đăng xuất</button>
            </form>
        </div>
    </aside>
    <div class="main">
        <nav class="navbar navbar-expand px-4 py-3">
            <div class="navbar-collapse collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item dropdown">
                        <a href="#" class="nav-icon pe-md-0" data-bs-toggle="dropdown">
                            <img src="${pageContext.request.contextPath}/icon/account.jpg" alt="" class="avatar img-fluid">
                        </a>
                        <div class="dropdown-menu dropdown-menu-end rounded">
                            <a href="#" class="dropdown-item">
                                <i class="lni lni-timer"></i>
                                <span>Analytics</span>
                            </a>
                            <a href="#" class="dropdown-item">
                                <i class="lni lni-cog"></i>
                                <span>Setting</span>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a href="#" class="dropdown-item">
                                <i class="lni lni-question-circle"></i>
                                <span>Help</span>
                            </a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <main layout:fragment="main1" class="content px-3 py-4">
            <!-- Nội dung chính ở đây -->
        </main>

        <footer class="footer">
            <!-- Footer content -->
        </footer>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/script.js"></script>
<script src="${pageContext.request.contextPath}/js/phongBanScript.js"></script>
</body>
</html>
