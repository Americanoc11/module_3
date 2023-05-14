<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/14/2023
  Time: 2:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<div class="row">
    <div class="col-12">
        <h1 style="text-align: center">
            User Management
        </h1>
    </div>
</div>
<div class="row">
    <div class="col-6 m-3">
        <button type="submit" class="btn btn-primary"
                onclick="window.location.href='/user?action=create'">
            Create new User
        </button>
        <button type="submit" class="btn btn-primary"
                onclick="window.location.href='/user?action'">
            User List
        </button>
    </div>
    <div class="col-6 m-3">
        <form>
            <input type="hidden" name="action" value="search">
            <talbe>
                <tr>
                    <td>
                        <input type="text" name="country" placeholder="Enter country">
                    </td>
                    <td>
                        <button type="submit" class="btn btn-primary">
                            Search
                        </button>
                    </td>
                </tr>
            </talbe>
        </form>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-12">
            <table class="table">
                <tr>
                    <th>No</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Country</th>
                </tr>
                <c:forEach var="element" items="${userList}" varStatus="count">
                    <tr>
                        <td>${element.getId()}</td>
                        <td>${element.getName()}</td>
                        <td>${element.getEmail()}</td>
                        <td>${element.getCountry()}</td>
                        <td>
                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-primary " data-bs-toggle="modal"
                                    data-bs-target="#modelId${element.getId()}">
                                Delete
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="modelId${element.getId()}" tabindex="-1" role="dialog"
                                 aria-labelledby="modelTitleId" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="modelTitleId"></h4>
                                            <button type="button" class="close" data-bs-dismiss="modal"
                                                    aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            Do you want delete User ${element.getName()}?
                                        </div>
                                        <div class="modal-footer">
                                            <form>
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="id" value="${element.getId()}">
                                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                                                    Close
                                                </button>
                                                <button type="submit" class="btn btn-primary">Delete</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td>
                            <button type="submit" class="btn btn-primary"
                                    onclick="window.location.href='/user?action=update&id=${element.getId()}'">
                                Update
                            </button>
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
