<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/ProductDiscountCalculatorServlet" >
    <div style="text-align: center">
        <p>
            Product DiscountCalculator
        </p>
        <br>
        <select name="">
            <option value="Coca">Coca</option>
            <option value="Pepsi">Pepsi</option>
            <option value="7Up">7Up</option>
        </select>
        <input type="text" name="description" placeholder="Enter product Description">
        <br>
        <input type="number" name="price" placeholder="Enter product list price">
        <br>
        <input type="number" name="discountPrice" placeholder="Enter discount price">
        <br>
        <input type="submit" id="submit" name="total">
    </div>
</form>
<p>DiscountAmount: ${discount}</p>
<p>Total: ${total}</p>
</body>
</html>