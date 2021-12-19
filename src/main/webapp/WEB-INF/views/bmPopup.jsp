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
    <style>
        body {
            background-color: antiquewhite;

        }
        form {
            position: absolute;
            align-content: center;
            top: 50%;
            left: 50%;
            width: 70%;
            height: 60%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 0.5rem 0.5rem;
            border-radius: 0.5rem;
        }
        .select_{
            display: inline-flex;
            margin: 10px;
        }
        .input_{
            display: grid;
        }
        select{
            text-align: center;

            margin-top: 15px;
            cursor: pointer;
            margin-right: 20px;
            border-color: #806751;
        }
        select:hover{
            color: #fff;
            background-color: #806751;
            opacity: 0.9;
        }
        input {
            /*width: 20px; height: 20px;*/
            text-align: center;
            cursor: pointer;

        }
        input#time{
            border-color: #806751;
            margin-top: 50px;
            margin-bottom: 40px;
        }
        input:hover{
            color: #fff;
            background-color: #806751;
            opacity: 0.9;
        }
    </style>
</head>
<body>

<form action="bmPopup.do" method="post" name="info">
    <div class="select_">
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
    </div>
    <div class="input_">
        <input id="time" type="number" name="time" min="0" max="60" placeholder="시간입력(분)">
        <input type="hidden" name="calDate" id = "dateinfo" value="">
        <input type="button" onclick="javascript:selfCloseSubmit()" value="저장하기"/>
    </div>
</form>
</body>
</html>
