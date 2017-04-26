<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="includes/header.jsp"/>

<!-- Header -->
<header class="w3-display-container w3-content" style="max-width:1500px;">
    
    <img src="${pageContext.request.contextPath}/images/banner3.jpg" alt=""/>
    <div class="w3-display-left w3-padding w3-col l6 m8">
        <div class="w3-container w3-red">
            <h1 class="w3-tangerine"><i class="fa fa-bed w3-margin-right"></i>SunLight Hotel</h1>
        </div>
        <div class="w3-container w3-white w3-padding-16">
            <form action="availableRoom">
                <div class="w3-row-padding" style="margin:0 -16px;">
                    
                    <div class="w3-half w3-margin-bottom">
                        <label><i class="fa fa-calendar-o"></i> Check In</label>
                        <input class="w3-input w3-border" type="date" name="startDate">
                    </div>
                    <div class="w3-half">
                        <label><i class="fa fa-calendar-o"></i> Check Out</label>
                        <input class="w3-input w3-border" type="date" name="endDate">
                    </div>
                </div>
                <!--
                <div class="w3-row-padding" style="margin:8px -16px;">
                    <div class="w3-half w3-margin-bottom">
                        <label><i class="fa fa-male"></i> Promotion Code</label>
                        <input class="w3-input w3-border" type="text" name="promotionCode">
                    </div>
                </div>
                -->
                <button class="w3-button w3-dark-grey" type="submit">
                    <i class="fa fa-search w3-margin-right"></i> 
                    Search availability
                </button>
            </form>
        </div>
    </div>
</header>

<!-- Page content -->

<div id="rooms" class="container-fluid" style="padding-top:50px">
        <h3>Rooms</h3>
        <p>Make yourself at home is our slogan. We offer the best beds in the industry. Sleep well and rest well.</p>
    </div>
<form action="availableRoom">
    <div class="w3-row-padding">
        <div class="w3-col m3">
            <label><i class="fa fa-calendar-o"></i> Check In</label>
            <input class="w3-input w3-border" type="date" placeholder="DD MM YYYY" name="startDate">
        </div>
        <div class="w3-col m3">
            <label><i class="fa fa-calendar-o"></i> Check Out</label>
            <input class="w3-input w3-border" type="date" placeholder="DD MM YYYY" name="endDate">
        </div>
        <!--<div class="w3-col m2">
            <label><i class="fa fa-male"></i> Adults</label>
            <input class="w3-input w3-border" type="number" placeholder="1">
        </div>
        <div class="w3-col m2">
            <label><i class="fa fa-child"></i> Kids</label>
            <input class="w3-input w3-border" type="number" placeholder="0">
        </div>-->
        <div class="w3-col m2">
            <label><i class="fa fa-search"></i> Search</label>
            <button class="w3-button w3-block w3-black" type="submit">Search</button>
        </div>
    </div>
</form>
    <div class="w3-row-padding w3-padding-16">
        <c:forEach var="room" items="${roomList}">
        <div class="w3-third w3-margin-bottom">
            <img src="images/${room.images}" alt="Norway" style="width:100%; height: 300px">
            <div class="w3-container w3-white">
                <h3>${room.roomName}</h3>
                <fmt:formatNumber var="roundedNumber" value="${room.price}" type="number" pattern="###,###" />
                <h6 class="w3-opacity">Price : <c:out value="${roundedNumber}"/> VND</h6>
                <p>Single bed</p>
                <p>15m<sup>2</sup></p>
                <p class="w3-large"><i class="fa fa-bath"></i> <i class="fa fa-phone"></i> <i class="fa fa-wifi"></i></p>
                <a href="room/${room.roomID}" style="color: white">
                    <button class="w3-button w3-block w3-black w3-margin-bottom">
                        Choose Room
                    </button>
                </a>
            </div>
        </div>
        </c:forEach>
    </div>

    <div id="about" class="container-fluid" style="padding-top:50px">
        <div class="w3-col l4 m7">
            <h3>About</h3>
            <h6>Our hotel is one of a kind. It is truely amazing. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</h6>
            <p>We accept: <i class="fa fa-credit-card w3-large"></i> <i class="fa fa-cc-mastercard w3-large"></i> <i class="fa fa-cc-amex w3-large"></i> <i class="fa fa-cc-cc-visa w3-large"></i><i class="fa fa-cc-paypal w3-large"></i></p>
        </div>
        <div class="w3-col l8 m5">
            <div >
                <iframe style="width:100%;height:400px;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6632.248000703498!2d151.265683!3d-33.7832959!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6b12abc7edcbeb07%3A0x5017d681632bfc0!2sManly+Vale+NSW+2093%2C+Australia!5e0!3m2!1sen!2sin!4v1433329298259" style="border:0"></iframe>
            </div>
        </div>
    </div>

    <div class="w3-row w3-large w3-center" style="margin:32px 0">
        <div class="w3-third"><i class="fa fa-map-marker w3-text-red"></i> 423 Some adr, Chicago, US</div>
        <div class="w3-third"><i class="fa fa-phone w3-text-red"></i> Phone: +00 151515</div>
        <div class="w3-third"><i class="fa fa-envelope w3-text-red"></i> Email: mail@mail.com</div>
    </div>

    <div class="w3-panel w3-red w3-leftbar w3-padding-32">
        <h6><i class="fa fa-info w3-deep-orange w3-padding w3-margin-right"></i> On demand, we can offer playstation, babycall, children care, dog equipment, etc.</h6>
    </div>

    <div class="w3-container w3-padding-32 w3-black w3-opacity w3-card-2 w3-hover-opacity-off" style="margin:32px 0;">
        <h2>Get the best offers first!</h2>
        <p>Join our newsletter.</p>
        <label>E-mail</label>
        <input class="w3-input w3-border" type="text" placeholder="Your Email address">
        <button type="button" class="w3-button w3-red w3-margin-top">Subscribe</button>
    </div>

    <div id="contact" class="container-fluid" style="padding-top:50px">
        <h2>Contact</h2>
        <p>If you have any questions, do not hesitate to ask them.</p>
        <i class="fa fa-map-marker w3-text-red" style="width:30px"></i> Chicago, US<br>
        <i class="fa fa-phone w3-text-red" style="width:30px"></i> Phone: +00 151515<br>
        <i class="fa fa-envelope w3-text-red" style="width:30px"> </i> Email: mail@mail.com<br>
        <form action="/action_page.php" target="_blank">
            <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Name" required name="Name"></p>
            <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Email" required name="Email"></p>
            <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Message" required name="Message"></p>
            <p><button class="w3-button w3-black w3-padding-large" type="submit">SEND MESSAGE</button></p>
        </form>
    </div>
<!-- Subscribe Modal -->

    <!-- End page content -->
<jsp:include page="includes/footer.jsp"/>
<!-- Add Google Maps -->

<script>
$(document).ready(function(){
  // Add scrollspy to <body>
  $('body').scrollspy({target: ".navbar", offset: 50});   

  // Add smooth scrolling on all links inside the navbar
  $("#myNavbar a").on('click', function(event) {
    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 800, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    }  // End if
  });
});
</script>

<!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->


</body>
</html>

