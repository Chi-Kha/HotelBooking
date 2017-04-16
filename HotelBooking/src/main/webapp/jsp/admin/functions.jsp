<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Function List</h1>
        
        <h3><a href="${pageContext.request.contextPath}/admin/addRoomType">Add new Room Type</a></h3>
        <h3><a href="${pageContext.request.contextPath}/admin/roomType">View Room Type</a></h3>
        <p>----------</p>
        <h3><a href="${pageContext.request.contextPath}/admin/addRoom">Add new Room</a></h3>
        <h3><a href="${pageContext.request.contextPath}/admin/room">View Room</a></h3>
        <p>----------</p>
        <h3><a href="${pageContext.request.contextPath}/admin/addRoomService">Add Room Service</a></h3>
        <h3><a href="${pageContext.request.contextPath}/admin/roomService">View Room Service</a></h3>
        <p>----------</p>
        <h3><a href="${pageContext.request.contextPath}/admin/addPromotion">Add Promotion</a></h3>
        <h3><a href="${pageContext.request.contextPath}/admin/promotion">View Promotion</a></h3>
    </body>
</html>
