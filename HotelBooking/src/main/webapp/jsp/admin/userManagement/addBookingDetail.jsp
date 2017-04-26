<%-- 
    Document   : book
    Created on : Mar 23, 2017, 3:49:27 PM
    Author     : test
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Booking Info Page</title>
    </head>
    <body>
        <h1>${action}</h1>

        <mvc:form action="${pageContext.request.contextPath}/admin/${action}" modelAttribute="bookingDetail" method="post">
            <table>
                <c:if test="${action=='updateBookingDetail'}">
                    <tr>
                        <td>ID: (*)</td>
                        <td><mvc:input path="bookingDetailID" type="text" readonly="${readonly}"/></td>
                    </tr>
                </c:if>
                <tr>
                    <td>Booking Info: </td>
                    <td>
                        <mvc:select path="bookingInfo.bookingID">
                            <c:forEach var="booking" items="${bookingList}" >
                                <mvc:option value="${booking.bookingID}">${booking.bookingID}-${booking.bookingCode}</mvc:option>
                            </c:forEach>
                        </mvc:select>
                    </td>
                </tr>
                <tr>
                    <td>Start Date: </td>
                    <td><mvc:input path="startDate" type="date" required="true"/></td>
                </tr>    
                <tr>
                    <td>End Date: </td>
                    <td><mvc:input path="endDate" type="date" required="true"/></td>
                </tr>    
                <tr>
                    <td>Room: </td>
                    <td>
                        <mvc:select path="room.roomID">
                            <c:forEach var="room" items="${roomList}" >
                                <mvc:option value="${room.roomID}">${room.roomName}</mvc:option>
                            </c:forEach>
                        </mvc:select>
                    </td>
                </tr> 
                <tr>
                    <td>Status: (*) </td>
                    <td>
                        <mvc:select path="status">
                            <mvc:option value="false">Off</mvc:option>
                            <mvc:option value="true">On</mvc:option>
                        </mvc:select>
                    </td>
                </tr> 
                <tr>
                    <td colspan="2">
                        <input type="submit" value="submit" />
                    </td>
                </tr>
            </table>
        </mvc:form>
    </body>
</html>

