<%--
  Created by IntelliJ IDEA.
  User: Nguyễn Viết Hoàng
  Date: 4/18/2023
  Time: 11:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ozone</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
          integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/home.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pagination.css"/>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="content my-5">
    <div class="container-fluid row">
        <div class="left-content col-3">
            <c:choose>
                <c:when test="${(sessionScope.account.isAdmin() ? 1: 0) == 1}">
                    <div class="menu-content">
                        <button type="submit"><a href="/home?action=create"><i class="fa-solid fa-pen-to-square"></i>Bài viết mới</a></button>
                        <button type="submit"><a href="#"><i class="fa-solid fa-bell"></i>Thông báo</a></button>
                        <button type="submit"><a href="#"><i class="fa-sharp fa-regular fa-comment"></i>Phản hồi</a></button>
                    </div>
                </c:when>
                <c:otherwise>
                    <img src="https://nemtv.vn/wp-content/uploads/2019/03/kinh-nghiem-du-lich-sai-gon-00.jpg" alt="" class="img-fluid">
                    <img src="https://nemtv.vn/wp-content/uploads/2019/03/kinh-nghiem-du-lich-lai-chau-nemtv.jpg" alt="" class="img-fluid my-5">
                    <img src="https://nemtv.vn/wp-content/uploads/2019/04/kinh-nghiem-du-lich-bac-kan-nemtv.jpg"  class="img-fluid" alt="">
                </c:otherwise>
            </c:choose>
        </div>
        <div class="mid-content col-6">
            <ul id="paginated-list" data-current-page="1" aria-live="polite" style="padding-left: 0;">
                <c:choose>
                    <c:when test="${newPostList.size() == 0}">
                        <h3>Không tìm thấy nội dung</h3>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="post" items="${newPostList}">
                            <li style="list-style: none; border-radius: 10px" class="row border bounded-1 my-2 position-relative" style="border-radius: 10px;">
                                <div class="col-8" id="demo" style=" font-size: 18px">
                                    <div class="p-3" style="margin-top: 21px;">
                                        <h2 class="title">
                                            <a class="text-decoration-none"
                                               href="/home?action=detail&id=${post.getId()}">
                                                    ${post.getTitle()}
                                            </a>
                                        </h2>
                                        <div>${post.getAuthor()}</div>
                                        <div class="contentPost">
                                            <c:out value="${fn:substring(post.content,0, 100)}..."/>
                                        </div>
                                        <span>
                                                ${post.getPostDate()}
                                        </span>
                                    </div>
                                    <c:if test="${(sessionScope.account.isAdmin() ? 1: 0) == 1}">
                                        <div class="options">
                                            <div class="dropdown">
                                                <a class="btn" href="#" role="button" id="dropdownMenuLink"
                                                   data-bs-toggle="dropdown" aria-expanded="false">
                                                    <i class="fa-solid fa-ellipsis-vertical"></i>
                                                </a>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                                    <div>
                                                        <a class="dropdown-item"
                                                           href="/home?action=update&id=${post.getId()}">
                                                            Update
                                                        </a>
                                                    </div>
                                                    <div>
                                                        <a onclick="deleteId(${post.getId()}, '${post.getTitle()}')"
                                                           type="button" class="dropdown-item" data-bs-toggle="modal"
                                                           data-bs-target="#modelId">
                                                            Delete
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                                <div class="col-4" style="
                                position: absolute;
                                float: right;
                                top: 51px;
                                right: 0;">
                                    <img src="${post.getImage()}" class="img-fluid" alt="" style=" width: 215px; height: 122px">
                                </div>
                            </li>

                        </c:forEach>
                    </c:otherwise>
                </c:choose>

            </ul>
            <div style="position: relative; top: 60px">
                <nav class="pagination-container">
                    <button class="pagination-button" id="prev-button" aria-label="Previous page" title="Previous page">
                        &lt;
                    </button>

                    <div id="pagination-numbers">

                    </div>

                    <button class="pagination-button" id="next-button" aria-label="Next page" title="Next page">
                        &gt;
                    </button>
                </nav>
            </div>
        </div>
        <div class="right-content col-3">
            <img src="https://nemtv.vn/wp-content/uploads/2019/03/kinh-nghiem-du-lich-son-la-2-nemtv.jpg"  class="img-fluid" alt="">
            <img src="https://nemtv.vn/wp-content/uploads/2019/04/kinh-nghiem-du-lich-bac-kan-nemtv.jpg"  class="img-fluid my-5" alt="">
            <img src="https://nemtv.vn/wp-content/uploads/2019/03/kinh-nghiem-du-lich-lai-chau-nemtv.jpg" alt="" class="img-fluid">
        </div>

    </div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
<div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modelTitleId">Confirm</h5>
                <button type="button" class="close border-0 bg-white" data-bs-dismiss="modal" aria-label="Close">
                    <i class="fa-solid fa-xmark" style="font-size: 30px"></i>
                </button>
            </div>
            <div class="modal-body">
                Do you want to <span class="text-danger" id="nameDelete"></span>
            </div>
            <div class="modal-footer">
                <form action="/home">
                    <div class="input-group">
                        <input id="idDelete" type="hidden"
                               class="form-control" name="idDel">
                        <input type="hidden" name="action" value="delete">
                    </div>

                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/pagination.js"></script>
<script>
    function deleteId(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;
    }
</script>
</body>