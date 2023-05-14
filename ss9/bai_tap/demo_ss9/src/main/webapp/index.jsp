<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/ProductDiscountCalculator" method="post">
    <h3>
       App Product Discount Calculator
    </h3><br>
    <span>Product Description</span><br>
    <input type="text" name="description"><br>
    <span>List Price</span><br>
    <input type="number" name="price"><br>
    <span>Discount Percent</span> <br>
    <input type="number" name="discount"><br>
    <input type="submit" >
</form>
<h1 >
    Discount Amount: ${discountAmount}
</h1>
<h1>
    Discount price: ${total}
</h1>
</body>
</html>