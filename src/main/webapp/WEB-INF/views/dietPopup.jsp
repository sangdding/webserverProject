<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>식단 추가</title>
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
<form action="dietPopup.do" method="post" name="info">
    <input type="text" name="diet" placeholder="오늘의 식단" style="width: 300px; height: 200px; font-size: 20px;">
    <input type="hidden" name="calDate" id = "dateinfo" value="">
    <input type="button" onclick="javascript:selfCloseSubmit()" value="저장하기"/>
</form>
</body>
</html>