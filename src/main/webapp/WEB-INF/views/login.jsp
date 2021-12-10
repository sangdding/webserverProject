<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/css/docs.min.css" rel="stylesheet">
    <%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">--%>
    <!-- Custom styles for this template -->

</head>
<style>
    html,
    body {
        height: 100%;
    }

    body {
        display: flex;
        align-items: center;
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #e6e6e6;
    }
    main {
        margin-top: 40px;
        padding: 32px;
        background: #fff;
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        border-radius: 10px;
        -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
        -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
        box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
    .form-signin {
        width: 100%;
        max-width: 330px;
        padding: 30px;
        margin: auto;
    }

    .form-signin .checkbox {
        font-weight: 400;
    }

    .form-signin .form-floating:focus-within {
        z-index: 2;
    }

    .form-signin input[type="email"] {
        margin-bottom: -1px;
        border-bottom-right-radius: 0;
        border-bottom-left-radius: 0;
    }

    .form-signin input[type="password"] {
        margin-bottom: 10px;
        border-top-left-radius: 0;
        border-top-right-radius: 0;

    }

    .mb-4 {
        filler: #806751;

    }
</style>
<body class="text-center">
<main class="form-signin">

    <form action="login.do" method="post" class="validation-form" novalidate>
        <img class="mb-4" src="${pageContext.request.contextPath}/img/poo-solid.svg" alt="똥" width="72"
             height="72">

        <h1 class="h3 mb-3 font-weight-normal">로그인</h1>

        <div class="form-floating">
            <input type="text" name="userId" placeholder="아이디를 입력해주세요." class="form-control"/>
            <label>Id</label>
        </div>
        <div class="form-floating">
            <input type="text" name="userPassword" placeholder="비밀번호를 입력해주세요." class="form-control"/>
            <label class="sr-only">Password</label>
        </div>
        <br>
        <button type="submit" class="btn btn-lg btn-primary btn-block">로그인</button>

        <a href="register">
            <button type="button" class="btn btn-lg btn-primary btn-block">회원가입</button>
        </a>
    </form>
</main>
</body>
<script>
    window.addEventListener('load', () => {
    const forms = document.getElementsByClassName('validation-form');
    Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
            if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        }, false);
        });
    }, false);
</script>

</html>
