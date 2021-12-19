<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>메뉴</title>
    <script>
        window.onload = function () {
            var date = localStorage.getItem('date');//date값 받아오기
            console.log(date); //form에 날짜정보 넣기
            document.info.calDate.value = date;
        }
    </script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/selectPopup.css">
</head>
<body>
<form action="selectPopup.do" name="info" method="post">
    <input type="hidden" name="calDate" value=''/>
    <button class="button button--pandora" type="submit" name="menu" value='bmPopup'><span>배변 상태 관리</span></button>
    <button class="button button--pandora" type="submit" name="menu" value="dietPopup"><span>식단 관리</span></button>
    <button class="button button--pandora" type="submit" name="menu" value="bmInfo"><span>배변 상태 조회</span></button>
    <button class="button button--pandora "type="submit" name="menu" value="dietInfo"><span>식단 조회</span></button>
</form>
<button class="link link--elara" type="button" onclick="window.close()"><span>돌아가기</span></button>
</body>
</html>
