<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/3/2023
  Time: 2:29 PM
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
    <title>Product-Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="row ">
    <div class="col-12 btn btn-success">
        <h3 style="text-align: center">Product Management</h3>
    </div>
</div>
<div class="row">
    <div class="col-4"></div>
    <div class="col-4">
        <form method="post">
            <h3 style="text-align: center">Edit Information</h3>
            <table class="table">
                <tr>
                    <td>Nhà Cung Cấp</td>
                    <td>
                        <input type="text" name="name" value="${element.getName()}" placeholder="Nhập tên nhà cung cấp">
                    </td>
                </tr>
                <tr>
                    <td>Số Điện Thoại</td>
                    <td>
                        <input type="text" name="phone" value="${element.getPhone()}" placeholder="Nhập số điện thoại">
                    </td>
                </tr>
                <tr>
                    <td>Địa chỉ</td>
                    <td>
                        <input type="text" name="address" value="${element.getAddress()}" placeholder="Nhập địa chỉ nhà">
                    </td>
                </tr>
            </table>
            <input type="submit" class="btn btn-secondary">
        </form>
        <button type="submit" class="btn btn-secondary"
                onclick="window.location.href='/suppliers?actionUser'">
            Trở về
        </button>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
