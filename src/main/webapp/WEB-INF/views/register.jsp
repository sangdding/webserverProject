<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body {
            min-height: 100vh;
            background-color: #e6e6e6;
        }

        .input-form {
            max-width: 680px;
            margin-top: 80px;
            padding: 32px;
            background: #fff;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
        }
        .btn-primary{
            background-color:#806751;
            border-color:#806751
        }
        .btn-primary.focus, .btn-primary:focus {
            background-color:#806751;
            border-color:#806751
        }
        .input-form{
            align-items: center;
        }
    </style>

</head>
<body>
<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">

            <img class="mb-4" src="${pageContext.request.contextPath}/img/poo-solid.svg" alt="똥" width="72"
                 height="72">
            <h4 class="mb-3">회원가입</h4>
            <form class="validation-form" novalidate action="register.do" method="post">
                <div class="mb-3"><label for="name">이름</label>
                    <input type="text" class="form-control" id="name" name="userName" placeholder="" value=""
                           required>
                    <div class="invalid-feedback"> 이름을 입력해주세요.</div>
                </div>

                <div class="mb-3"><label>아이디</label>
                    <input type="text" name="userId" class="form-control" id="email" placeholder="" required>
                    <div class="invalid-feedback"> 아이디를 입력해주세요.</div>
                </div>

                <div class="mb-3"><label for="address">비밀번호</label>
                    <input type="text" name="userPassword" class="form-control" id="address" placeholder=""
                           required>
                    <div class="invalid-feedback"> 비밀번호를 입력해주세요.</div>
                </div>

                <button class="btn btn-primary btn-lg btn-block" type="submit" value="등록">가입하기</button>

            </form>
        </div>
    </div>
</div>

<script> window.addEventListener('load', () => {
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
}, false); </script>

</body>
</html>
