<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="includes/header.jsp"/>
<div class="col-sm-12">
    <nav class="w3-sidebar w3-light-grey w3-collapse w3-top" style="z-index:3;width:240px;padding-top: 50px" id="mySidebar">
        <div class="w3-container w3-display-container w3-padding-16">
            <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-transparent w3-display-topright"></i>
            <h3>Rental</h3>
            <h3>from $99</h3>
            <h6>per night</h6>
            <hr>
            <form action="/action_page.jsp" target="_blank">
                <p><label><i class="fa fa-calendar-check-o"></i> Check In</label></p>
                <input class="w3-input w3-border" type="text" placeholder="DD MM YYYY" name="CheckIn" required>          
                <p><label><i class="fa fa-calendar-o"></i> Check Out</label></p>
                <input class="w3-input w3-border" type="text" placeholder="DD MM YYYY" name="CheckOut" required>         
                <p><label><i class="fa fa-male"></i> Adults</label></p>
                <input class="w3-input w3-border" type="number" value="1" name="Adults" min="1" max="6">              
                <p><label><i class="fa fa-child"></i> Kids</label></p>
                <input class="w3-input w3-border" type="number" value="0" name="Kids" min="0" max="6">
                <p><button class="w3-button w3-block w3-green w3-left-align" type="submit"><i class="fa fa-search w3-margin-right"></i> Search availability</button></p>
            </form>
        </div>
        <div class="w3-bar-block">
            <a href="#apartment" class="w3-bar-item w3-button w3-padding-16"><i class="fa fa-building"></i> Apartment</a>
            <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-16" onclick="document.getElementById('subscribe').style.display = 'block'"><i class="fa fa-rss"></i> Subscribe</a>
            <a href="#contact" class="w3-bar-item w3-button w3-padding-16"><i class="fa fa-envelope"></i> Contact</a>
        </div>
    </nav>
</div>
<div class="w3-main w3-white" style="margin-left:260px;">
    <div style="padding-top: 50px">
        <h1 class="w3-tangerine" style="text-align: center;font-size: 4em">
            Room List</h1>
    </div>
    <c:forEach var="promotionDetail" items="${promotionDetailList}">
        <div class="w3-third w3-margin-bottom" style="margin-left: 25px;width: 330px">
            <img src="${pageContext.request.contextPath}/images/classicRoom.jpg" alt="Norway" style="width:100%; height: 300px;">
            <div class="w3-container w3-white">
                <h3>${promotionDetail.room.roomName}</h3>
                <h6 class="w3-opacity">
                    Start Date: ${promotionDetail.startDate}<br>
                    End Date: ${promotionDetail.endDate}
                </h6>
                <fmt:formatNumber var="roundNumber" value="${promotionDetail.promotion.discount * 100}" type="number" pattern="###.###" />
                <h6 class="w3-opacity">Discount: <c:out value="${roundNumber}" /> %</h6>
                <a href="${pageContext.request.contextPath}/promotion/${promotion.promotionID}" style="color: white">
                    <button class="w3-button w3-block w3-black w3-margin-bottom">
                        Book Room
                    </button>
                </a>
            </div>
        </div>
    </c:forEach>
</div>