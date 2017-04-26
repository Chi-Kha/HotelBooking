
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="includes/header_2.jsp"/>
<div class="container">
    <h2>Booking room</h2>
    <mvc:form action="${action}" method="post" modelAttribute="bookingInfo">
        <div >
            <h2>Check Out</h2>
            <mvc:input path="bookingID" type="hidden"/>
            <label >Booking Code : 
                <span style="color: red">(*)</span></label>
            <mvc:input path="bookingCode" type="text" value="${bookingCode}"/><br>

            <label>Name : 
                <span style="color: red">(*)</span></label>
            <mvc:input path="custName" type="text"/><br>

            <label>Email : 
                <span style="color: red">(*)</span></label>
            <mvc:input path="custEmail" type="text"/><br>

            <label>Phone : 
                <span style="color: red">(*)</span></label>
            <mvc:input path="custPhone" type="tel"/><br>

            <input type="submit" value="Check Out" style="margin: 1em 0 0 26em;
                   height: 3em; width: 7em; background-color: #C0001C;color: white;">
        </div>
        <style>
            label{
                width: 10em;
                float: left;
                text-align: right;
            }
            h2{text-align: center}
        </style>
    </mvc:form>
    <c:set var="num" value="${0}"/>
    <c:if test="${bookingDetail!=null}"> 
        <table>
            <tr>
                <th>STT</th>
                <th>Images</th>
                <th>Room Type</th>
                <th>Price</th>
                <th>Into money</th>
                <th>Check In</th>
                <th>Check Out</th>
                <th>Delete Booking</th>
            </tr>

            <c:forEach var="bookingDetail" items="${bookingDetail}"> 
                <tr>
                    <c:set var="num" value="${num+1}"/>
                    <td><c:out value="${num}"/></td>
                    <td>
                        <img src="${pageContext.request.contextPath}/images/${bookingDetail.room.images}"
                             style="width: 70px;height: 50px"/>
                    </td>
                    <td>Room ${bookingDetail.room.roomName}</td>
                    <fmt:formatNumber var="roundedNumber" value="${bookingDetail.room.price}" type="number" pattern="###,###" />
                    <td><c:out value="${roundedNumber}"/> VND </td>
                    <td><c:out value="${roundedNumber}"/> VND </td>
                    <td>${bookingDetail.startDate}</td>
                    <td>${bookingDetail.endDate}
                    <td><button /></td>
                </tr>    
            </c:forEach>  
            <tr>
                <td></td>
            </tr>
        </table>
        <style>
            table{

            }
        </style>
    </c:if>

    <c:set var="totalPrice" value="${0}" />
    <c:if test="${bookingDetail!=null}"> 
        <c:forEach var="bookingDetail" items="${bookingDetail}"> 

            <c:set var="totalPrice" value="${totalPrice + bookingDetail.room.price}"/>
        </c:forEach>    
        <fmt:formatNumber var="roundedNumber" value="${totalPrice}" type="number" pattern="###,###" />
        <h4>Total Price : <c:out value="${roundedNumber}"/> VND</h4>
    </c:if>

</div>

<jsp:include page="includes/footer.jsp"/>       
</body>
</html>
