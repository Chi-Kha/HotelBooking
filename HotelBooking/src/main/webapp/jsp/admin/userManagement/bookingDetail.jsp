
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
        <h3><a href="${pageContext.request.contextPath}/admin/addBookingDetail">Add Booking Detail</a></h3>
        <h3><a href="${pageContext.request.contextPath}/admin">Back To Admin Page</a></h1>
        <br><br>
        <c:if test="${not empty bookingDetailList}">
            <table>
                <thead>
                    <tr>
                        <th>Booking Detail ID</th>
                        <th>Booking Code</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Room Name</th>
                        <th>Status</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="bookingDetail" items="${bookingDetailList}">
                        <tr>
                            <td>${bookingDetail.bookingDetailID}</td>
                            <td>${bookingDetail.bookingInfo.bookingCode}</td>
                            <td>${bookingDetail.startDate}</td>
                            <td>${bookingDetail.endDate}</td>
                            <td>${bookingDetail.room.roomName}</td>
                            <td>${bookingDetail.status}</td>
                            <td><a href="${pageContext.request.contextPath}/admin/editBookingDetail/${bookingDetail.bookingDetailID}">Edit</a></td>
                            <td><a href="${pageContext.request.contextPath}/admin/deleteBookingDetail/${bookingDetail.bookingDetailID}">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${bookingDetailList.size()==0}">
            <c:out value="There is no data" />
        </c:if>
    </body>
</html>
