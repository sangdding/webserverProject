<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
</head>
<body>
<form action="login.do" method="post">
    <label>Id</label>
    <input type="text" name="userId" placeholder="아이디를 입력해주세요."/>
    <label>Password</label>
    <input type="text" name="userPassword" placeholder="비밀번호를 입력해주세요."/>
    <button type="submit">로그인</button>
</form>
<a href="register">
    <button type="submit">회원가입</button>
</a>
</body>
</html>
