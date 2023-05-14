<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/AppDictionary">
    <h3>Vietnamese Dictionary</h3><br>
    <input type="text" name="word" placeholder="Enter your word:"><br>
    <input type="submit" value="Search"><br>
</form>
<h3>
    Result: ${result}
</h3>
</body>
</html>