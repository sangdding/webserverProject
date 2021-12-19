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
</head>
<body>
<form action="selectPopup.do" name="info" method="post">
    <input type="hidden" name="calDate" value=''/>
    <button type="submit" name="menu" value='bmPopup'>배변 상태 관리</button>
    <button type="submit" name="menu" value="dietPopup">식단 관리</button>
    <button type="submit" name="menu" value="bmInfo">배변 상태 조회</button>
    <button type="submit" name="menu" value="dietInfo">식단 조회</button>
</form>
<button type="button" onclick="window.close()">돌아가기</button>
</body>
</html>
