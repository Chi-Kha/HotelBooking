
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="includes/header.jsp"/>

<!-- Header -->
<header class="w3-display-container w3-content" style="max-width:1500px;">
    <img src="Image/banner3.jpg" alt=""/>

    <div class="w3-display-left w3-padding w3-col l6 m8">
        <div class="w3-container w3-red">
            <h1 class="w3-tangerine"><i class="fa fa-bed w3-margin-right"></i>Hotel Name</h1>
        </div>
        <div class="w3-container w3-white w3-padding-16">
            <form action="/action_page.php" target="_blank">
                <div class="w3-row-padding" style="margin:0 -16px;">
                    <div class="w3-half w3-margin-bottom">
                        <label><i class="fa fa-calendar-o"></i> Check In</label>
                        <input class="w3-input w3-border" type="text" placeholder="DD MM YYYY" name="CheckIn" required>
                    </div>
                    <div class="w3-half">
                        <label><i class="fa fa-calendar-o"></i> Check Out</label>
                        <input class="w3-input w3-border" type="text" placeholder="DD MM YYYY" name="CheckOut" required>
                    </div>
                </div>
                <div class="w3-row-padding" style="margin:8px -16px;">
                    <div class="w3-half w3-margin-bottom">
                        <label><i class="fa fa-male"></i> Adults</label>
                        <input class="w3-input w3-border" type="number" value="1" name="Adults" min="1" max="6">
                    </div>
                    <div class="w3-half">
                        <label><i class="fa fa-child"></i> Kids</label>
                        <input class="w3-input w3-border" type="number" value="0" name="Kids" min="0" max="6">
                    </div>
                </div>
                <button class="w3-button w3-dark-grey" type="submit"><i class="fa fa-search w3-margin-right"></i> Search availability</button>
            </form>
        </div>
    </div>
</header>

<!-- Page content -->

<div id="rooms" class="container-fluid" style="padding-top:50px">
        <h3>Rooms</h3>
        <p>Make yourself at home is our slogan. We offer the best beds in the industry. Sleep well and rest well.</p>
    </div>

    <div class="w3-row-padding">
        <div class="w3-col m3">
            <label><i class="fa fa-calendar-o"></i> Check In</label>
            <input class="w3-input w3-border" type="text" placeholder="DD MM YYYY">
        </div>
        <div class="w3-col m3">
            <label><i class="fa fa-calendar-o"></i> Check Out</label>
            <input class="w3-input w3-border" type="text" placeholder="DD MM YYYY">
        </div>
        <div class="w3-col m2">
            <label><i class="fa fa-male"></i> Adults</label>
            <input class="w3-input w3-border" type="number" placeholder="1">
        </div>
        <div class="w3-col m2">
            <label><i class="fa fa-child"></i> Kids</label>
            <input class="w3-input w3-border" type="number" placeholder="0">
        </div>
        <div class="w3-col m2">
            <label><i class="fa fa-search"></i> Search</label>
            <button class="w3-button w3-block w3-black">Search</button>
        </div>
    </div>

    <div class="w3-row-padding w3-padding-16">
        <div class="w3-third w3-margin-bottom">
            <img src="Image/classicRoom.jpg" alt="Norway" style="width:100%; height: 300px">
            <div class="w3-container w3-white">
                <h3>Classic Room</h3>
                <h6 class="w3-opacity">From $99</h6>
                <p>Single bed</p>
                <p>15m<sup>2</sup></p>
                <p class="w3-large"><i class="fa fa-bath"></i> <i class="fa fa-phone"></i> <i class="fa fa-wifi"></i></p>
                <button class="w3-button w3-block w3-black w3-margin-bottom">Choose Room</button>
            </div>
        </div>
        <div class="w3-third w3-margin-bottom">
            <img src="Image/executiveRoom.jpg" alt="Norway" style="width:100%; height: 300px">
            <div class="w3-container w3-white">
                <h3>Executive Room</h3>
                <h6 class="w3-opacity">From $149</h6>
                <p>Queen-size bed</p>
                <p>25m<sup>2</sup></p>
                <p class="w3-large"><i class="fa fa-bath"></i> <i class="fa fa-phone"></i> <i class="fa fa-wifi"></i> <i class="fa fa-tv"></i></p>
                <button class="w3-button w3-block w3-black w3-margin-bottom">Choose Room</button>
            </div>
        </div>
        <div class="w3-third w3-margin-bottom">
            <img src="Image/suitesRoom.jpg" alt="Norway" style="width:100%; height: 300px">
            <div class="w3-container w3-white">
                <h3>Suites</h3>
                <h6 class="w3-opacity">From $199</h6>
                <p>King-size bed</p>
                <p>40m<sup>2</sup></p>
                <p class="w3-large"><i class="fa fa-bath"></i> <i class="fa fa-phone"></i> <i class="fa fa-wifi"></i> <i class="fa fa-tv"></i> <i class="fa fa-glass"></i> <i class="fa fa-cutlery"></i></p>
                <button class="w3-button w3-block w3-black w3-margin-bottom">Choose Room</button>
            </div>
        </div>
    </div>

    <div id="about" class="container-fluid" style="padding-top:50px">
        <div class="w3-col l4 m7">
            <h3>About</h3>
            <h6>Our hotel is one of a kind. It is truely amazing. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</h6>
            <p>We accept: <i class="fa fa-credit-card w3-large"></i> <i class="fa fa-cc-mastercard w3-large"></i> <i class="fa fa-cc-amex w3-large"></i> <i class="fa fa-cc-cc-visa w3-large"></i><i class="fa fa-cc-paypal w3-large"></i></p>
        </div>
        <div class="w3-col l8 m5">
            <div id="googleMap" style="width:100%;height:400px;"></div>
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

    <!-- End page content -->
<jsp:include page="includes/footer.jsp"/>
<!-- Add Google Maps -->
<script>
    function myMap() {
        var myCenter = new google.maps.LatLng(41.878114, -87.629798);
        var mapProp = {
            center: myCenter,
            zoom: 12,
            scrollwheel: false,
            draggable: false, mapTypeId: google.maps.MapTypeId.ROADMAP};
        var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
        var marker = new google.maps.Marker({position: myCenter});
        marker.setMap(map);
    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU&callback=myMap"></script>
<!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->

-->

</body>
</html>

