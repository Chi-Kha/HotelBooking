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
        <title>Add Room Type Page</title>
    </head>
    <body>
        <h1>${action}</h1>
        
        <mvc:form action="${pageContext.request.contextPath}/admin/${action}" modelAttribute="roomType" method="post">
            <table>
                <c:if test="${action=='updateRoomType'}">
                    <tr>
                        <td>ID: (*)</td>
                        <td><mvc:input path="roomTypeID" type="text" readonly="${readonly}"/></td>
                    </tr>
                </c:if>
                <tr>
                    <td>Type Name: (*)</td>
                    <td><mvc:input path="typeName" type="text" required="true"/></td>
                </tr>
                <tr>
                    <td>Number of Person: (*)</td>
                    <td><mvc:input path="numberOfPerson" type="number" required="true"/></td>
                </tr>
                <tr>
                    <td>Description: (*) </td>
                    <td><mvc:input path="description" type="text" required="true"/></td>
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

