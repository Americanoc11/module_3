<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/14/2023
  Time: 12:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<div class="container">
    <div class="row">
        <div class="col-12 btn btn-success">
            <h3>
                Create New Product
            </h3>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <form method="post">
                <table>
                    <tr>
                        <td>No</td>
                        <td>
                            <input type="hidden" name="id" value="1">
                        </td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td>
                            <input type="text" name="name" placeholder="Enter a....">
                        </td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td>
                            <input type="text" name="price" placeholder="Enter a....">
                        </td>
                    </tr>
                    <tr>
                        <td>Describe</td>
                        <td>
                            <input type="text" name="describe" placeholder="Enter a....">
                        </td>
                    </tr>
                    <tr>
                        <td>Goods</td>
                        <td>
                            <input type="text" name="goods" placeholder="Enter a....">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="submit" class="btn btn-primary">
                                Submit
                            </button>
                        </td>
                    </tr>
                </table>
            </form>
            <button type="submit" class="btn btn-primary"
                    onclick="window.location.href='/product?action'">
                Return home
            </button>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
