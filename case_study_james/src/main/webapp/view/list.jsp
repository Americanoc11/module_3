<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/28/2023
  Time: 2:57 PM
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
    <div class="col-12 btn btn-success">
        <h3 style="text-align: center">Các Ghi Chú</h3>
    </div>
</div>
<div class="row">
    <div class="col-2"></div>
    <div class="col-7">
        <table class="table">
            <tr>
                <th>STT</th>
                <th>Tiêu Đề</th>
                <th>Phân loại</th>
                <th colspan="2"></th>
            </tr>
            <c:forEach var="note" items="${noteList}">
                <tr>
                    <td>${note.getId()}</td>
                    <td>
                        <a href="list2.jsp"></a>
                            ${note.getTitle()}
                    </td>
                    <td>${note.getTypeId()}</td>
                    <td>
                        <button type="button" class="btn btn-primary btn-lg" data-bs-toggle="modal"
                                data-bs-target="#deleteModal${note.getId()}">
                            Xóa
                        </button>
                    </td>
                    <!-- Modal -->
                    <div class="modal fade" id="deleteModal${note.getId()}" tabindex="-1" role="dialog"
                         aria-labelledby="modelTitleId"
                         aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                    <%-- modal header --%>
                                <div class="modal-header">
                                    <h4 class="modal-title" id="modelTitleId"></h4>
                                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">
                                                &times;
                                            </span>
                                    </button>
                                        <%-- modal body--%>
                                </div>
                                <div class="modal-body">
                                        <span>
                                            Bạn có muốn xóa ghi chú ${note.getTitle()}?
                                        </span>
                                </div>
                                    <%-- modal footer--%>
                                <div class="modal-footer">
                                    <form action="/note">
                                        <input type="hidden" name="actionUser" value="delete">
                                        <input type="hidden" name="idDelete" value=${note.getId()}>
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                            Hủy
                                        </button>
                                        <button type="submit" class="btn btn-primary">Xóa</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <td>
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary btn-lg"
                                onclick="window.location.href='/note?actionUser=update&id=${note.getId()}'">
                            Sửa
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="col-3">
        <div class="btn btn-light">
            <form action="/note">
                <input type="hidden" name="actionUser" value="search">
                <input type="search" name="title" width="100%">
                <button type="submit" class="btn btn-primary btn-lg">
                </button>
            </form>
            <button type="submit" class="btn btn-primary btn-lg m-3"
                    onclick="window.location.href='/note?actionUser=create'">
                Create new note
            </button>
            <select name="" id="" class="btn btn-primary btn-lg m-3">
                <option value="">Thể loại</option>
            </select>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
