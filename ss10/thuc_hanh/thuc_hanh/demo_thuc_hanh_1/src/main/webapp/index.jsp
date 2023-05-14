<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/AppCurrency" method="post">
    <h3>Currency Converter</h3><br>
    <span>Rate: </span><br>
    <input type="number" name="rate" value="20000"><br>
    <span>USD: </span> <br>
    <input type="number" name="usd"><br>
    <input type="submit" value="Converter">
</form>
<h3>Result: ${Result} </h3>
</body>
</html>