<%--
  Created by IntelliJ IDEA.
  User: Vĩ Trần
  Date: 4/18/2023
  Time: 9:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>

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
                    <a class="nav-link color-white" aria-current="page" href="#">Ảnh</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link color-white" href="#">Tin tức</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle color-white" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
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
                    <a class="nav-link color-white" href="#" tabindex="-1">Kinh nghiệm</a>
                </li>
            </ul>
            <form action="/home" class="form-search-header d-flex">
                <button type="submit" class="search-btn btn btn-outline-success me-2"><i class="fa-solid fa-magnifying-glass"></i>
                </button>
                <input type="search" name="search" id="search" placeholder="search..." class="form-control me-2" value="${nameTitle}">
                <input type="hidden" name="action" value="search">
            </form>
            <div class="account-user" style="margin-right: 150px;">
                <div class="dropdown">
                    <button class="dropdown-toggle col-6" data-bs-toggle="dropdown" aria-expanded="false"
                            style="background: transparent; outline: 0; border: 0; color: #d9d9d9">
                        <i class="fa-solid fa-house-user" style="font-size: 30px"></i>
                    </button>
                    <ul class="dropdown-menu">
                        <c:choose>
                            <c:when test="${(sessionScope.account.isAdmin() ? 1: 0) == 1}">
                                <li class="">${account.getUsername()}</li>
                                <li><a class="dropdown-item" href="admin">Quan lý tài khoản</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="">${account.getUsername()}</li>
                            </c:otherwise>
                        </c:choose>
                        <li><a class="dropdown-item" href="logout">Đăng xuất</a></li>
                    </ul>

                </div>
            </div>
        </div>
    </div>
</nav>

