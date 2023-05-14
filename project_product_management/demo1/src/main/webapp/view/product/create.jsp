<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/3/2023
  Time: 2:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div class="row ">
    <div class="col-12 btn btn-success">
        <h3 style="text-align: center">Quản lý sản phẩm</h3>
    </div>
</div>
<div class="row">
    <div class="col-4"></div>
    <div class="col-4">
        <form method="post">
            <h3 style="text-align: center">Thêm sản phẩm</h3>
            <table class="table">
                <tr>
                    <td>
                        <input type="hidden" name="id" value="1">
                    </td>
                </tr>
                <tr>
                    <td>Tên sản phẩm</td>
                    <td>
                        <input type="text" name="name">
                    </td>
                </tr>
                <tr>
                    <td>Mô tả</td>
                    <td>
                        <input type="text" name="describe">
                    </td>
                </tr>
                <tr>
                    <td>Đơn giá</td>
                    <td>
                        <input type="number" name="price">
                    </td>
                </tr>
                <tr>
                    <td>Ảnh</td>
                    <td>
                        <input type="text" name="image">
                    </td>
                </tr>
                <tr>
                    <td>Phân loại</td>
                    <td>
                        <select name="typeId" id="">
                            <option value="1">Hand Tool</option>
                            <option value="2">Power Tool</option>
                            <option value="3">Laptop</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Ghi chú</td>
                    <td>
                        <input type="text" name="note">
                    </td>
                </tr>
                <tr>
                    <td>Số lượng</td>
                    <td>
                        <input type="text" name="amount">
                    </td>
                </tr>
                <tr>
                    <td>Nhà cung cấp</td>
                    <td>
                        <select name="supplierId">
                            <option value="1">Acer</option>
                            <option value="2">Apple</option>
                            <option value="3">Asus</option>
                            <option value="4">Dell</option>
                            <option value="5">Lenovo</option>
                        </select>
                    </td>
                </tr>
            </table>
            <input type="submit" class="btn btn-secondary">
        </form>
        <button type="submit" class="btn btn-secondary"
                onclick="window.location.href='/product?actionUser'">
            Trở về
        </button>
    </div>
    <div class="col-4"></div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
