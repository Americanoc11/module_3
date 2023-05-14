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
        <h3 style="text-align: center">Quản lý sản phẩm</h3>
    </div>
</div>
<div class="row">
    <div class="col-4"></div>
    <div class="col-4">
        <form method="post">
            <h3 style="text-align: center">Chỉnh sửa thông tin thể loại</h3>
            <input type="hidden" value="${element.getId()}">
            <table class="table">
                <tr>
                    <td>Thể loại</td>
                    <td>
                        <input type="text" name="name" value="${element.getNameType()}" placeholder="Nhập tên thể loại">
                    </td>
                </tr>
            </table>
            <input type="submit" class="btn btn-secondary">
        </form>
        <button type="submit" class="btn btn-secondary m-3"
                onclick="window.location.href='/type?actionUser'">
            Trở về
        </button>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
