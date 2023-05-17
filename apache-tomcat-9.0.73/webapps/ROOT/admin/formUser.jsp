<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 21/4/2023
  Time: 12:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            border: none;
            font-family: 'Open Sans', sans-serif;
        }
        .form-update {
            width: 600px;
            border-radius: 5px;
            padding: 60px 68px 40px;
            box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
        }
        .form-update #user h1 {
            font-size: 32px;
            font-weight: 600;
            margin-bottom: 28px;
        }
        .form-update #update p {
            margin: 0;
            font-weight: 600;
        }
        #user .username,
        #user .password {
            outline: 0;
            border: 1px;
            background: #d9d9d9;
            border-radius: 4px;
            height: 50px;
            line-height: 50px;
            padding: 8px 20px;
            margin-bottom: 16px;
            line-height: 50px;
        }
        #update .submit-btn {
            background: #e50914;
            border-radius: 4px;
            font-size: 16px;
            color: #fff;
            font-weight: 500;
            margin: 24px 0 12px;
            height: 50px;
        }
    </style>
</head>
<body>
<div class="form-update" style="margin: 100px auto 100px;">
    <c:if test="${acountUser != null}">
        <form id="update" method="get">
            <h1>${messeger}</h1>
            <p>Username</p>
            <input
                    type="text"
                    name="username"
                    class="username w-100"
                    placeholder="Username"
                    value="${acountUser.getName()}"
            />
            <p>Current Password</p>
            <input
                    type="text"
                    name="currentPassword"
                    class="username w-100"
                    placeholder="Current Password"
            />
            <p>New Password</p>
            <input
                    type="text"
                    name="newPassword"
                    class="username w-100"
                    placeholder="New Password"
            />
            <p>Repeat Password</p>
            <input
                    type="text"
                    name="repeatPassword"
                    class="username w-100"
                    placeholder="Repeat Password"
            />
            <input
                    type="submit"
                    class="submit-btn w-100 fw-bold"
                    value="Save"
            />
        </form>
    </c:if>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</html>
