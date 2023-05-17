<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- Example of accessing and displaying the newPostList data on home.jsp -->
<html>
<head>
    <!-- ... Your head content ... -->
</head>
<body>
<h1>List of Posts</h1>
<div class="post">
    <c:forEach items="${newPostList}" var="post">
        <div class="postItem">
            <a href="detail" class="title-post">
                <c:out value="${post.title}"/> <!-- Example of accessing a property of Post object -->
                <!-- ... Other properties of Post object ... -->
            </a>
                <%--      <div class="datePost">--%>
                <%--        <c:out value="${post.datePost}" />--%>
                <%--      </div>--%>
            <div class="contentPost">
                <c:out value="${fn:substring(post.content,0, 250)}..."/>
            </div>

        </div>
    </c:forEach>
</div>
<div class="footer mt-5">
    <section class="link">
        <div class="logos">
            <a href="#"><i class="fab fa-facebook-square fa-2x logo"></i></a>
            <a href="#"><i class="fab fa-instagram fa-2x logo"></i></a>
            <a href="#"><i class="fab fa-twitter fa-2x logo"></i></a>
            <a href="#"><i class="fab fa-youtube fa-2x logo"></i></a>
        </div>
        <div class="sub-links">
            <ul>
                <li><a href="#">Introduce</a></li>
                <li><a href="#">Developers</a></li>
                <li><a href="#">Cookie</a></li>
                <li><a href="#">Jobs</a></li>
                <li><a href="#">Terms</a></li>
                <li><a href="#">Privacy</a></li>
                <li><a href="#">Help Center</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
        </div>
    </section>
    <!-- END OF LINKS -->

    <!-- FOOTER -->
    <footer>
        <p>CodeGym@2018. All rights reserved.</p>
    </footer>
</div>
</body>
</html>
