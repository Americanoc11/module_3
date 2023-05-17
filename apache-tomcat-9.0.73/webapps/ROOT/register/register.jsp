<%--
  Created by IntelliJ IDEA.
  User: Vĩ Trần
  Date: 4/7/2023
  Time: 1:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href="${pageContext.request.contextPath}/assets/images/logo-title.png">
    <title>Register</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
            crossorigin="anonymous"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/form-register.css"/>
</head>
<body>
<div class="container">
    <div class="header">
        <nav>
            <nav
                    class="d-flex justify-content-between align-items-center pt-3 pb-3"
            >
                <a href="home"><img src="${pageContext.request.contextPath}/assets/images/logo.PNG" class="logo"/></a>
            </nav>
        </nav>
    </div>
    <div class="main">
        <div class="form-login">
            <form id="login" method="post">
                <h1>Sign Up</h1>
                <input
                        type="text"
                        name="username"
                        class="username w-100"
                        placeholder="Username"
                        <c:if test="${param.status == 0}">
                            value="${username}"
                        </c:if>
                />
                <c:if test="${usernameValidate == null}">
                <p style="color: red; margin-top: -8px; margin-bottom: 8px"
                   class="title-error-login">${usernameValidate}</p>
                </c:if>
                <c:if test="${usernameMessage != null}">
                <p style="color: red; margin-top: -8px; margin-bottom: 8px"
                   class="title-error-login">${usernameMessage}</p>
                </c:if>
                <input
                        type="text"
                        name="email"
                        class="email w-100"
                        placeholder="Email"
                        <c:if test="${param.status == 0}">
                            value="${email}"
                        </c:if>
                />
                <c:if test="${emailMessage != null}">
                <p style="color: red; margin-top: -8px; margin-bottom: 8px"
                   class="title-error-login">${emailMessage}</p>
                </c:if>
                <input
                        type="password"
                        name="password"
                        class="password w-100"
                        placeholder="Password"
                        <c:if test="${param.status == 0}">
                            value="${password}"
                        </c:if>
                />
                <c:if test="${passwordMessage != null}">
                <p style="color: red; margin-top: -8px; margin-bottom: 8px"
                   class="title-error-login">${passwordMessage}</p>
                </c:if>
                <input
                        type="password"
                        name="confirmPassword"
                        class="password w-100"
                        placeholder="Confirm Password"
                />
                <input
                        type="submit"
                        class="submit-btn w-100 fw-bold"
                        value="Register"
                />
                <a href="">Need help?</a>
        </div>
        <div class="login-form-other">
        </div>
        </form>
    </div>
</div>
<div class="footer"></div>
</div>
</body>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"
></script>
</html>


