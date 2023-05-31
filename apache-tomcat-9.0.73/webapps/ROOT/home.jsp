<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/30/2023
  Time: 11:19 PM
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
<%--List product--%>
<div class="container-fluid">
    <div class="row">
        <div class="col-3">
            <%--            form login-logout--%>
            <div class="row">
                <div class="col-12">
                    <button type="submits"
                    onclick="window.location.href='/form/form-login.jsp'">
                        Login
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <button>
                        Logout
                    </button>
                </div>
            </div>
        </div>
        <div class="col-6">
            <div class="row">
                <div class="col-12">
                    <h3>
                        Danh sách sản phẩm
                    </h3>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <table class="table">
                        <tr>
                            <th>STT</th>
                            <th>Tên SP</th>
                            <th>Mô tả</th>
                            <th>Giá</th>
                            <th>Ảnh</th>
                            <th>Loại</th>
                        </tr>
                        <c:forEach var="element" items="${productList}" varStatus="loop">
                            <tr>
                                <td>
                                    <c:out value="${loop.count}"></c:out>
                                </td>
                                <td>
                                    <c:out value="${element.getName()}"></c:out>
                                </td>
                                <td>
                                    <c:out value="${element.getDescribe()}"></c:out>
                                </td>
                                <td>
                                    <c:out value="${element.getPrice}"></c:out>
                                </td>
                                <td>
                                    <c:out value="${element.getImage()}"></c:out>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>

        </div>
        <div class="col-3"></div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>