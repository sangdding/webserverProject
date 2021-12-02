<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
</head>
<body>
<form action = "register.do" method = "post">
  <label>name</label>
  <input type="text" name="userName" placeholder="이름을 입력해주세요."/>
  <label>Id</label>
  <input type="text" name="userId" placeholder="아이디를 입력해주세요."/>
  <label>Password</label>
  <input type="text" name="userPassword" placeholder="비밀번호를 입력해주세요."/>
  <button type="submit" value="등록">가입하기</button>
</form>
</body>
</html>
