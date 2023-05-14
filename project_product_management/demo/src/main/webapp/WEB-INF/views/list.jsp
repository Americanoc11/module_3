<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/7/2023
  Time: 6:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="utf-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Product Management</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

<!-- Nav tabs -->
<ul class="nav nav-tabs|pills" id="navId">
  <li class="nav-item">
    <ion-icon name="home-outline" type="button" onclick="window.location = '#'"></ion-icon>
  </li>

  <li class="nav-item">
    <input type="text">
    <ion-icon name="search-outline"></ion-icon>
  </li>

</ul>
<div>
  <h2 style="text-align: center">Product Management</h2>
</div>

<div>
  <button type="button" class="btn btn-primary" onclick="window.location='/product/form-create'">Create</button>
</div>
<div class="container">
  <table class="table">
    <thead>
    <tr>
      <th>No</th>
      <th>Name</th>
      <th>Date of manufacture</th>
      <th>Details</th>
    </tr>
    </thead>
    <tbody>
    <tr th:each="element, iterStat : ${listProduct}">
      <td th:text="${element.getId()}"></td>
      <td th:text="${element.getName()}"></td>
      <td th:text="${element.getDate()}"></td>
      <td th:text="${element.getDetail()}"></td>
      <td>
        <button type="button" class="btn btn-secondary">
          <a th:href="@{/product/{id}/form-update(id=${element.getId()})}"
             style="text-decoration: none ; color: white"> Update</a>
        </button>
      </td>
      <td>
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-danger btn-lg" data-bs-toggle="modal" data-bs-target="#modelId"
                th:attr="onclick=|upload('${element.getId()}','${element.getName()}')|">
          Delete
        </button>
      </td>
    </tr>
    </tbody>
  </table>
</div>


<!-- Modal -->
<div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="modelTitleId"></h4>
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Bạn có muốn xóa <span style="color: red" id="name"></span> không ?
      </div>
      <div class="modal-footer">
        <form action="/product/delete">
          <input type="hidden" id="id" name="id">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-danger delete">Delete</button>
        </form>

      </div>
    </div>
  </div>
</div>
<script>
  function upload(id, name) {
    document.getElementById("id").value = id;
    document.getElementById("name").innerHTML = name;
  }
</script>

</body>
</html>
