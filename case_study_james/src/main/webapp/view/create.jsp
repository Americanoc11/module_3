<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/28/2023
  Time: 2:57 PM
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
<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="m-3">
                <form method="post">
                    <h3 style="text-align: center">Thêm ghi chú</h3>
                    <table class="table">
                        <tr>
                            <td>Tiêu đề</td>
                            <td>
                                <input type="text" name="title">
                            </td>
                        </tr>
                        <tr>
                            <td>Nội dung</td>
                            <td>
                                <textarea name="content" id="" cols="50%" rows="10"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <select name="typeId">
                                    <option value="1">Quạt</option>
                                    <option value="2">Ti vi</option>
                                    <option value="3">Tủ lạnh</option>
                                    <option value="4">Bếp ga</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <input type="submit" value="Lưu">
                    <input type="hidden" name="id" value="1">
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>