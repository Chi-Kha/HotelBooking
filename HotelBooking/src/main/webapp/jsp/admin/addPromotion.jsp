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
        <title>Add Promotion Page</title>
    </head>
    <body>
        <h1>${action}</h1>

        <mvc:form action="${pageContext.request.contextPath}/admin/${action}" modelAttribute="promotion" method="post">
            <table>
                <c:if test="${action=='updatePromotion'}">
                    <tr>
                        <td>Promotion ID: (*)</td>
                        <td><mvc:input path="promotionID" type="text" readonly="${readonly}"/></td>
                    </tr>
                </c:if>
                <tr>
                    <td>Description: (*)</td>
                    <td><mvc:input path="description" type="text" required="true"/></td>
                </tr>
                <tr>
                    <td>Images: (*)</td>
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

