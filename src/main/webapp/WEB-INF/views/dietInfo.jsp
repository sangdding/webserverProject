<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
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
        .title{
            color: black;
            position: absolute;
            top:50px;
            right:45%;
        }
    </style>
</head>
<body>
<div class="title">
    먹은 음식
</div>

<div class="info">
    ${diet}
</div>

</body>
</html>
