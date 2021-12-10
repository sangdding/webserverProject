<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>변 상태 입력기</title>
    <script>
        function selfCloseSubmit()
        {
            var f = document.forms.info;
            opener.name = "parentPage"; //유니크한 이름이어야 합니다.
            f.target = opener.name;
            f.submit();
            self.close();
        }
    </script>
    <script>
        window.onload = function () {
            var date = localStorage.getItem('date');//date값 받아오기
            console.log(date); //form에 날짜정보 넣기
            document.info.calDate.value = date;
        }
    </script>
</head>
<body>
<form action="bmPopup.do" method="post" name="info">
    <select name="color">
        <option value="">색깔</option>
        <option value="red">붉은색</option>
        <option value="green">녹색</option>
        <option value="gold">황금색</option>
    </select>
    <select name="shape">
        <option value="">형태</option>
        <option value="diarrhea">설사</option>
        <option value="normal">평범</option>
        <option value="solid">돌덩이</option>
    </select>
    <select name="smell">
        <option value="">냄새</option>
        <option value="shit">독함</option>
        <option value="normal">평범</option>
        <option value="good">없음</option>
    </select>
    <input type="number" name="time" min="0" max="60" placeholder="시간입력(분)">
    <input type="hidden" name="calDate" id = "dateinfo" value="">
    <input type="button" onclick="javascript:selfCloseSubmit()" value="저장하기"/>
</form>
</body>
</html>
