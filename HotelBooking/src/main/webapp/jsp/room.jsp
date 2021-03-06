
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="includes/header_1.jsp"/>
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-light-grey w3-collapse w3-top" style="z-index:3;width:300px;padding-top: 50px" id="mySidebar">
    <div class="w3-container w3-display-container w3-padding-16">
        <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-transparent w3-display-topright"></i>
        <h3>${room.roomType.typeName}</h3>
        <fmt:formatNumber var="roundedNumber" value="${room.price}" type="number" pattern="###,###" />
        <h3>Price : <c:out value="${roundedNumber}"/> VND</h3>
        <h6>per night</h6>
        <br>
        <br/>
        <form action="${pageContext.request.contextPath}/availableRoom" target="_blank" >
                <p><label><i class="fa fa-calendar-check-o"></i> Check In</label></p>
                <input class="w3-input w3-border" type="date" placeholder="DD MM YYYY" name="startDate" required>          
                <p><label><i class="fa fa-calendar-o"></i> Check Out</label></p>
                <input class="w3-input w3-border" type="date" placeholder="DD MM YYYY" name="endDate" required>         
                <!--
                <p><label><i class="fa fa-male"></i> Adults</label></p>
                <input class="w3-input w3-border" type="number" value="1" name="Adults" min="1" max="6">              
                <p><label><i class="fa fa-child"></i> Kids</label></p>
                <input class="w3-input w3-border" type="number" value="0" name="Kids" min="0" max="6">
                -->
                <p><button class="w3-button w3-block w3-red w3-left-align" type="submit"><i class="fa fa-search w3-margin-right"></i> Search availability</button></p>
            </form>
    </div>
    <div class="w3-bar-block">
        <a href="#apartment" class="w3-bar-item w3-button w3-padding-16"><i class="fa fa-building"></i> Apartment</a>
        <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-16" onclick="document.getElementById('subscribe').style.display = 'block'"><i class="fa fa-rss"></i> Subscribe</a>
        <a href="#contact" class="w3-bar-item w3-button w3-padding-16"><i class="fa fa-envelope"></i> Contact</a>
    </div>
</nav>

<!-- Top menu on small screens -->
<header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge" style="padding-top: 50px">
    <span class="w3-bar-item">Rental</span>
    <a href="javascript:void(0)" class="w3-right w3-bar-item w3-button" onclick="w3_open()"><i class="fa fa-bars"></i></a>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main w3-white" style="margin-left:300px;">
    <div style="padding-top: 50px">
        <h1 class="w3-tangerine" style="text-align: center;font-size: 4em">
            ${room.roomType.typeName}</h1>
    </div>
    <div class="container" style="margin-top: 80px;width: 100%;height: 300px">
        <br>

        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->

            <ol class="carousel-indicators">

                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
                <li data-target="#myCarousel" data-slide-to="4"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                        <img src="${pageContext.request.contextPath}/images/${room.images}" alt="classic1" style="width: 100%;height: 450px">
                    </div>
                <c:forEach var="image" items="${imageArray}">
                    <div class="item ">
                        <img src="${pageContext.request.contextPath}/images/${image}" alt="classic1" style="width: 100%;height: 450px">
                    </div>
                </c:forEach>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>

        </div>
    </div>

    <!-- Push down content on small screens -->
    <div class="w3-hide-large" style="margin-top:80px"></div>

    <!-- Slideshow Header -->
    

    <div id="rooms" class="w3-container" style="margin-top: 200px;padding-top: 50px">
        <h4><strong>The space</strong></h4>
        <div class="w3-row w3-large">
            <div class="w3-col s6">
                <p><i class="fa fa-fw fa-male"></i> Max people: ${room.roomType.numberOfPerson}</p>
                <p><i class="fa fa-fw fa-bath"></i> Bathrooms: 1</p>
                <p><i class="fa fa-fw fa-bed"></i> Bedrooms: 2</p>
            </div>
            <div class="w3-col s6">
                <p><i class="fa fa-fw fa-clock-o"></i> Check In: After 3PM</p>
                <p><i class="fa fa-fw fa-clock-o"></i> Check Out: 12PM</p>
            </div>
        </div>
        <hr>

        <h4><strong>Amenities</strong></h4>
        <div class="w3-row w3-large">
            <div class="w3-col s6">
                <p><i class="fa fa-fw fa-shower"></i> Shower</p>
                <p><i class="fa fa-fw fa-wifi"></i> WiFi</p>
                <p><i class="fa fa-fw fa-tv"></i> TV</p>
            </div>
            <div class="w3-col s6">
                <p><i class="fa fa-fw fa-cutlery"></i> Kitchen</p>
                <p><i class="fa fa-fw fa-thermometer"></i> Heating</p>
                <p><i class="fa fa-fw fa-wheelchair"></i> Accessible</p>
            </div>
        </div>
        <hr>

        <h4><strong>Extra Info</strong></h4>
        <p>Our apartment is really clean and we like to keep it that way. Enjoy the lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        <p>We accept: <i class="fa fa-credit-card w3-large"></i> <i class="fa fa-cc-mastercard w3-large"></i> <i class="fa fa-cc-amex w3-large"></i> <i class="fa fa-cc-cc-visa w3-large"></i><i class="fa fa-cc-paypal w3-large"></i></p>
        <hr>

        <h4><strong>Description</strong></h4>
        <p>${room.roomType.description}</p>
        </div>
    <hr>
    <div id="about" class="container-fluid" style="padding-top:60px">
        <div class="w3-col l4 m7">
            <h3><strong>About</strong></h3>
            <h6>Our hotel is one of a kind. It is truely amazing. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</h6>
            <p>We accept: <i class="fa fa-credit-card w3-large"></i> <i class="fa fa-cc-mastercard w3-large"></i> <i class="fa fa-cc-amex w3-large"></i> <i class="fa fa-cc-cc-visa w3-large"></i><i class="fa fa-cc-paypal w3-large"></i></p>
        </div>
        <div class="w3-col l8 m5">
            <div >
                <iframe style="width:100%;height:400px;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6632.248000703498!2d151.265683!3d-33.7832959!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6b12abc7edcbeb07%3A0x5017d681632bfc0!2sManly+Vale+NSW+2093%2C+Australia!5e0!3m2!1sen!2sin!4v1433329298259" style="border:0"></iframe>
            </div>
        </div>
    </div>
    <hr>
    <!-- Contact -->
    <div class="w3-container" id="contact">
        <h2><strong>Contact</strong></h2>
        <i class="fa fa-map-marker" style="width:30px"></i> Chicago, US<br>
        <i class="fa fa-phone" style="width:30px"></i> Phone: +00 151515<br>
        <i class="fa fa-envelope" style="width:30px"> </i> Email: mail@mail.com<br>
        <p>Questions? Go ahead, ask them:</p>
        <form action="/action_page.php" target="_blank">
            <p><input class="w3-input w3-border" type="text" placeholder="Name" required name="Name"></p>
            <p><input class="w3-input w3-border" type="text" placeholder="Email" required name="Email"></p>
            <p><input class="w3-input w3-border" type="text" placeholder="Message" required name="Message"></p>
            <button type="submit" class="w3-button w3-green w3-third">Send a Message</button>
        </form>
    </div>

    <footer class="w3-container w3-padding-16" style="margin-top:32px">Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-green">w3.css</a></footer>

    <!-- End page content -->
</div>

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

</body>
</html>

