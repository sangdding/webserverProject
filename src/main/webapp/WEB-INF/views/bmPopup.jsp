<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>변 상태 입력기</title>
    <script>
        var date = localStorage.getItem('result'); //date값 받아오기
        document.info.calDate.value = date;
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
    <input type="number" name="time" placeholder="시간입력(분)">
    <input type="hidden" name="calDate" value="">
    <button type="submit">적용하기</button>
</form>

</body>
</html>
