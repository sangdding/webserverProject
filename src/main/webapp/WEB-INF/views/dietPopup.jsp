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
    <div class="header">
        <img class="mb-4" src="${pageContext.request.contextPath}/img/poo-solid.svg" alt="똥" width="50"
             height="50">
        <span>오늘 드신 음식을 적어주세요</span>
    </div>

    <input  id="text" type="text" name="diet" placeholder="">
    <input type="hidden" name="calDate" id = "dateinfo" value="">
    <input class="link link--elara" type="button" onclick="javascript:selfCloseSubmit()" value="저장하기">
</form>
</body>
</html>