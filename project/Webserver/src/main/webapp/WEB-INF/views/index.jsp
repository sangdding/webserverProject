<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml" xmlns:sec="http://www.thymeleaf.org/extras/spring-security">
<head>
    <meta charset="UTF-8">
    <title>메인</title>
</head>
<body>
    <h1>메인 페이지(calender)</h1>
    <hr>
    <a sec:authorize="isAnonymous()" th:href="@{/user/login}">로그인</a>
    <a sec:authorize="isAuthenticated()" th:href="@{/user/logout}">로그아웃</a>
    <a sec:authorize="isAnonymous()" th:href="@{/user/signup}">회원가입</a>
    <a sec:authorize="hasRole('ROLE_MEMBER')" th:href="@{/user/info}">내정보</a>
    <a sec:authorize="hasRole('ROLE_MEMBER')" th:href="@{/user/calender}">캘린더</a>
</body>
</html>