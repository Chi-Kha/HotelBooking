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
        <title>Add Room Page</title>
    </head>
    <body>
        <h1>${action}</h1>

        <mvc:form action="${pageContext.request.contextPath}/admin/${action}" modelAttribute="room" method="post">
            <table>
                <c:if test="${action=='updateRoom'}">
                    <tr>
                        <td>ID: (*)</td>
                        <td><mvc:input path="roomID" type="text" readonly="${readonly}"/></td>
                    </tr>
                </c:if>
                <tr>
                    <td>Room Name: (*)</td>
                    <td><mvc:input path="roomName" type="text" required="true"/></td>
                </tr>
                <tr>
                    <td>Room Type: </td>
                    <td>
                        <mvc:select path="roomType.roomTypeID">
                            <c:forEach var="roomType" items="${roomTypeList}" >
                                <mvc:option value="${roomType.roomTypeID}">${roomType.typeName}</mvc:option>
                            </c:forEach>
                        </mvc:select>
                    </td>
                </tr>
                <tr>
                    <td>Status: (*) </td>
                    <td>
                        <mvc:select path="status">
                            <mvc:option value="0">Available</mvc:option>
                            <mvc:option value="1">Not Available</mvc:option>
                        </mvc:select>
                    </td>
                </tr>
                <tr>
                    <td>Prices: (*) </td>
                    <td><mvc:input path="price" type="text" required="true"/></td>
                </tr>
                <tr>
                    <td>Images: (*) </td>
                    <td><mvc:input path="images" type="text" required="true"/></td>
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

