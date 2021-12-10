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
                headerToolbar: {
                    start: "",
                    center: 'prev,title,next',
                    end : 'today'
                }, //toolbar 설정
                navLinks: true, //날짜 클릭 가능하게 함
                navLinkDayClick: function (date, jsEvent) {
                    var temp = new Date(date);
                    var result = temp.getFullYear().toString() + (temp.getMonth()+1).toString() + temp.getDate().toString();
                    localStorage.setItem('date', result); //date값 일시적으로 로컬에 저장
                    window.open("bmPopup", "장 상태 입력하기", "width = 500, height = 500");
                }
            });
            calendar.render();
        });
    </script>
    <style>
        h1 {
            text-align: center;
        }
    </style>
<%--        <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
        <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
        <!-- jquery CDN -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- fullcalendar CDN -->
        <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
        <link href='${pageContext.request.contextPath}/css/calStyle.css' rel='stylesheet' />
        <script src='${pageContext.request.contextPath}/js/calender.js'></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var containerEl = document.getElementById('external-events-list');
            new FullCalendar.Draggable(containerEl, {
                itemSelector: '.fc-event',
                eventData: function(eventEl) {
                    return {
                        title: eventEl.innerText.trim()
                    }
                }
            });
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                headerToolbar: {
                    left: "",
                    center: 'prev title next',
                    right: 'today'
                },
                navLinks: true, // can click day/week names to navigate views
                // selectable: true,
                // selectMirror: true,
                // select: function(arg) {
                //     var title = prompt('Event Title:');
                //     if (title) {
                //         calendar.addEvent({
                //             title: title,
                //             start: arg.start,
                //             end: arg.start,
                //             allDay: arg.allDay
                //         })
                //     }
                //     calendar.unselect()
                // },
                eventClick: function(arg) {
                    if (confirm('Are you sure you want to delete this event?')) {
                        arg.event.remove()

                    }
                },
                editable: true,
                dayMaxEventRows: true, // for all non-TimeGrid views
                views: {
                    timeGrid: {
                        dayMaxEventRows: 6 // adjust to 6 only for timeGridWeek/timeGridDay
                    }
                },
                droppable: true, // this allows things to be dropped onto the calendar
                drop: function(arg) {
                    // is the "remove after drop" checkbox checked?
                    if (document.getElementById('drop-remove').checked) {
                        // if so, remove the element from the "Draggable Events" list
                        arg.draggedEl.parentNode.removeChild(arg.draggedEl);
                    }
                },
                eventSources: [
                    // url:"a",
                    // methodL"GET",
                    // failure: function() {
                    //     alert("there was an error while fetching events!");
                    // }
                ],
                eventContent: {
                    html: `<div><img src="../.././img/poo-solid.svg" class="event-icon bm" /></div>`,
                    html: `<div><img src="../.././img/utensils-solid.svg" class="event-icon diet" /></div>`
                },
                eventDidMount: function (arg) {
                    // querySelectorAll을 이용하여 전체 Element들을 찾는다.
                    const bmIconElements = document.querySelectorAll(
                        '.event-icon.bm');
                    const dietIconElements = document.querySelectorAll(
                        '.event-icon.diet'
                    );

                    // Element를 하나씩 for문으로 돌려서 이벤트를 걸어준다.
                    bmIconElements.forEach((element, key, parent) => {
                        element.addEventListener('click', bmIconClickHandler);
                    });
                    dietIconElements.forEach((element, key, parent) => {
                        element.addEventListener('click', dietIconClickHandler);
                    });
                },
            });

            calendar.render();
        });
        function dietIconClickHandler() {
            var url = "dietPopup";
            var name = "dietPopup";
            var option = "width = 600, height = 600 left = 100, top=50,location=no";
            window.open(url,name,option)
        };
        function bmIconClickHandler(){
            var url = "bmPopup";
            var name = "bmPopup";
            var option = "width = 600, height = 600 left = 100, top=50,location=no";
            window.open(url,name,option)
        }
    </script>
    <style>


        #external-events {
            position: fixed;
            z-index: 2;
            top: 20px;
            left: 20px;
            width: 150px;
            padding: 0 10px;
            border: 1px solid #ccc;
            background: #eee;

        }
        .demo-topbar + #external-events { /* will get stripped out */
            top: 60px;
        }
        #external-events .fc-event {
            margin: 1em 0;
            cursor: move;
        }
        #calendar {
            max-width: 1400px;
            margin: 20px auto;
        }
        .add-button {
            position: absolute;
            top: 1px;
            right: 230px;
            background: #2C3E50;
            border: 0;
            color: white;
            height: 35px;
            border-radius: 3px;
            width: 157px;
        }
        .event-icon {
            width: 24px;
        }
    </style> --%>
</head>
<body>
<%
    if (session.getAttribute(SessionConstants.LOGIN_USER) == null) {
        out.println("<script>alert('로그인을 먼저 해 주세요!');</script>");
        out.println("<script>location.href='login'</script>");
    }
%>
<%--<div id='wrap'>
    <div id='external-events'>
        <h4>장 상태</h4>
        <div id='external-events-list'>
            <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
                <div class='fc-event-bm'>오늘의 장 상태</div>
            </div>
            <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
                <div class='fc-event-diet'>오늘의 식단</div>
            </div>
        </div>
    </div>
</div>--%>
<%
    out.println("<h1>" + request.getAttribute("user_id") + "님의 달력입니다.</h1>");
%>
<div id='calendar-wrap'>
    <div id='calendar'></div>
</div>
<div id="go-to-condition-bm">
    <a href="bm">
        <button type="button">장 상태 통계창</button>
    </a>
</div>
<div id="go-to-condition-diet">
    <a href="diet">
        <button type="button">식단 상태 통계창</button>
    </a>
</div>
<div id="logout">
    <form action = "logout.do">
        <button type="submit">로그아웃</button>
    </form>
</div>
</body>
</html>
