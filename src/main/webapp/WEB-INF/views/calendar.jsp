<%@ page import="com.webserver.project.SessionConstants" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8' />
    <link href='<%=request.getContextPath()%>/css/calendar.css' rel = "stylesheet" />
    <script src = '<%=request.getContextPath()%>/js/calendar.js'></script>
    <%-- jquery cdn--%>
    <script
            src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
            crossorigin="anonymous">
    </script>
    <%-- calendar custom --%>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                aspectRatio: 1.35,
                headerToolbar: {
                    start: "",
                    left:'prev',
                    center: 'title',
                    right:'next'
                }, //toolbar 설정
                select: function (arg) {
                    var title = prompt('Event Title:');
                    if (title) {
                        calendar.addEvent({
                            title: title,
                            start: arg.start,
                            end: arg.end,
                            allDay: arg.allDay
                        })
                    }
                    calendar.unselect()
                },
                navLinks: true, //날짜 클릭 가능하게 함
                navLinkDayClick: function (date, jsEvent) {
                    var temp = new Date(date);
                    var result = temp.getFullYear().toString() + (temp.getMonth()+1).toString() + temp.getDate().toString();
                    localStorage.setItem('date', result); //date값 일시적으로 로컬에 저장
                    var popupWidth = 400;
                    var popupHeight = 200;
                    var popupX = (window.screen.width / 2) - (popupWidth / 2);
                    var popupY= (window.screen.height / 2) - (popupHeight / 2);
                    // window.open('', '', 'status=no, height=300, width=200, left='+ popupX + ', top='+ popupY);
                    window.open("bmPopup", "장 상태 입력하기", 'status=no, height=200, width=400, left='+ popupX + ', top='+ popupY);
                }
            });
            calendar.render();
        });
    </script>
    <style>
        body {
            justify-content: center;
            align-items: center;
            background-size: cover;
            background-repeat: no-repeat;
            font-family: Arial, sans-serif;
            font-weight: bold;
            font-size: 14px;
        }
        #calendar {
            height: 30vh;
            margin: 30px 50px 50px 100px ;
            max-width: 150vh;
        }
        h1 {
            text-align: center;
        }
         body {
             min-height: 100vh;
             background-color: #e6e6e6;
         }

        .wrap {
            display: inline-flex;
            position: relative;
            text-align: center;
            padding:20px;
            left:30%;
            top:20%;
        }

        a {
            -webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
            -moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
            -ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
            -o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
            transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
            display: block;
            margin: 10px;
            text-decoration: none;
            border-radius: 5px;
            padding: 20px 20px;
        }
        button{
            -webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
            -moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
            -ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
            -o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
            transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
            display: block;
            margin: 10px ;
            text-decoration: none;
            border-radius: 5px;
            padding: 20px 20px;
        }

        a.button {
            color: #806751;
            box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
            border: #806751;

        }

        a.button:hover {
            color: rgba(255, 255, 255, 0.85);
            box-shadow: #806751 0 0px 0px 40px inset;
            border: #806751;
        }

        .button2 {
            color: #806751;
            box-shadow: #806751 0 0px 0px 2px inset;
            border: #806751;
        }

        .button2:hover {
            color: rgba(255, 255, 255, 0.85);
            box-shadow: #806751 0 80px 0px 2px inset;
            border: #806751;
        }

    </style>

</head>
<body>
<%
    if (session.getAttribute(SessionConstants.LOGIN_USER) == null) {
        out.println("<script>alert('로그인을 먼저 해 주세요!');</script>");
        out.println("<script>location.href='login'</script>");
    }
%>

<%
    out.println("<h1>" + request.getAttribute("user_name") + "님의 달력입니다.</h1>");
%>

<div class="wrap">
    <a href="bm" class="button">장 상태 통계창</a>
    <a href="diet" class="button">식단 상태 통계창</a>
    <div id="logout">
        <form action = "logout.do" >
            <button type="submit" class="button2">로그아웃</button>
        </form>
    </div>
</div>
<div id='calendar-wrap'>
    <div id='calendar'></div>
</div>

</body>
</html>
