<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/14/2023
  Time: 2:42 PM
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
<div class="row">
    <div class="col-12 btn btn-success">
        <h2 style="text-align: center">User Management</h2>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-12">


            <form method="post">
                <h5>
                    Create new user
                </h5>
                <table>
                    <tr>
                        <td>
                            <input type="hidden" name="id" value="1">
                        </td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td>
                            <input type="text" name="name" placeholder="Enter name user...">
                        </td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td>
                            <input type="text" name="email" placeholder="Enter email user...">
                        </td>
                    </tr>
                    <tr>
                        <td>Country</td>
                        <td>
                            <input type="text" name="country" placeholder="Enter country user...">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="submit" class="btn btn-secondary">
                                Create
                            </button>
                        </td>
                    </tr>
                </table>
                <button type="submit" class="btn btn-secondary"
                        onclick="window.location.href='/user?action'">
                    Return home
                </button>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
