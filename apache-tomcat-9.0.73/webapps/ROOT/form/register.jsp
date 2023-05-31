<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/30/2023
  Time: 11:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<h3>Form register</h3>
<form method="post">
    <input type="text" name="userName" placeholder="Nhập tên đăng nhập...">
    <input type="text" name="password" placeholder=" Nhập mật khẩu...">
    <input type="text" name="name" placeholder="Nhập họ và tên..."><br>
    <input type="text" name="email" placeholder="Nhập email..."><br>
    <input type="text" name="phone" placeholder="Nhập số điện thoại..."><br>
    <input type="text" name="address" placeholder="Nhập địa chỉ..."><br>
    <input type="submit" value="tạo tài khoản">
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>