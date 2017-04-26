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

        <mvc:form action="${pageContext.request.contextPath}/admin/${action}" modelAttribute="booking" method="post">
            <table>
                <c:if test="${action=='updateBooking'}">
                    <tr>
                        <td>ID: (*)</td>
                        <td><mvc:input path="bookingID" type="text" readonly="${readonly}"/></td>
                    </tr>
                </c:if>
                <tr>
                    <td>Booking Code: (*)</td>
                    <td><mvc:input path="bookingCode" type="text" required="true"/></td>
                </tr>
                <tr>
                    <td>Customer Name: </td>
                    <td><mvc:input path="custName" type="text" required="true"/></td>
                </tr>
                <tr>
                    <td>Customer Email: </td>
                    <td><mvc:input path="custEmail" type="text" required="true"/></td>
                </tr>
                <tr>
                    <td>Customer Phone: </td>
                    <td><mvc:input path="custPhone" type="text" required="true"/></td>
                </tr>
                <tr>
                    <td>Status: (*) </td>
                    <td>
                        <mvc:select path="status">
                            <mvc:option value="0">Off</mvc:option>
                            <mvc:option value="1">On</mvc:option>
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

