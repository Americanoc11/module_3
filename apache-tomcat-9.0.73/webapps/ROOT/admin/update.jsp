<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 21/4/2023
  Time: 12:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <title>Admin</title>
</head>
<body>
<div class="container">
    <form method="post" class="needs-validation" novalidate>
        <div class="mb-3">
            <label for="validationCustom03" class="form-label" >Username:</label>
            <input type="text" class="form-control" id="validationCustom03" name="username" value="${user.getUsername()}" required>
            <div class="invalid-feedback">
                Username is empty!
            </div>
        </div>

        <div class="mb-3">
            <label for="validationCustom05" class="form-label">Password:</label>
            <input type="password" class="form-control" id="validationCustom05" name="password" required>
            <div class="invalid-feedback">
                Please enter a password.
            </div>
        </div>
        <div class="mb-3">
            <label for="validationCustom04" class="form-label">Confirm password:</label>
            <input type="password" class="form-control" id="validationCustom04" required>
            <div class="invalid-feedback">
                Please enter a password.
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Save</button>
    </form>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
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
</html>

