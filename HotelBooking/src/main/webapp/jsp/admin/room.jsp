
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
        <h3><a href="${pageContext.request.contextPath}/admin/addRoom">Add new Room</a></h3>
        <h3><a href="${pageContext.request.contextPath}/admin">Back To Admin Page</a></h1>
        <br><br>
        <c:if test="${not empty roomList}">
            <table>
                <thead>
                    <tr>
                        <th>Room ID</th>
                        <th>Name</th>
                        <th>Type</th>
                        <th>Price</th>
                        <th>Status</th>
                        <th>Image</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="room" items="${roomList}">
                        <tr>
                            <td>${room.roomID}</td>
                            <td>${room.roomName}</td>
                            <td>${room.roomType.typeName}</td>
                            <td>${room.price}</td>
                            <c:if test="${room.status==false}">
                                <td>Not Available</td>    
                            </c:if>
                            <c:if test="${room.status==true}">
                                <td>Available</td>    
                            </c:if>
                            <td>${room.images}</td>
                            <td><a href="${pageContext.request.contextPath}/admin/editRoom/${room.roomID}">Edit</a></td>
                            <td><a href="${pageContext.request.contextPath}/admin/deleteRoom/${room.roomID}">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${roomList.size()==0}">
            <c:out value="There is no data" />
        </c:if>
    </body>
</html>
