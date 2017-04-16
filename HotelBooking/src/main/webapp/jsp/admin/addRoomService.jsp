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
        <title>Add Room Service Page</title>
    </head>
    <body>
        <h1>${action}</h1>

        <mvc:form action="${pageContext.request.contextPath}/admin/${action}" modelAttribute="roomService" method="post">
            <table>
                <tr>

                <tr>
                    <td>Room ID:</td>
                    <c:if test="${action=='addRoomService'}">
                        <td>
                            <mvc:select path="roomID">
                                <c:forEach var="room" items="${roomList}" >
                                    <mvc:option value="${room.roomID}">${room.roomName}</mvc:option>
                                </c:forEach>
                            </mvc:select>
                        </td>
                    </c:if>
                    <c:if test="${action=='updateRoomService'}">
                        <td><mvc:input path="roomID" type="text" readonly="${readonly}"/></td>
                    </c:if>
                </tr>


            </tr>
            <tr>
                <td>Coffee: (*)</td>
                <td>
                    <mvc:select path="coffee">
                        <mvc:option value="0">Not Available</mvc:option>
                        <mvc:option value="1">Available</mvc:option>
                    </mvc:select>
                </td>
            </tr>
            <tr>
                <td>Breakfast (*) </td>
                <td>
                    <mvc:select path="breakfast">
                        <mvc:option value="0">Not Available</mvc:option>
                        <mvc:option value="1">Available</mvc:option>
                    </mvc:select>
                </td>
            </tr>
            <tr>
                <td>Massage (*) </td>
                <td>
                    <mvc:select path="massage">
                        <mvc:option value="0">Not Available</mvc:option>
                        <mvc:option value="1">Available</mvc:option>
                    </mvc:select>
                </td>
            </tr>
            <tr>
                <td>Bicycle (*) </td>
                <td>
                    <mvc:select path="bicycle">
                        <mvc:option value="0">Not Available</mvc:option>
                        <mvc:option value="1">Available</mvc:option>
                    </mvc:select>
                </td>
            </tr>
            <tr>
                <td>Swimming Pool (*) </td>
                <td>
                    <mvc:select path="swimmingPool">
                        <mvc:option value="0">Not Available</mvc:option>
                        <mvc:option value="1">Available</mvc:option>
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

