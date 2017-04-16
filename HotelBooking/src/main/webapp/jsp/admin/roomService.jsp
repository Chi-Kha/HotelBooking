
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Room Type Page</title>
    </head>
    <body>
        <h1>Hotel Booking System </h1>
        <h3><a href="${pageContext.request.contextPath}/admin/addRoomService">Add Room Service</a></h3>
        <h3><a href="${pageContext.request.contextPath}/admin">Back To Admin Page</a></h1>
        <br><br>
        <c:if test="${not empty roomServiceList}">
            <table>
                <thead>
                    <tr>
                        <th>Room ID</th>
                        <th>Coffee</th>
                        <th>Breakfast</th>
                        <th>Massage</th>
                        <th>Bicycle</th>
                        <th>Swimming Pool</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="roomService" items="${roomServiceList}">
                        <tr>
                            <td>${roomService.roomID}</td>
                            <td>${roomService.coffee}</td>
                            <td>${roomService.breakfast}</td>
                            <td>${roomService.massage}</td>
                            <td>${roomService.bicycle}</td>
                            <td>${roomService.swimmingPool}</td>
                            <td><a href="${pageContext.request.contextPath}/admin/editRoomService/${roomService.roomID}">Edit</a></td>
                            <td><a href="${pageContext.request.contextPath}/admin/deleteRoomService/${roomService.roomID}">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${roomServiceList.size()==0}">
            <c:out value="There is no data" />
        </c:if>
    </body>
</html>
