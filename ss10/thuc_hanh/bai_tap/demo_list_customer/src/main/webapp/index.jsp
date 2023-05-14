<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<table>
    <tr>
        <td>Tên</td>
        <td>Ngày Sinh</td>
        <td>Địa chỉ</td>
        <td>Ảnh</td>
    </tr>
    <c:forEach var="element" items="${result}">
        <tr>
            <td>${element.name}</td>
            <td>${element.dateOfBirth}</td>
            <td>${element.address}</td>
            <td><img width="100px" height="100px" src="${element.image}" alt=""></td>
        </tr>
    </c:forEach>
</table>
<button><a href="CustomerListServlet"> hiển thị</a></button>
</body>
</html>