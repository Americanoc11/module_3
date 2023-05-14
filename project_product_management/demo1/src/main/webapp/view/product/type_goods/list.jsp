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
<<div class="row ">
    <div class="col-12 btn btn-success">
        <h3 style="text-align: center">Quản Lí sản phẩm</h3>
    </div>
</div>
<div class="row">
    <div class="col-4">
        <button type="submit" class="btn btn-secondary m-3"
                onclick="window.location.href='/type?actionUser=create'">
            Thêm nhà cung cấp
        </button>
    </div>
    <div class="col-4">
        <table class="table">
            <tr>
                <th>STT</th>
                <th>Phân loại</th>
            </tr>
            <c:forEach var="element" items="${typeList}" varStatus="count">
                <tr>
                    <td>${element.getId()}</td>
                    <td>${element.getNameType()}</td>
                    <td>
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal"
                                data-bs-target="#deleteModal${element.getId()}">
                            Xóa
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="deleteModal${element.getId()}" tabindex="-1" role="dialog"
                             aria-labelledby="modelTitleId"
                             aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title" id="modelTitleId"></h4>
                                        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        Bạn có muốn xóa ${element.getNameType()}?
                                    </div>
                                    <div class="modal-footer">
                                        <form action="/type">
                                            <input type="hidden" name="actionUser" value="delete">
                                            <input type="hidden" name="idDelete" value="${element.getId()}">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                Hủy
                                            </button>
                                            <button type="submit" class="btn btn-secondary">Xóa</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <button type="submit" class="btn btn-secondary"
                                onclick="window.location.href='/type?actionUser=update&id=${element.getId()}'">
                            Sửa
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="col-4"></div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>