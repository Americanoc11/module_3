<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/28/2023
  Time: 2:57 PM
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
    <div class="row m-3">
        <div class="col"></div>
        <div class="col-6">
            <form method="post" class="btn btn-secondary">
                <h4 style="text-align: center">
                    Ghi chú
                </h4><br>
                <div>
                    <p>${note.getTitle()}</p>
                    <input type="hidden" name="title" value="${note.getTitle()}">
                    <br>
                    <textarea name="content" id="" cols="30" rows="10">${note.getContent()}</textarea>
                    <input type="hidden" name="typeId" value="${note.getTypeId()}">
                </div>
                <div class="row">
                    <div class="col">
                        <button type="submit"
                                class="btn btn-dark">
                            Sửa
                        </button>
                    </div>
                </div>
                <input type="hidden" name="id" value="${note.getId()}">
            </form>
        </div>
        <div class="col"></div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
