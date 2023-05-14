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
        <h3 style="text-align: center">
            Quản lí sản phẩm
        </h3>
    </div>
</div>
<div class="row">
    <div class="col-2">
        <button type="submit" class="btn btn-secondary m-3"
                onclick="window.location.href='/product?actionUser=create'">
            Thêm sản phẩm
        </button>
    </div>
    <div class="col-8 m-3">
        <h5 style="text-align: center">Danh sách sản phẩm</h5>
        <table class="table">
            <tr>
                <td>STT</td>
                <td>Tên Sản Phẩm</td>
                <td>Mô Tả</td>
                <td>Giá Tiền</td>
                <td>Ảnh</td>
                <td>Phân loại</td>
                <td>Ghi chú</td>
                <td>Số lượng</td>
                <td>Nhà cung cấp</td>
                <td colspan="2"></td>
            </tr>
            <c:forEach var="product" items="${productList}" varStatus="count">
                <tr>
                    <td>${product.getId()}</td>
                    <td>${product.getName()}</td>
                    <td>${product.getDescribe()}</td>
                    <td>${product.getPrice()}</td>
                    <td>
                        <img src="${product.getImage()}" alt="" width="100px" height="100px">
                    </td>
                    <td>${product.getTypeId()}</td>
                    <td>${product.getNote()}</td>
                    <td>${product.getAmount()}</td>
                    <td>${product.getSupplierId()}</td>
                    <td>
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal"
                                data-bs-target="#modelId${product.getId()}">
                            Xóa
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="modelId${product.getId()}" tabindex="-1" role="dialog"
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
                                        Bạn có muốn xóa sản phẩm ${product.getName()}?
                                    </div>
                                    <div class="modal-footer">
                                        <form action="/product">
                                            <input type="hidden" name="actionUser" value="delete">
                                            <input type="hidden" name="id" value="${product.getId()}">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủys
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
                                onclick="window.location.href='/product?actionUser=update&id=${product.getId()}'">
                            Sửa
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>