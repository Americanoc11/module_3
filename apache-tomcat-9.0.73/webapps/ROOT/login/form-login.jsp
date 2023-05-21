<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Vĩ Trần
  Date: 4/7/2023
  Time: 9:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href="${pageContext.request.contextPath}/assets/images/logo-title.png">
    <title>Login</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
            crossorigin="anonymous"
    />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/form-login.css"/>
</head>
<body>
<div class="container">
    <%--    logo--%>
    <div class="header">
        <nav>
            <nav
                    class="d-flex justify-content-between align-items-center pt-3 pb-3"
            >
                <a href="home"><img src="${pageContext.request.contextPath}/assets/images/logo.PNG" class="logo"/></a>
            </nav>
        </nav>
    </div>

    <%--    form-login--%>
    <div class="main">
        <div class="form-login">
            <form id="login" method="post">
                <h1>Login Ozone</h1>
                <input
                        type="text"
                        name="username"
                        class="username w-100"
                        placeholder="Username"
                />
                <input
                        type="password"
                        name="password"
                        class="password w-100"
                        placeholder="Password"
                />

                <c:if test="${accountUser == null}">
                    <p style="color: red; margin-top: -8px; margin-bottom: 8px">${messageError}</p>
                </c:if>
                <input
                        type="submit"
                        class="submit-btn w-100 fw-bold"
                        value="Login"
                />
                <div class="modified">
                    <div class="remember-me">
                        <input type="checkbox" class="me-2" id="remember-me"/><label
                            for="remember-me"
                    >Remember me</label
                    >
                    </div>
                    <a href="">Need help ?</a>
                </div>
                <div class="login-form-other">
                    <p>
                        Don't have an account?
                        <b id="register-btn" style="color: #1d2129; margin-left: 5px"
                           onclick="location.href = '/register'">
                            Register
                        </b>
                    </p>
                </div>
            </form>
        </div>
    </div>
    <div class="footer"></div>
</div>
</body>
<% String message = (String) request.getAttribute("message"); %>
<script>
    var message = "<%= message%>";
    if (message === "register") {
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: 'Registration successful!',
            showConfirmButton: false,
            timer: 1500
        })
    }
</script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"
></script>

</html>