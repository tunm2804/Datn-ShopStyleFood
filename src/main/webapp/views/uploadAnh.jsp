<%@page language="java" pageEncoding="UTF-8" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<form action="/upload" method="post" enctype="multipart/form-data">
    <div>
        <label for="ten">Tên sản phẩm:</label>
        <input type="text" id="ten" name="ten" required>
    </div>
    <div>
        <label for="anh">Tải ảnh sản phẩm:</label>
        <input type="file" id="anh" name="anh" accept="image/*" required>
    </div>
    <button type="submit">Tải lên</button>
</form>

</body>
</html>