
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
        <h3><a href="${pageContext.request.contextPath}/admin/addRoomType">Add new Room Type</a></h3>
        <h3><a href="${pageContext.request.contextPath}/admin">Back To Admin Page</a></h1>
        <br><br>
        <c:if test="${not empty roomTypeList}">
            <table>
                <thead>
                    <tr>
                        <th>Room Type ID</th>
                        <th>Name</th>
                        <th>Persons</th>
                        <th>description</th>
                        <th>Image</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="roomType" items="${roomTypeList}">
                        <tr>
                            <td>${roomType.roomTypeID}</td>
                            <td>${roomType.typeName}</td>
                            <td>${roomType.numberOfPerson}</td>
                            <td>${roomType.description}</td>
                            <td>${roomType.images}</td>
                            <td><a href="edit/${roomType.roomTypeID}">Edit</a></td>
                            <td><a href="delete/${roomType.roomTypeID}">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${roomTypeList.size()==0}">
            <c:out value="There is no data" />
        </c:if>
    </body>
</html>
