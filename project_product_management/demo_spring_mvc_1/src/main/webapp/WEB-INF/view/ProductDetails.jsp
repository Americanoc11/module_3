<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/7/2023
  Time: 5:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Save Product</title>
<%--  <style type="text/css">@import url(css/main.css);</style>--%>
</head>
<body>
<div id="global">
  <h4>The product has been saved.</h4>
  <p>
  <h5>Details:</h5>
  Product Name: ${product.name}<br/>
  Description: ${product.description}<br/>
  Price: $${product.price}
  </p>
</div>
</body>
</html>
