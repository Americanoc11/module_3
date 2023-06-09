<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <h3 style="text-align: center">Danh sách khách hàng</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <table class="table">
                <tr>
                    <th>STT</th>
                    <th>Tên</th>
                    <th>Ngày Sinh</th>
                    <th>Địa chỉ</th>
                    <th>Ảnh</th>
                </tr>
                <c:forEach var="element" items="${customerList}" varStatus="loop">
                    <tr>
                        <td>
                            <c:out value="${loop.count}"></c:out>
                        </td>
                        <td>
                            <c:out value="${element.getName()}"></c:out>
                        </td>
                        <td>
                            <c:out value="${element.getDateOfBirth()}"></c:out>
                        </td>
                        <td>
                            <c:out value="${element.getAddress()}"></c:out>
                        </td>
                        <td>
                            <img src="${element.getImage()}" alt="">
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>