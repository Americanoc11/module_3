<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 17/4/2023
  Time: 2:39 PM
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
          integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/home.css"/>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="container row" style="margin: auto; margin-top: 40px;">
    <div class="col-3"></div>
    <form method="post" class="needs-validation" novalidate>
    <div class="mb-3">
        <label for="validationCustom03" class="form-label">Chủ đề:</label>
        <input type="text" class="form-control" id="validationCustom03" name="title" required>
        <div class="invalid-feedback">
            Hãy thêm chủ đề
        </div>
    </div>
        <div class="mb-3">
        <label for="validationCustom05" class="form-label">Nội dung:</label>
        <textarea class="form-control" id="validationCustom05" name="content" maxlength="500" required></textarea>
        <div class="invalid-feedback">
            Hãy thêm nội dung.
        </div>
    </div>
        <div class="mb-3">
            <label for="validationCustom04" class="form-label">Thêm hình ảnh:</label>
            <input class="form-control" id="validationCustom04" name="image" required>
            <div class="invalid-feedback">
                Hãy thêm hình ảnh
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Đăng bài</button>
    </form>
    <div class="col-3"></div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function () {
        'use strict'

        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll('.needs-validation')

        // Loop over them and prevent submission
        Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }

                    form.classList.add('was-validated')
                }, false)
            })
    })()
</script>
</body>
</html>