
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>Hotel Booking System</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/css/style.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Tangerine">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    <style>
        body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
        .w3-tangerine {font-family: 'Tangerine', serif;}
    </style>
    <body class="w3-light-grey">

        <!-- Navigation Bar -->

        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand w3-tangerine " href="#" style="font-size: 3em; color: activeborder">
                        SunLight Hotel</a>
                </div>
                <div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="/HotelBookingGIT" >Home</a></li>
                            <li><a href="/HotelBookingGIT/#rooms" >Rooms</a></li>
                            <li><a href="${pageContext.request.contextPath}/promotion" >Promotion</a></li>
                            <li><a href="/HotelBookingGIT/#about" >About</a></li>
                            <li><a href="/HotelBookingGIT/#contact" >Contact</a></li>
                            <li>
                                <form action="${pageContext.request.contextPath}/searchBooking">
                                    <input class="w3-input w3-border" type="text" name="bookingCode">
                                    <input type="submit" value="Search Booking Code" id="submit" >
                                </form>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>      
        
