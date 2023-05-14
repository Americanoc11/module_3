<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/5/2023
  Time: 12:10 PM
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
<div class="row">
    <div class="col-12 btn btn-success">
        <h3>
            Quản lí sản phẩm
        </h3>
    </div>
</div>
<div class="row">
    <div class="col-4"></div>
    <div class="col-4 m-3">
        <form method="post">
            <h4 style="text-align: center">
                Chỉnh sửa thông tin
            </h4>
            <table class="table">
                <tr>
                    <td>STT</td>
                    <td style="text-align: center"> ${deli.getId()}</td>
                </tr>
                <tr>
                    <td>Mô tả</td>
                    <td>
                        <input type="text" name="describe" value="${deli.getDescribe()}">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit">
                    </td>
                </tr>
            </table>
        </form>
        <button type="submit" class="btn btn-secondary"
                onclick="window.location.href='/delivery?actionUser'">
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