<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>배변 상태 정보</title>
    <style>
        *{
            margin: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body{
            display: flex;
            justify-content: center;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            background-color: antiquewhite;
        }
        .mb-4{
            filter: invert(37%) sepia(43%) saturate(297%) hue-rotate(347deg) brightness(102%) contrast(89%);
        }
        div{
            margin: 30px;
        }
        .info {
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
    </style>
    <script>
        var x=document.getElementsByTagName("img");
        console.log(x);
        document.getElementsByClassName("mb-4").style.WebkitFilter = "grayscale(100%)";
        if(${color}="red"){
            x.style.filter= "invert(9%) sepia(86%) saturate(7021%) hue-rotate(14deg) brightness(81%) contrast(115%)";
        }if(${color}="green"){
            x.style.filter= "invert(54%) sepia(13%) saturate(1321%) hue-rotate(118deg) brightness(87%) contrast(94%)";
        }if(${color}="gold"){
            x.style.filter= "invert(94%) sepia(55%) saturate(4660%) hue-rotate(319deg) brightness(102%) contrast(101%)";
        }
    </script>
</head>
<body>
<div class="info">
    <div class="time">
        시간 : ${time}시에 힘을 내셨습니다!
    </div>
    <div class="color">
        색 : ${color}
        <img class="mb-4"   src="${pageContext.request.contextPath}/img/poo-solid.svg" alt="똥" width="30"
                                            height="30">
    </div>
    <div class="smell">
        냄새 정도 : ${smell}
        <img  src="${pageContext.request.contextPath}/img/nose'.png"width="30"
             height="30">
    </div>
    <div class="shape">모양 : ${shape} 입니다</div>

</div>

</body>
</html>
