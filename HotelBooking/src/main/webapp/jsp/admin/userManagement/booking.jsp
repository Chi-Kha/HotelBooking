
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
        <h3><a href="${pageContext.request.contextPath}/admin/addBooking">Add Booking Info</a></h3>
        <h3><a href="${pageContext.request.contextPath}/admin">Back To Admin Page</a></h1>
        <br><br>
        <c:if test="${not empty bookingList}">
            <table>
                <thead>
                    <tr>
                        <th>Booking Info ID</th>
                        <th>Booking Code</th>
                        <th>Customer Name</th>
                        <th>Customer Email</th>
                        <th>Customer Phone</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="booking" items="${bookingList}">
                        <tr>
                            <td>${booking.bookingID}</td>
                            <td>${booking.bookingCode}</td>
                            <td>${booking.custName}</td>
                            <td>${booking.custEmail}</td>
                            <td>${booking.custPhone}</td>
                            <td><a href="${pageContext.request.contextPath}/admin/editBooking/${booking.bookingID}">Edit</a></td>
                            <td><a href="${pageContext.request.contextPath}/admin/deleteRoom/${booking.bookingID}">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${bookingList.size()==0}">
            <c:out value="There is no data" />
        </c:if>
    </body>
</html>
