<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<%--%>
<%--    request.setCharacterEncoding("utf-8");--%>
<%--    String sessionId = (String)(session.getAttribute("id"));--%>
<%--    String sessionNm = (String)(session.getAttribute("nm"));--%>

<%--    System.out.println(sessionId);--%>

<%--    if(sessionId == null || sessionId.equals("null")){--%>
<%--        //out.println("<script>alert('로그인 해주세요');location.href='login.jsp';</script>");--%>
<%--        response.sendRedirect("login.jsp");--%>
<%--    }--%>
<%--%>--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8' />
        <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
        <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
        <!-- jquery CDN -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- fullcalendar CDN -->
        <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
        <link href='${pageContext.request.contextPath}/css/calStyle.css' rel='stylesheet' />
        <script src='${pageContext.request.contextPath}/js/calender.js'></script>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

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
                    left: ' today',
                    center: 'prev,title,next',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
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
    </style>
</head>
<body>

<div id='wrap'>

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

    </div>

    <div id='calendar-wrap'>
        <div id='calendar'></div>
    </div>

</div>

</body>
</html>
