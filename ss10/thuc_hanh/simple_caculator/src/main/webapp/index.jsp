<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/AppCaculator">
    <h3>Caculator</h3><br>
    <table>
        <tr>
            <td>First operand:</td>
            <td>
                <input type="number" name="firstNumber">
            </td>
        </tr>
        <tr>
            <td>Operator</td>
            <td>
                <select name="operator">
                    <option value="Addition">Addition</option>
                    <option value="Subtraction">Subtraction</option>
                    <option value="Multiplication">Multiplication</option>
                    <option value="Division">Division</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Second operand:</td>
            <td>
                <input type="number" name="secondNumber">
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="submit" value="Calculator">
            </td>
        </tr>
    </table>
</form>
<h3>Result: ${Result}</h3>
</body>
</html>