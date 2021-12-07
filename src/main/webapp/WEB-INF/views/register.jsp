<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body {
            min-height: 100vh;
            background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
            background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
            background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
            background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
            background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
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
    </style>

</head>
<body>
<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
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
