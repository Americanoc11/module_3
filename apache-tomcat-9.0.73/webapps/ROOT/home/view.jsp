<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 18/4/2023
  Time: 2:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>view post</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
          integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/home.css"/>

</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="row my-5">
    <div class="left-content col-3">
        <img src="https://nemtv.vn/wp-content/uploads/2019/03/kinh-nghiem-du-lich-sai-gon-00.jpg" alt="" class="img-fluid">
        <img src="https://nemtv.vn/wp-content/uploads/2019/03/kinh-nghiem-du-lich-lai-chau-nemtv.jpg" alt="" class="img-fluid my-5">
        <img src="https://nemtv.vn/wp-content/uploads/2019/04/kinh-nghiem-du-lich-bac-kan-nemtv.jpg"  class="img-fluid" alt="">
    </div>
    <div class="content col-6">
        <div class="container">
            <h2>${post.getTitle()}</h2>
            <img src="${post.getImage()}" class="img-fluid my-5" alt="">
            <div>${post.getContent()}</div>
            <hr>
            <div class="input-group row" style="margin-top: 20px">
                <label for="comment" class="col-2">${sessionScope.account.getUsername()}</label>
                <input class="form-control col-10" name="comment" id="comment"></input>
                <button type="submit" class="btn btn-primary" style="width: 100px">save</button>
            </div>

        </div>
    </div>
    <div class="right-content col-3">
        <img src="https://nemtv.vn/wp-content/uploads/2019/03/kinh-nghiem-du-lich-son-la-2-nemtv.jpg"  class="img-fluid" alt="">
        <img src="https://nemtv.vn/wp-content/uploads/2019/04/kinh-nghiem-du-lich-bac-kan-nemtv.jpg"  class="img-fluid my-5" alt="">
        <img src="https://nemtv.vn/wp-content/uploads/2019/03/kinh-nghiem-du-lich-lai-chau-nemtv.jpg" alt="" class="img-fluid">
    </div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>

</html>
