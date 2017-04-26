
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Promotion Page</title>
    </head>
    <body>
        <h1>Hotel Booking System </h1>
        <h3><a href="${pageContext.request.contextPath}/admin/addPromotion">Add Promotion</a></h3>
        <h3><a href="${pageContext.request.contextPath}/admin">Back To Admin Page</a></h1>
        <br><br>
        <c:if test="${not empty promotionList}">
            <table>
                <thead>
                    <tr>
                        <th>Promotion ID</th>
                        <th>Description</th>
                        <th>Images</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="promotion" items="${promotionList}">
                        <tr>
                            <td>${promotion.promotionID}</td>
                            <td>${promotion.description}</td>
                            <td>${promotion.images}</td>
                            <td><a href="${pageContext.request.contextPath}/admin/editPromotion/${promotion.promotionID}">Edit</a></td>
                            <td><a href="${pageContext.request.contextPath}/admin/deletePromotion/${promotion.promotionID}">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${promotionList.size()==0}">
            <c:out value="There is no data" />
        </c:if>
    </body>
</html>
