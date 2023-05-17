<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 21/4/2023
  Time: 12:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
          integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/home.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pagination.css"/>
    <title>Admin</title>
</head>
<body>
<nav class="navbar navbar-expand-lg  navbar-dark bg-dark">
    <div class="container-fluid">
        <a onClick="navigateNewPage('#')" href="home">
            <img class="logo" src="${pageContext.request.contextPath}/assets/images/logo.PNG" alt="" style="height: 80px; width: 80px">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent" style="font-size: 18px">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Trang chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Tin tức</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Khám phá
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Ẩm thực</a></li>
                        <li><a class="dropdown-item" href="#">Địa danh</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Văn hóa</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" tabindex="-1">Kinh nghiệm</a>
                </li>
            </ul>
<%--            <form action="/home" class="form-search-header d-flex">--%>
<%--                <button type="submit" class="search-btn btn btn-outline-success me-2"><i class="fa-solid fa-magnifying-glass"></i>--%>
<%--                </button>--%>
<%--                <input type="search" name="search" id="search" placeholder="search..." class="form-control me-2" value="${nameTitle}">--%>
<%--                <input type="hidden" name="action" value="search">--%>
<%--            </form>--%>
            <div class="account-user" style="margin-right: 150px;">
                <div class="dropdown">
                    <button class="dropdown-toggle col-6" data-bs-toggle="dropdown" aria-expanded="false"
                            style="background: transparent; outline: 0; border: 0; color: #d9d9d9">
                        <i class="fa-solid fa-house-user" style="font-size: 30px"></i>
                    </button>
                    <ul class="dropdown-menu">
<%--                        <c:choose>--%>
<%--                            <c:when test="${(sessionScope.account.isAdmin() ? 1: 0) == 1}">--%>
<%--                                <li class="">${account.getUsername()}</li>--%>
                                <li><a class="dropdown-item" href="admin">Quan lý tài khoản</a></li>
<%--                            </c:when>--%>
<%--                            <c:otherwise>--%>
<%--                                <li class="">${account.getUsername()}</li>--%>
<%--                            </c:otherwise>--%>
<%--                        </c:choose>--%>
                        <li><a class="dropdown-item" href="logout">Đăng xuất</a></li>
                    </ul>

                </div>
            </div>
        </div>
    </div>
</nav>
<div class="container">
<%--    <div class="header">--%>
<%--        <nav class="navbar navbar-expand-lg bg-body-tertiary">--%>
<%--            <div class="container-fluid">--%>
<%--                <a class="navbar-brand fw-bold" href="home">HOME</a>--%>
<%--                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"--%>
<%--                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"--%>
<%--                        aria-expanded="false" aria-label="Toggle navigation">--%>
<%--                    <span class="navbar-toggler-icon"></span>--%>
<%--                </button>--%>
<%--                <div class="collapse navbar-collapse" id="navbarSupportedContent">--%>
<%--                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">--%>
<%--                        <li class="nav-item">--%>
<%--                            <a class="nav-link" href="admin?path=user">User</a>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                    <ul>--%>
<%--                        <div class="account-user">--%>
<%--                            <div class="dropdown">--%>
<%--                                <button class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"--%>
<%--                                        style="background: transparent; outline: 0; border: 0; color: #000000">--%>
<%--                                    <i class="fa-solid fa-house-user"></i>--%>
<%--                                </button>--%>
<%--                                <ul class="dropdown-menu" style="left: auto !important; right: 0 !important;">--%>
<%--                                    <c:if test="${(sessionScope.account.isAdmin() ? 1: 0) == 1}">--%>
<%--                                        <li><a class="dropdown-item" href="admin">Admin management</a></li>--%>
<%--                                    </c:if>--%>
<%--                                    <li><a class="dropdown-item" href="logout">Log out</a></li>--%>
<%--                                </ul>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </nav>--%>
<%--    </div>--%>

    <div class="main" style="padding: 100px 0">
        <table id="example" class="table table-striped" style="width:100%">
            <thead>
            <tr>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Password</th>
                <th>Choice</th>
            </tr>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${accountUserList}" var="acountUser">
                <tr>
                    <th scope="row">${acountUser.getId()}</th>
                    <td class="name-post">${acountUser.getUsername()}</td>
                    <td>${acountUser.getPassword().replaceAll("[0-9]", "*")}</td>
                    <td>
                        <button type="button"
                                onclick="location.href='admin?path=user&action=update&id=${acountUser.getId()}';"
                                class="btn btn-warning me-3">Update
                        </button>

                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal${acountUser.getId()}">Delete
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal${acountUser.getId()}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Delete account</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <span>Do you want delete ${acountUser.getUsername()}</span>
                                        <span>?</span>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-danger"
                                                onclick="location.href='admin?path=user&action=delete&id=${acountUser.getId()}'">Delete</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#example').DataTable();
    });
    let table = $('#example').DataTable();
</script>
</html>
