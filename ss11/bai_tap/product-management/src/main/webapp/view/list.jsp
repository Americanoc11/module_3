<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/14/2023
  Time: 12:37 PM
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
<div class="row">
    <div class="col-12">
        <h2 style="text-align: center">
            Product Management
        </h2>
    </div>
</div>
<div class="row">
    <div class="col-4">
        <button type="submit" class="btn btn-primary m-3"
                onclick="window.location.href='/product?action=create'">
            Create new product
        </button>
        <button type="submit" class="btn btn-primary m-3"
                onclick="window.location.href='/product?action'">
            Show Product List
        </button>
    </div>
    <div class="col-4"></div>
    <div class="col-4">
        <form action="/product">
            <table>
                <tr>
                    <td>
                        <input type="hidden" name="action" value="search">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" name="name">
                    </td>
                    <td>
                        <button type="submit" class="btn btn-primary">
                            search
                        </button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<div class="row">
    <div class="col-2 m-3"></div>
    <div class="col-6 m-3">
        <div class="container">
            <h4 style="text-align: center">Product List</h4>
            <table class="table">
                <tr>
                    <th>No</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Describe</th>
                    <th>Goods</th>
                </tr>
                <c:forEach var="element" items="${productList}">
                    <tr>
                        <td>${element.getId()}</td>
                        <td>${element.getName()}</td>
                        <td>${element.getPrice()}</td>
                        <td>${element.getDescribe()}</td>
                        <td>${element.getGoods()}</td>
                        <td>
                            <button type="submit" class="btn btn-primary"
                                    onclick="window.location.href='/product?action=delete&id=${element.getId()}'">
                                Delete
                            </button>
                        </td>
                        <td>
                            <button type="submit" class="btn btn-primary"
                                    onclick="window.location.href='/product?action=update&id=${element.getId()}'">
                                Update
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <div class="col-4"></div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
