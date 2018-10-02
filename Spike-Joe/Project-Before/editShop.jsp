<%-- 
    Document   : editShop
    Created on : Apr 27, 2018, 2:14:59 AM
    Author     : kukki
--%>

<%@page import="models.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->

<!-- Joe add taglib -->
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML>
<html>

    <head>
        <title>Wan-jai</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="icon" type="image/png" sizes="96x96" href="images/favicon-96x96.png">
        <link href='css/fontgoogle.css' rel='stylesheet' type='text/css'>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/popup2.css" rel="stylesheet" type="text/css" media="all" />
        <!-- start details -->
        <link rel="stylesheet" type="text/css" href="css/productviewgallery.css" media="all" />
        <link rel="stylesheet" type="text/css" href="bootstrap3/css/bootstrap.min.css"/>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/cloud-zoom.1.0.3.min.js"></script>
        <script type="text/javascript" src="js/jquery.fancybox.pack.js"></script>
        <script type="text/javascript" src="js/jquery.fancybox-buttons.js"></script>
        <script type="text/javascript" src="js/jquery.fancybox-thumbs.js"></script>
        <script type="text/javascript" src="js/productviewgallery.js"></script>
        <!-- start top_js_button -->
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1200);
                });
            });
        </script>

        <!-- joe add link script and style sheet -->
        <link rel="stylesheet" type="text/css" href="popup_.css" >
        <script src="js/jquery.min.js" ></script>
        <script type="text/javascript" src="popup_.js" ></script>

        <!-- drag and drop -->
        <!--<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">-->
        <style>
            #dragandrophandler {
                border: 2px dotted #0B85A1;
                width: 400px;
                color: #92AAB0;
                text-align: left;
                vertical-align: middle;
                padding: 10px 10px 10px 10px;
                margin-bottom: 10px;
                font-size: 200%;
            }

            #drop-zone {
                width: 360px;
                height: 240px;
                text-align: center;
                padding: 86px 0 0;
                outline: 2px dashed #92b0b3;
                outline-offset: -10px;
                -webkit-transition: outline-offset .15s ease-in-out, background-color .15s linear;
                transition: outline-offset .15s ease-in-out, background-color .15s linear;
                font-size: 1.25rem;
                background-color: #c8dadf;
                /* position: relative; */
                /* padding: 100px 20px; */
            }

            #drop-zoneView {
                width: 100%;
                height: 100%;
                text-align: center;
                padding: 86px 0 0;
                outline: 2px dashed #92b0b3;
                outline-offset: -10px;
                -webkit-transition: outline-offset .15s ease-in-out, background-color .15s linear;
                transition: outline-offset .15s ease-in-out, background-color .15s linear;
                font-size: 1.25rem;
                background-color: #c8dadf;
                /* position: relative; */
                /* padding: 100px 20px; */
            }

            .btn-file input[type=file] {
                position: absolute;
                left: 0;
                top: 0;
                height: 100%;
                width: 100%;
                opacity: 0;
                cursor: pointer;
            }

            input[type=file] {
                display: block;
            }

            #drop-zone .drop-zone-caption {
                font-size: 20px;
                font-weight: 600;
                color: #919fa9;
                margin: 0 0 14px;
            }

            #drop-zoneView .drop-zone-caption {
                font-size: 20px;
                font-weight: 600;
                color: #919fa9;
                margin: 0 0 14px;
            }


            .btn.btn-primary {
                background-color: #00a8ff;
                border-color: #00a8ff;
            }
        </style>

        <!-- First Script to run popup add product and validate -->
        <script>
            //check for valid number
            function validateNumber(evt) {
                var theEvent = evt || window.event;
                var key = theEvent.keyCode || theEvent.which;
                key = String.fromCharCode(key);
                var regex = /[0-9]|\./;
                if (!regex.test(key)) {
                    theEvent.returnValue = false;
                    if (theEvent.preventDefault)
                        theEvent.preventDefault();
                }
            }
            // Check for valid email syntax
            function validateEmail(email) {
                var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return re.test(email);
            }
            // Check for valid email syntax
            function validateFloatNumber(text) {
                var re = /[0-9]|\./;
                return re.test(text);
            }
            function validateIntegerNumber(text) {
                var re = /^[0-9]*$/;
                return re.test(text);
            }
            function closeForm() {
                document.contactform.name.value = '';
                document.contactform.email.value = '';
                document.contactform.message.value = '';
                document.contactform.delivery.value = '';
                document.contactform.stock.value = '';
                document.contactform.price.value = '';
                document.contactform.minimum.value = '';

                $('.email').removeClass('typing');
                $('.name').removeClass('typing');
                $('.message').removeClass('typing');
                $('.delivery').removeClass('typing');
                $('.stock').removeClass('typing');
                $('.price').removeClass('typing');
                $('.minimum').removeClass('typing');
                $('.cd-popup').removeClass('is-visible');
                $('.notification').addClass('is-visible');
                $('#notification-text').html("Thanks for contacting us!");
            }
            $(document).ready(function ($) {
                /* ------------------------- */
                /* Contact Form Interactions */
                /* ------------------------- */
                $('#contact').on('click', function (event) {
                    event.preventDefault();

                    $('#modeAccess').val("add");
                    $('#pid').val("0");
                    $('#contactblurb').html('Agree to confirm product Edit!');
                    $('.contact').addClass('is-visible');
                    if ($('#name').val().length != 0) {
                        $('.name').addClass('typing');
                    }
                    if ($('#email').val().length != 0) {
                        $('.email').addClass('typing');
                    }
                    if ($('#message').val().length != 0) {
                        $('.message').addClass('typing');
                    }
                    if ($('#price').val().length != 0) {
                        $('.price').addClass('typing');
                    }
                    if ($('#minimum').val().length != 0) {
                        $('.minimum').addClass('typing');
                    }
                    if ($('#stock').val().length != 0) {
                        $('.stock').addClass('typing');
                    }
                    if ($('#delivery').val().length != 0) {
                        $('.delivery').addClass('typing');
                    }
                });
                //close popup when clicking x or off popup
                $('.cd-popup').on('click', function (event) {
                    if ($(event.target).is('.cd-popup-close') || $(event.target).is('.cd-popup')) {
                        event.preventDefault();
                        $(this).removeClass('is-visible');
                    }
                });
                //close popup when clicking the esc keyboard button
                $(document).keyup(function (event) {
                    if (event.which == '27') {
                        $('.cd-popup').removeClass('is-visible');
                    }
                });
                /* ------------------- */
                /* Contact Form Labels */
                /* ------------------- */
                $('#name').keyup(function () {
                    $('.name').addClass('typing');
                    if ($(this).val().length == 0) {
                        $('.name').removeClass('typing');
                    }
                });
                $('#email').keyup(function () {
                    $('.email').addClass('typing');
                    if ($(this).val().length == 0) {
                        $('.email').removeClass('typing');
                    }
                });
                $('#message').keyup(function () {
                    $('.message').addClass('typing');
                    if ($(this).val().length == 0) {
                        $('.message').removeClass('typing');
                    }
                });
                $('#price').keyup(function () {
                    $('.price').addClass('typing');
                    if ($(this).val().length == 0) {
                        $('.price').removeClass('typing');
                    }
                });
                $('#stock').keyup(function () {
                    $('.stock').addClass('typing');
                    if ($(this).val().length == 0) {
                        $('.stock').removeClass('typing');
                    }
                });
                $('#delivery').keyup(function () {
                    $('.delivery').addClass('typing');
                    if ($(this).val().length == 0) {
                        $('.delivery').removeClass('typing');
                    }
                });
                $('#minimum').keyup(function () {
                    $('.minimum').addClass('typing');
                    if ($(this).val().length == 0) {
                        $('.minimum').removeClass('typing');
                    }
                });
                /* ----------------- */
                /* Handle submission */
                /* ----------------- */
                $('#contactform').submit(function () {
                    var name = $('#name').val();
                    var email = $('#email').val();
                    var message = $('#message').val();
                    var human = $('#human:checked').val();
                    var price = $('#price').val();
                    var stock = $('#stock').val();
                    var delivery = $('#delivery').val();

                    alert(name);
                    if (human) {
                        if (validateFloatNumber(price) && validateIntegerNumber(stock) && validateFloatNumber(delivery)) {
                            if (name) {
                                if (message) {
// Handle submitting data somewhere
// For a tutorial on submitting the form to a Google Spreadsheet, see:
// https://notnaturaltutorials.wordpress.com/2016/03/20/submit-form-to-spreadsheet/
                                    /*
                                     var googleFormsURL = "https://docs.google.com/forms/d/1dHaFG67d7wwatDtiVNOL98R-FwW1rwdDwdFqqKJggBM3nFB4/formResponse";
                                     // replace these example entry numbers
                                     var spreadsheetFields = {
                                     "entry.212312005": name,
                                     "entry.1226278897": email,
                                     "entry.1835345325": message
                                     }
                                     $.ajax({
                                     url: googleFormsURL,
                                     data: spreadsheetFields,
                                     type: "POST",
                                     dataType: "xml",
                                     statusCode: {
                                     0: function() {
                                     
                                     },
                                     200: function() {
                                     
                                     }
                                     }
                                     });
                                     */
                                    closeForm();
                                } else {
                                    $('#notification-text').html("<strong>Please let us know what you're thinking!</strong>");
                                    $('.notification').addClass('is-visible');
                                }
                            } else {
                                $('#notification-text').html('<strong>Please provide a name.</strong>');
                                $('.notification').addClass('is-visible');
                            }
                        } else {
                            $('#notification-text').html('<strong>Please use a valid Number format.</strong>');
                            $('.notification').addClass('is-visible');
                        }
                    } else {
                        $('#notification-text').html('<h3><strong><em>Warning: Please Confirm to Agree product condition </em></strong></h3>');
                        $('.notification').addClass('is-visible');
                    }
                    return false;
                });
            });
        </script>


        <style>
            img {
                vertical-align: middle;
            }

            /* Position the image container (needed to position the left and right arrows) */

            .container {
                position: relative;
            }

            /* Hide the images by default */

            .mySlides {
                display: none;
            }

            /* Add a pointer when hovering over the thumbnail images */

            .cursor {
                cursor: pointer;
            }

            /* Next & previous buttons */

            .prev,
            .next {
                cursor: pointer;
                position: absolute;
                top: 40%;
                width: auto;
                padding: 16px;
                margin-top: -50px;
                color: white;
                font-weight: bold;
                font-size: 20px;
                border-radius: 0 3px 3px 0;
                user-select: none;
                -webkit-user-select: none;
            }

            /* Position the "next button" to the right */

            .next {
                right: 0;
                border-radius: 3px 0 0 3px;
            }

            /* On hover, add a black background color with a little bit see-through */

            .prev:hover,
            .next:hover {
                background-color: rgba(0, 0, 0, 0.8);
            }

            /* Number text (1/3 etc) */

            .numbertext {
                color: #f2f2f2;
                font-size: 12px;
                padding: 8px 12px;
                position: absolute;
                top: 0;
            }

            /* Container for image text */

            .caption-container {
                text-align: center;
                background-color: #222;
                padding: 2px 16px;
                color: white;
            }

            .row:after {
                content: "";
                display: table;
                clear: both;
            }

            /* Six columns side by side */

            .column {
                float: left;
                width: 16.66%;
            }

            /* Add a transparency effect for thumnbail images */

            .demo {
                opacity: 0.6;
            }

            .active,
            .demo:hover {
                opacity: 1;
            }
        </style>

        <link rel="stylesheet" type="text/css" href="css/naran.css">
        <link rel="stylesheet" type="text/css" href="bootstrap3/css/bootstrap.min.css">
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="bootstrap3/js/bootstrap.min.js"></script>

        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <!--===============================================================================================-->

        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <!--===============================================================================================-->

        <!-- Pictire circle style -->
        <style>
            /*Profile Pic Start*/
            .picture-container1{
                position: relative;
                height: 150px;
                width: 150px;
                cursor: pointer;
                text-align: center;
            }
            .picture-container2{
                position: relative;
                height: 380px;
                width: 940px;
                cursor: pointer;
                text-align: center;
            }
            .picturePro{
                width: 150px;
                height: 150px;
                background-color: #999999;
                border: 4px solid #CCCCCC;
                color: #FFFFFF;
                border-radius: 50%;
                /*margin: 0px auto;*/
                overflow: hidden;
                transition: all 0.2s;
                -webkit-transition: all 0.2s;
            }

            .pictureBan{
                width: 940px;
                height: 380px;
                background-color: #999999;
                border: 4px solid #CCCCCC;
                color: #FFFFFF;
                border-radius: 0%;
                /*margin: 0px auto;*/
                overflow: hidden;
                transition: all 0.2s;
                -webkit-transition: all 0.2s;
            }
            .picturePro:hover{
                border-color: #2ca8ff;
            }
            .pictureBan:hover{
                border-color: #2ca8ff;
            }
            .content.ct-wizard-green .picture:hover{
                border-color: #05ae0e;
            }
            .content.ct-wizard-blue .picture:hover{
                border-color: #3472f7;
            }
            .content.ct-wizard-orange .picture:hover{
                border-color: #ff9500;
            }
            .content.ct-wizard-red .picture:hover{
                border-color: #ff3b30;
            }
            .picturePro input[type="file"] {
                cursor: pointer;
                display: block;
                height: 150px;
                left: 0;
                opacity: 0 !important;
                position: absolute;
                top: 0;
                width: 150px;
            }
            .pictureBan input[type="file"] {
                cursor: pointer;
                display: block;
                height: 380px;
                left: 0;
                opacity: 0 !important;
                position: absolute;
                top: 0;
                width: 940px;
            }

            .picture-src{
                width: 100%;
                height: 100%;
            }
            /*Profile Pic End*/
        </style>
        <style>

            .popup-container{
                overflow: scroll;
            }

            .popup-container input{


                resize: none !important;
                width: 100% !important;
                -moz-appearance: none !important;
                -webkit-appearance: none !important;
                -o-appearance: none;
                -ms-appearance: none;
                appearance: none;
            }

            .popup-container textarea{


                resize: none !important;
                width: 100% !important;
                -moz-appearance: none !important;
                -webkit-appearance: none !important;
                -o-appearance: none;
                -ms-appearance: none;
                appearance: none;
            }

            .popup-container label{
                color: #3498db;

            }

            .popup-container h2,
            .popup-container h3 {
                color: #545454;
                font-weight: 700;
                line-height: 1.5em;
                margin: 0 0 1em 0;
                letter-spacing: -0.01em;
            }

            .popup-container h2 {
                font-size: 1.75em;
            }

            .popup-container h3 {
                font-size: 1.25em;
            }

            .popup-container ul {
                list-style: disc;
                margin: 0 0 2em 0;
                padding-left: 1em;
            }

            .popup-container ul.actions {
                cursor: default;
                list-style: none;
                padding-left: 0;
            }

            .popup-container ul.actions li {
                display: inline-block;
                padding: 0 1em 0 0;
                vertical-align: middle;
            }

            .popup-container ul.actions li:last-child {
                padding-right: 0;
            }

            .area-product{
                margin: 20px;
            }


        </style>


        <!-- Picture view -->
        <script>
            $(document).ready(function () {
                // Prepare the preview for profile picture
                $("#wizard-picturePro").change(function () {
                    readURLPro(this);
                });

                $("#wizard-pictureBan").change(function () {
                    readURLBan(this);
                });
            });
            function readURLPro(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#wizardPicturePreviewPro').attr('src', e.target.result).fadeIn('slow');
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }

            function readURLBan(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#wizardPicturePreviewBan').attr('src', e.target.result).fadeIn('slow');
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>
    </head>

    <body>
        <%@ include file="header.jsp" %>

        <% Account account = (Account) session.getAttribute("account");
            String username = account.getUsername();
        %>

        <sql:query dataSource = "bakery" var = "result">
            SELECT * from user;
        </sql:query>

        <sql:query dataSource = "bakery" var = "result_spec">
            SELECT *
            from seller s
            join account a
            on (s.account_username=a.username)
            and account_username='<%= username%>';
        </sql:query>

        <sql:query dataSource = "bakery" var = "store_photo">
            SELECT *
            from seller s
            join store_photo p
            on (s.account_username=p.seller_account_username)
            WHERE account_username='<%= username%>'
            ORDER BY RAND();
        </sql:query>

        <sql:query dataSource = "bakery" var = "count">
            SELECT count(*) 'count'
            from seller s
            join inventory i
            on (s.account_username=i.seller_account_username)
            WHERE account_username='<%= username%>'
        </sql:query>
            
            <sql:query dataSource = "bakery" var = "vote">
            SELECT ROUND(avg(vote),2) 'avg'
            FROM review r
            JOIN order_item o
            ON (r.order_item_item_no = o.item_no) AND (r.order_item_shopping_basket_id = o.shopping_basket_id)
            JOIN inventory i
            ON (o.inventory_id = i.id)
            WHERE seller_account_username = '<%=username%>'
        </sql:query>
            
        <sql:query dataSource = "bakery" var = "comment">
            SELECT count(*) 'count'
            FROM review r
            JOIN order_item o
            ON (r.order_item_item_no = o.item_no) AND (r.order_item_shopping_basket_id = o.shopping_basket_id)
            JOIN inventory i
            ON (o.inventory_id = i.id)
            WHERE seller_account_username = '<%=username%>'
        </sql:query>

        <!-- start main1 -->
        <form action="inventory.do">
            <div class="main_bg2">
                <div class="wrap">
                    <div class="main1">
                    </div>
                </div>

                <!-- Main Store -->
                <div class="container">
                    <div class="row">
                        <nav class="col-sm-2"><!--nav-->
                            <div class="row">
                                <div class="col-sm-12"><!--logo-->
                                    <!-- <img src="http://placehold.it/200&text=Logo" alt="test" class="img-circle img-responsive center" />-->


                                    <div class="picture-container1">
                                        <div class="picturePro">

                                            <c:choose>
                                                <c:when test="${result_spec.rows[0].profile_photo != null}">
                                                    <img src="${result_spec.rows[0].profile_photo}" class="picture-src" id="wizardPicturePreviewPro" class="img-circle img-responsive center" title="">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="image/no-image-square.jpg" class="picture-src" id="wizardPicturePreviewBan" title="">
                                                </c:otherwise>
                                            </c:choose>
                                            <input type="file" id="wizard-picturePro" class="">
                                        </div>
                                        <!--<div id="showdivPro">Show : </div>-->
                                    </div>


                                </div><!--/logo-->
                                <ul class="nav nav-pills nav-stacked">
                                    <li class="active"><a href="#"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp; ${result_spec.rows[0].shop_name}</a></li>
                                    <li><a href="#"><span class="glyphicon glyphicon-cutlery"></span>&nbsp;&nbsp;Product : ${count.rows[0].count}</a></li>
                                    <li><a href="#"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;Rate : ${vote.rows[0].avg}</a></li>
                                    <li><a href="#"><span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;Comment ${comment.rows[0].count}</a></li>         
                                </ul>

                        </nav><!--/nav-->

                        <div class="col-sm-10">      
                            <div><!-- class of slide for animation -->
                                <div class="carousel-inner">
                                    <div class="item active"><!-- class of active since it's the first item -->
                                        <!--<img src="http://placehold.it/1200x480" alt="" />-->
                                        <div class="carousel-caption">
                                            <p>Banner Photo</p>
                                        </div>
                                        <div class="picture-container2">
                                            <div class="pictureBan">
                                                <c:choose>
                                                    <c:when test="${result_spec.rows[0].banner_photo != null}">
                                                        <img src="${result_spec.rows[0].banner_photo}" class="picture-src" id="wizardPicturePreviewBan" title="">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="image/no-image-banner.jpg" class="picture-src" id="wizardPicturePreviewBan" title="">
                                                    </c:otherwise>
                                                </c:choose>

                                                <input type="file" id="wizard-pictureBan" class="">
                                            </div>

                                        </div>
                                        <!--<div id="showdivBan">Show 2 : </div>-->                  

                                    </div>
                                </div><!-- /.carousel-inner -->
                            </div><!-- /.carousel -->

                            <div class="row">
                                <div class="col-xs-12">           
                                    <div class="row">
                                        <div class="col-md-12">
                                            <h1>Store Description</h1>
                                            <div style="font-size: 100%;">Address ${result_spec.rows[0].address}</div>
                                            <p class="lead">
                                                <c:if test="${result_spec.rows[0].address != null}">
                                                    ${result_spec.rows[0].description}
                                                </c:if>
                                            </p>  
                                        </div>
                                    </div>
                                    <!-- upload photo 1,2,3,4 -->
                                    <div class="row">
                                        <div class="col-md-3 col-sm-6 post">
                                            <a href="#" class="thumbnail"><img src="${store_photo.rows[0].store_photo}" alt="" style="height: 250px; object-fit: cover;"/></a>
                                        </div>
                                        <div class="col-md-3 col-sm-6 post">
                                            <a href="#" class="thumbnail"><img src="${store_photo.rows[1].store_photo}" alt="" style="height: 250px; object-fit: cover;"/></a>
                                        </div>
                                        <div class="col-md-3 col-sm-6 post">
                                            <a href="#" class="thumbnail"><img src="${store_photo.rows[2].store_photo}" alt="" style="height: 250px; object-fit: cover;"/></a>
                                        </div>
                                        <div class="col-md-3 col-sm-6 post">
                                            <a href="#" class="thumbnail"><img src="${store_photo.rows[3].store_photo}" alt="" style="height: 250px; object-fit: cover;"/></a>
                                        </div>
                                    </div>    
                                </div>
                            </div>



                            <div id="slideshow-wrap">
                                <!-- add drag and drop photo slide show -->
                                <!-- drag and drop shop view-->
                                <!-- drag and drop shop view-->
                                <form class="box" method="post" action="" enctype="multipart/form-data">
                                    <div id="drop-zoneView">
                                        <div class="drop-zone-caption">Store atmosphere Drag & Drop Files Here</div>
                                        <span class="btn btn-primary btn-file" style="position: relative">
                                            <span>Choose files</span>
                                            <input type="file" accept="image/*" onchange="loadFile(event)" id="drop-zone-fileView" name="files[]" multiple>
                                        </span>
                                    </div>
                                    <!--<progress value="0" max="100" id="uploaderView">0%</progress>
                                    <div id="showdivView">show view : </div>-->
                                </form>

                            </div>

                            <!-- drag and drop -->
                            <!--
                                <form class="box" method="post" action="" enctype="multipart/form-data">
                                    <div id="drop-zone">
                                        <div class="drop-zone-caption">Drag & Drop Files Here</div>
                                        <span class="btn btn-primary btn-file" style="position: relative">
                                            <span>Choose files</span>
                                            <input type="file" accept="image/*" onchange="loadFile(event)" id="drop-zone-file" name="files[]" multiple>
                                        </span>
                                    </div>
                                    <progress value="0" max="100" id="uploaderProd">0%</progress>
                                    <div id="showdivProd">show 3 : </div>
                                </form>
                            -->
                        </div>
                    </div>
                </div>
            </div>
        </form>


        <!-- start main -->
        <!-- sเลือกเรียงรายการสินค้าจาก -->
        <div class="main_bg1">
            <div class="wrap">
                <div class="main1">
                    <h2>Table products</h2>
                </div>
            </div>
        </div>

        <sql:query dataSource = "bakery" var = "result_product">
            SELECT * from inventory where seller_account_username='<%= username%>';
        </sql:query>

        <div style="text-align: center;">
            <div class="limiter">
                <div class="container-table100">
                    <div class="wrap-table100">
                        <div class="table100">
                            <table class="table100c">
                                <thead>
                                    <tr class="table100-head">
                                        <th class="column1">Product ID</th>
                                        <th class="column2">Product Name</th>
                                        <th class="column3">Price</th>
                                        <th class="column4">Delivery Cost</th>
                                        <th class="column5">Minimum Amount</th>
                                        <th class="column6">Stock</th>
                                        <th class="column6">Button</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var = "row_product" items = "${result_product.rows}">
                                        <c:set var="cou" value="${row_product.id}"/>
                                        <tr>
                                            <td class="column1" style="width: 150px;"> <input type="text" name="productId" value="<c:out value="${row_product.id}"/>" size="4" /></td>
                                            <td class="column2" style="width: 700px;"> <input type="text" name="productName" value="<c:out value="${row_product.name}"/>" size="50" /></td>
                                            <td class="column3" style="width: 150px;"> <input type="text" name="productPrice" value="<c:out value="${row_product.price}"/>" size="4" /></td>
                                            <td class="column4" style="width: 150px;"> <input type="text" name="productDescription" value="<c:out value="${row_product.delivery_cost}"/>" size="25" /></td>
                                            <td class="column5" style="width: 150px;"> <input type="text" name="productStock" value="<c:out value="${row_product.minimum_amount}"/>" size="4" /></td>
                                            <td class="column6" style="width: 150px;"> <input type="text" name="productStock" value="<c:out value="${row_product.stock}"/>" size="4" /></td>
                                            <td class="column7" style="width: 150px; text-align: left; padding-right: auto">

                                                <!-- Popup product form-->
                                                <form id="editProduct${cou}" method="POST" action="EditInventoryServlet">
                                                    <div class="popup-link">
                                                        <a href="#popup${cou}">Edit</a>
                                                    </div>

                                                </form>
                                                <form method="POST" action="EditInventoryServlet">
                                                    <div class="contact-form">
                                                        <div style="width:10%;">
                                                    <input type="submit" name="modeAccess" value="delete<c:out value="${row_product.id}"/>" />
                                                    <input type="hidden" name="productId" value="${row_product.id}"/>
                                                        </div>
                                                    </div>
                                                </form>
                                            </td>
                                        </tr>
                                        <!--popup1-->
                                    <div id="popup${cou}" class="popup-container">
                                        <div class="popup-content">
                                            <a href="#" class="close">&times;</a>
                                            <h3 style="text-align: center;">Product Detail</h3>
                                            <div class="col-sm-6" style="z-index: 100;">
                                                <div class="area-product">
                                                    <label for="name">Product Name</label>
                                                    <input type="text" id="name${cou}" name="productName" form="editProduct${cou}" value="${row_product.name}"/>
                                                </div>
                                                <div class="area-product">
                                                    <label for="stock">Product Stock</label>
                                                    <input type="text" id="stock${cou}" name="productStock" form="editProduct${cou}" value="${row_product.stock}" onkeypress="validateIntegerNumber(event)" />
                                                </div>
                                                <div class="area-product">
                                                    <label for="delivery">Delivery Cost</label>
                                                    <input type="text" id="delivery${cou}" name="productDelivery" form="editProduct${cou}" value="${row_product.delivery_cost}" onkeypress="validateFloatNumber(event)" />
                                                </div>
                                                <br>

                                            </div>
                                            <div class="col-sm-6"  style="z-index: 100;">

                                                <div class="area-product">
                                                    <label for="price">Price</label>
                                                    <input type="text" id="price${cou}" name="productPrice" form="editProduct${cou}" value="${row_product.price}" onkeypress="validateFloatNumber(event)" size="25"/>
                                                </div>
                                                <div class="area-product">
                                                    <label for="delivery" style="visibility: hidden;">Delivery Cost</label>
                                                    <input type="text" style="visibility: hidden;" form="editProduct${cou}" />
                                                </div>
                                                <div class="area-product">
                                                    <label for="minimum">Minimum Amount</label>
                                                    <input type="text" id="minimum${cou}" name="productMinimum" form="editProduct${cou}" value="${row_product.minimum_amount}" onkeypress="validateIntegerNumber(event)" />
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <div  style="z-index: 99;" >
                                                    <label for="message">Description</label>
                                                    <textarea id="message${cou}" name="productDescription" form="editProduct${cou}" rows="10">${row_product.description}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-sm-12">

                                                <form class="box" method="post" action="" enctype="multipart/form-data">
                                                    <div id="drop-zone${cou}" style="width:100%; margin-bottom: 5%; margin-top: 5%;">
                                                        <div class="drop-zone-caption">Product Drag & Drop Files Here</div>
                                                        <span class="btn btn-primary btn-file" style="position: relative">
                                                            <span>Choose files</span>
                                                            <input type="file" accept="image/*" onchange="loadFile(event)" id="drop-zone-file${cou}" name="files[]" multiple>
                                                        </span>
                                                    </div>
                                                    <!--<progress value="0" max="100" id="uploaderProd">0%</progress>
                                                    <div id="showProd">in popup : </div>-->
                                                </form>


                                                <!-- script drag and drop 1-->
                                                <!-- script drag and drop 1-->
                                                <script>
                                                    var loadFile1 = function (event) {
                                                        var output1 = document.getElementById('output1');
                                                        output1.src = URL.createObjectURL(event.target.files[0]);
                                                    };
                                                </script>

                                                <script>

                                                    var obj = $("#drop-zone${cou}");
                                                    obj.on('dragenter', function (e) {
                                                        e.stopPropagation();
                                                        e.preventDefault();
                                                        $(this).css('border', '2px solid #0B85A1');
                                                    });
                                                    obj.on('dragover', function (e) {
                                                        e.stopPropagation();
                                                        e.preventDefault();
                                                    });
                                                    obj.on('drop', function (e) {

                                                        $(this).css('border', '2px dotted #0B85A1');
                                                        e.preventDefault();
                                                        var files = e.originalEvent.dataTransfer.files;

                                                        //We need to send dropped files to Server
                                                        handleFileUpload${cou}(files, obj);
                                                    });

                                                    $(document).on('dragenter', function (e) {
                                                        e.stopPropagation();
                                                        e.preventDefault();
                                                    });
                                                    $(document).on('dragover', function (e) {
                                                        e.stopPropagation();
                                                        e.preventDefault();
                                                        obj.css('border', '2px dotted #0B85A1');
                                                    });
                                                    $(document).on('drop', function (e) {
                                                        e.stopPropagation();
                                                        e.preventDefault();
                                                    });

                                                // automatically submit the form on file select
                                                    $('#drop-zone-file${cou}').on('change', function (e) {
                                                        var files = $('#drop-zone-file${cou}')[0].files;
                                                        handleFileUpload${cou}(files, obj);
                                                    });

                                                    function servletCall${cou}(path) {
                                                        $.post(
                                                                "GetUserServlet",
                                                                {product: path}, //meaasge you want to send
                                                                function (result) {
                                                                    $('#showProd${cou}').html('Here is your result : <strong>' + result + '</strong>'); //message you want to show
                                                                });
                                                    }
                                                    ;

                                                    function handleFileUpload${cou}(files, obj) {
                                                        for (var i = 0; i < files.length; i++) {
                                                            var fd = new FormData();
                                                            fd.append('file', files[i]);

                                                            console.log(files[i]);
                                                            fireBaseImageUpload({
                                                                'file': files[i],
                                                                'path': '/<%= username%>/product/${cou}/'
                                                            }, function (data) {
                                                                //console.log(data);
                                                                if (!data.error) {
                                                                    if (data.progress) {
                                                                        // progress update to view here

                                                                        //update progress bar
                                                                        var uploader1 = document.getElementById('uploaderProd${cou}');
                                                                        uploader1.value = data.progress;
                                                                    }
                                                                    if (data.downloadURL) {
                                                                        // update done
                                                                        // download URL here "data.downloadURL"
                                                                        console.log(data.downloadURL);
                                                                        servletCall${cou}(data.downloadURL);
                                                                    }
                                                                } else {
                                                                    console.log(data.error + ' Firebase image upload error');
                                                                }
                                                            });
                                                        }
                                                    }
                                                    ;

                                                </script>

                                                <!--
                                                <form class="box" method="post" action="" enctype="multipart/form-data">
                                                    <div id="drop-zone">
                                                        <div class="drop-zone-caption">Drag & Drop Files Here</div>
                                                        <span class="btn btn-primary btn-file" style="position: relative">
                                                            <span>Choose files</span>
                                                            <input type="file" accept="image/*" onchange="loadFile(event)" id="drop-zone-file" name="files[]" multiple>
                                                        </span>
                                                    </div>
                                                    <progress value="0" max="100" id="uploaderProd">0%</progress>
                                                    <div id="showdivProd${cou}">show 4 : </div>
                                                </form>-->
                                            </div>
                                            <div class="col-sm-12">
                                                <input type="submit" name="submit" value="Send" form="editProduct${cou}" />
                                                <input type="hidden" name="modeAccess" value="edit" form="editProduct${cou}"/>
                                                <input type="hidden" name="productId" value="${row_product.id}" form="editProduct${cou}"/>
                                            </div>
                                        </div>
                                    </div>

                                </c:forEach>
                                </tbody>
                                <tfoot>
                                    <tr><td style="text-align: center;" colspan="7">
                                            <a href="#popup0">
                                                <span style="font-size: 50px; padding: 20px; color:#f4a012;" onMouseOver="this.style.color = '#504944'" onmouseout="this.style.color = '#f4a012'" class="glyphicon glyphicon-plus-sign" aria-hidden="true">

                                                </span>
                                            </a>
                                        </td></tr>
                                </tfoot>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <form id="addPro" method="POST" action="EditInventoryServlet"></form>
            <input type="hidden" name="modeAccess" value="add" form="addPro"/>
            <input type="hidden" name="submit" value="Send" form="addPro"/>
            <div id="popup0" class="popup-container">
                <div class="popup-content">
                    <a href="#" class="close">&times;</a>
                    <h3 style="text-align: center;">Product Detail</h3>
                    <div class="col-sm-6">
                        <div class="area-product">
                            <label for="name">Product Name</label>
                            <input type="text" id="name0" name="productName" form="addPro" />
                        </div>
                        <div class="area-product">
                            <label for="stock">Product Stock</label>
                            <input type="text" id="stock0" name="productStock" form="addPro" onkeypress="validateIntegerNumber(event)" />
                        </div>
                        <div class="area-product">
                            <label for="delivery">Delivery Cost</label>
                            <input type="text" id="delivery0" name="productDelivery" form="addPro" onkeypress="validateFloatNumber(event)" />
                        </div>
                        <br>

                    </div>
                    <div class="col-sm-6">

                        <div class="area-product">
                            <label for="price">Price</label>
                            <input type="text" id="price0" name="productPrice" form="addPro" onkeypress="validateFloatNumber(event)" size="25"/>
                        </div>
                        <div class="area-product">
                            <label for="delivery" style="visibility: hidden;">Delivery Cost</label>
                            <input type="text" name="productDelivery" style="visibility: hidden;" form="addPro"/>
                        </div>
                        <div class="area-product">
                            <label for="minimum">Minimum Amount</label>
                            <input type="text" id="minimum0" name="productMinimum" form="addPro" onkeypress="validateIntegerNumber(event)" />
                        </div>
                    </div><br>
                    <label for="message">Description</label>
                    <textarea id="message0" name="productDescription" form="addPro" rows="10"></textarea>

                    <div class="col-sm-12" style="text-align: center;">
                        <!-- add popup -->
                        <!-- drag and drop -->

                        <form class="box" method="post" action="" enctype="multipart/form-data">
                            <div id="drop-zone"  style="width:100%; margin-bottom: 5%; margin-top: 5%;">
                                <div class="drop-zone-caption">Drag & Drop Files Here</div>
                                <span class="btn btn-primary btn-file" style="position: relative">
                                    <span>Choose files</span>
                                    <input type="file" accept="image/*" onchange="loadFile(event)" id="drop-zone-file" name="files[]" multiple>
                                </span>
                            </div>
                            <!--<progress value="0" max="100" id="uploaderProd">0%</progress>
                            <div id="showdivProd">show 3 : </div>-->
                        </form>
                    </div>
                    <div class="col-sm-12">
                        <input type="submit" name="submit" value="Send" form="addPro" />
                    </div>
                </div>
            </div>
            <!--<div class="pagmore">
                <div class="pagination">
                    <a href="#">&laquo;</a>
                    <a href="#">1</a>
                    <a href="#" class="active">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">6</a>
                    <a href="#">&raquo;</a>
                </div>
            </div>-->
        </div>
        <!-- start footer -->
        <!-- start footer -->
        <div class="footer_bg1">
            <div class="wrap">
                <div class="footer">
                    <!-- scroll_top_btn -->
                    <script type="text/javascript">
                        $(document).ready(function () {

                            var defaults = {
                                containerID: 'toTop', // fading element id
                                containerHoverID: 'toTopHover', // fading element hover id
                                scrollSpeed: 1200,
                                easingType: 'linear'
                            };


                            $().UItoTop({easingType: 'easeOutQuart'});

                        });
                    </script>
                    <a href="#" id="toTop" style="display: block;">
                        <span id="toTopHover" style="opacity: 1;"></span>
                    </a>
                    <!--end scroll_top_btn -->
                    <div class="copy">
                        <p class="link">&copy;  All rights reserved | © Project website 2018
                        </p>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>


        <!-- customer slide show script -->
        <script>
            var slideIndex = 1;
            showSlides(slideIndex);

            function plusSlides(n) {
                showSlides(slideIndex += n);
            }

            function currentSlide(n) {
                showSlides(slideIndex = n);
            }

            function showSlides(n) {
                var i;
                var slides = document.getElementsByClassName("mySlides");
                var dots = document.getElementsByClassName("demo");
                var captionText = document.getElementById("caption");
                if (n > slides.length) {
                    slideIndex = 1
                }
                if (n < 1) {
                    slideIndex = slides.length
                }
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " active";
                captionText.innerHTML = dots[slideIndex - 1].alt;
            }
        </script>



        <!--===============================================================================================-->  
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <!--<script src="vendor/bootstrap/js/bootstrap.min.js"></script>-->
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>


        <!-- add Script firebase -->
        <script src="js/firebase.js"></script>
        <script src="js/jquery.min.js"></script>

        <!-- script config firebase -->
        <script>
            //config firebase
            var config = {
                apiKey: "AIzaSyABXOvnuXXMaI4a8J64Gt2Y9P-V5UG-Ftw",
                authDomain: "bakerysystem-661db.firebaseapp.com",
                databaseURL: "https://bakerysystem-661db.firebaseio.com",
                projectId: "bakerysystem-661db",
                storageBucket: "bakerysystem-661db.appspot.com",
                //messagingSenderId: "141182130037"
            };
            firebase.initializeApp(config);
        </script>

        <!-- script profile and banner -->
        <script>

            //servlet connect for send profile value
            function servletCallPro(path) {
                $.post(
                        "GetUserServlet",
                        {profile: path}, //meaasge you want to send
                        function (result) {
                            //$('#showdivPro').html('Here is your result : <strong>' + result + '</strong>'); //message you want to show
                            $('#showdivPro').html('อัพโหลดเสร็จสิ้น');
                        });
            }
            ;

            //get elements profile
            var uploaderPro = document.getElementById('uploaderPro');
            var fileButtonPro = document.getElementById('wizard-picturePro');

            //Listener
            fileButtonPro.addEventListener('change', function (e) {
                //get file
                var file = e.target.files[0];

                //create a storage ref
                var storageRef = firebase.storage().ref('<%= username%>/profile/' + file.name);

                //upload file
                var task = storageRef.put(file);
                console.log(file, storageRef, task);

                //update progress bar
                task.on('state_changed',
                        function progress(snapshot) {
                            var percentage = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
                            uploaderPro.value = percentage;
                        },
                        function error(err) {},
                        function complete() {
                            var downloadURL = task.snapshot.downloadURL;
                            servletCallPro(downloadURL);
                        }
                );

            });


            //servlet connect for send banner value
            function servletCallBan(path) {
                $.post(
                        "GetUserServlet",
                        {banner: path}, //meaasge you want to send
                        function (result) {
                            $('#showdivBan').html('Here is your result : <strong>' + result + '</strong>'); //message you want to show
                        });
            }
            ;

            //get elements Banner
            var uploaderBan = document.getElementById('uploaderBan');
            var fileButtonBan = document.getElementById('wizard-pictureBan');

            //Listener
            fileButtonBan.addEventListener('change', function (e) {
                //get file
                var file = e.target.files[0];

                //create a storage ref
                var storageRef = firebase.storage().ref('<%= username%>/banner/' + file.name);

                //upload file
                var task = storageRef.put(file);
                console.log(file, storageRef, task);

                //update progress bar
                task.on('state_changed',
                        function progress(snapshot) {
                            var percentage = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
                            uploaderBan.value = percentage;
                        },
                        function error(err) {},
                        function complete() {
                            var downloadURL = task.snapshot.downloadURL;
                            servletCallBan(downloadURL);
                        }
                );

            });

        </script>

        <!-- script drag and drop -->
        <script>
            var loadFile = function (event) {
                var output = document.getElementById('output');
                output.src = URL.createObjectURL(event.target.files[0]);
            };
        </script>

        <script>

            var obj = $("#drop-zone");
            obj.on('dragenter', function (e) {
                e.stopPropagation();
                e.preventDefault();
                $(this).css('border', '2px solid #0B85A1');
            });
            obj.on('dragover', function (e) {
                e.stopPropagation();
                e.preventDefault();
            });
            obj.on('drop', function (e) {

                $(this).css('border', '2px dotted #0B85A1');
                e.preventDefault();
                var files = e.originalEvent.dataTransfer.files;

                //We need to send dropped files to Server
                handleFileUpload(files, obj);
            });

            $(document).on('dragenter', function (e) {
                e.stopPropagation();
                e.preventDefault();
            });
            $(document).on('dragover', function (e) {
                e.stopPropagation();
                e.preventDefault();
                obj.css('border', '2px dotted #0B85A1');
            });
            $(document).on('drop', function (e) {
                e.stopPropagation();
                e.preventDefault();
            });

        // automatically submit the form on file select
            $('#drop-zone-file').on('change', function (e) {
                var files = $('#drop-zone-file')[0].files;
                handleFileUploadNew(files, obj);
            });

            function servletCallProd(path) {
                $.post(
                        "GetUserServlet",
                        {product: path}, //meaasge you want to send
                        function (result) {
                            $('#showdivProd').html('Here is your result : <strong>' + result + '</strong>'); //message you want to show
                        });
            }
            ;

            function handleFileUploadNew(files, obj) {
                for (var i = 0; i < files.length; i++) {
                    var fd = new FormData();
                    fd.append('file', files[i]);

                    console.log(files[i]);
                    fireBaseImageUpload({
                        'file': files[i],
                        'path': '/<%= username%>/product/New/'
                    }, function (data) {
                        //console.log(data);
                        if (!data.error) {
                            if (data.progress) {
                                // progress update to view here

                                //update progress bar
                                var uploaderProd = document.getElementById('uploaderProd');
                                uploaderProd.value = data.progress;
                            }
                            if (data.downloadURL) {
                                // update done
                                // download URL here "data.downloadURL"
                                console.log(data.downloadURL);
                                servletCallProd(data.downloadURL);
                            }
                        } else {
                            console.log(data.error + ' Firebase image upload error');
                        }
                    });
                }
            }
            ;


            function handleFileUpload(files, obj) {
                for (var i = 0; i < files.length; i++) {
                    var fd = new FormData();
                    fd.append('file', files[i]);

                    console.log(files[i]);
                    fireBaseImageUpload({
                        'file': files[i],
                        'path': '/<%= username%>/product/${cou}/'
                    }, function (data) {
                        //console.log(data);
                        if (!data.error) {
                            if (data.progress) {
                                // progress update to view here

                                //update progress bar
                                var uploaderProd = document.getElementById('uploaderProd');
                                uploaderProd.value = data.progress;
                            }
                            if (data.downloadURL) {
                                // update done
                                // download URL here "data.downloadURL"
                                console.log(data.downloadURL);
                                servletCallProd(data.downloadURL);
                            }
                        } else {
                            console.log(data.error + ' Firebase image upload error');
                        }
                    });
                }
            }
            ;

            function fireBaseImageUpload(parameters, callBackData) {

                // expected parameters to start storage upload
                var file = parameters.file;
                var path = parameters.path;
                var name;

                //just some error check
                if (!file) {
                    callBackData({error: 'file required to interact with Firebase storage'});
                }
                if (!path) {
                    callBackData({error: 'Node name required to interact with Firebase storage'});
                }

                var metaData = {'contentType': file.type};
                var arr = file.name.split('.');
                var fileSize = formatBytes(file.size); // get clean file size (function below)
                var fileType = file.type;
                var n = file.name;
                var storageRef = firebase.storage().ref();

                // generate random string to identify each upload instance
                name = generateRandomString(12); //(location function below)

                //var fullPath = path + '/' + name + '.' + arr.slice(-1)[0];
                var fullPath = path + '/' + file.name;

                var uploadFile = storageRef.child(fullPath).put(file, metaData);

                // first instance identifier
                callBackData({id: name, fileSize: fileSize, fileType: fileType, fileName: n});

                uploadFile.on('state_changed', function (snapshot) {
                    var progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
                    progress = Math.floor(progress);
                    callBackData({
                        progress: progress,
                        element: name,
                        fileSize: fileSize,
                        fileType: fileType,
                        fileName: n});
                }, function (error) {
                    callBackData({error: error});
                }, function () {
                    var downloadURL = uploadFile.snapshot.downloadURL;
                    callBackData({
                        downloadURL: downloadURL,
                        element: name,
                        fileSize: fileSize,
                        fileType: fileType,
                        fileName: n});
                });
            }

            function generateRandomString(length) {
                var chars = "abcdefghijklmnopqrstuvwxyz";
                var pass = "";
                for (var x = 0; x < length; x++) {
                    var i = Math.floor(Math.random() * chars.length);
                    pass += chars.charAt(i);
                }
                return pass;
            }

            function formatBytes(bytes, decimals) {
                if (bytes == 0)
                    return '0 Byte';
                var k = 1000;
                var dm = decimals + 1 || 3;
                var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
                var i = Math.floor(Math.log(bytes) / Math.log(k));
                return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + ' ' + sizes[i];
            }

        </script>

        <!-- script drag and drop view-->
        <script>
            var loadFileView = function (event) {
                var outputView = document.getElementById('outputView');
                outputView.src = URL.createObjectURL(event.target.files[0]);
            };
        </script>

        <script>

            var obj = $("#drop-zoneView");
            obj.on('dragenter', function (e) {
                e.stopPropagation();
                e.preventDefault();
                $(this).css('border', '2px solid #0B85A1');
            });
            obj.on('dragover', function (e) {
                e.stopPropagation();
                e.preventDefault();
            });
            obj.on('drop', function (e) {

                $(this).css('border', '2px dotted #0B85A1');
                e.preventDefault();
                var files = e.originalEvent.dataTransfer.files;

                //We need to send dropped files to Server
                handleFileUpload(files, obj);
            });

            $(document).on('dragenter', function (e) {
                e.stopPropagation();
                e.preventDefault();
            });
            $(document).on('dragover', function (e) {
                e.stopPropagation();
                e.preventDefault();
                obj.css('border', '2px dotted #0B85A1');
            });
            $(document).on('drop', function (e) {
                e.stopPropagation();
                e.preventDefault();
            });

        // automatically submit the form on file select
            $('#drop-zone-fileView').on('change', function (e) {
                var files = $('#drop-zone-fileView')[0].files;
                handleFileUploadView(files, obj);
            });

            function servletCallView(path) {
                $.post(
                        "GetUserServlet",
                        {store: path}, //meaasge you want to send
                        function (result) {
                            $('#showdivView').html('Here is your result : <strong>' + result + '</strong>'); //message you want to show
                        });
            }
            ;

            function handleFileUploadView(files, obj) {
                for (var i = 0; i < files.length; i++) {
                    var fd = new FormData();
                    fd.append('file', files[i]);

                    console.log(files[i]);
                    fireBaseImageUploadView({
                        'file': files[i],
                        'path': '<%= username%>/storeView'
                    }, function (data) {
                        //console.log(data);
                        if (!data.error) {
                            if (data.progress) {
                                // progress update to view here

                                //update progress bar
                                var uploaderView = document.getElementById('uploaderView');
                                uploaderView.value = data.progress;
                            }
                            if (data.downloadURL) {
                                // update done
                                // download URL here "data.downloadURL"
                                console.log(data.downloadURL);
                                servletCallView(data.downloadURL);
                            }
                        } else {
                            console.log(data.error + ' Firebase image upload error');
                        }
                    });
                }
            }
            ;

            function fireBaseImageUploadView(parameters, callBackData) {

                // expected parameters to start storage upload
                var file = parameters.file;
                var path = parameters.path;
                var name;

                //just some error check
                if (!file) {
                    callBackData({error: 'file required to interact with Firebase storage'});
                }
                if (!path) {
                    callBackData({error: 'Node name required to interact with Firebase storage'});
                }

                var metaData = {'contentType': file.type};
                var arr = file.name.split('.');
                var fileSize = formatBytes(file.size); // get clean file size (function below)
                var fileType = file.type;
                var n = file.name;
                var storageRef = firebase.storage().ref();

                // generate random string to identify each upload instance
                name = generateRandomString(12); //(location function below)

                //var fullPath = path + '/' + name + '.' + arr.slice(-1)[0];
                var fullPath = path + '/' + file.name;

                var uploadFile = storageRef.child(fullPath).put(file, metaData);

                // first instance identifier
                callBackData({id: name, fileSize: fileSize, fileType: fileType, fileName: n});

                uploadFile.on('state_changed', function (snapshot) {
                    var progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
                    progress = Math.floor(progress);
                    callBackData({
                        progress: progress,
                        element: name,
                        fileSize: fileSize,
                        fileType: fileType,
                        fileName: n});
                }, function (error) {
                    callBackData({error: error});
                }, function () {
                    var downloadURL = uploadFile.snapshot.downloadURL;
                    callBackData({
                        downloadURL: downloadURL,
                        element: name,
                        fileSize: fileSize,
                        fileType: fileType,
                        fileName: n});
                });
            }

            function generateRandomString(length) {
                var chars = "abcdefghijklmnopqrstuvwxyz";
                var pass = "";
                for (var x = 0; x < length; x++) {
                    var i = Math.floor(Math.random() * chars.length);
                    pass += chars.charAt(i);
                }
                return pass;
            }

            function formatBytes(bytes, decimals) {
                if (bytes == 0)
                    return '0 Byte';
                var k = 1000;
                var dm = decimals + 1 || 3;
                var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
                var i = Math.floor(Math.log(bytes) / Math.log(k));
                return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + ' ' + sizes[i];
            }

        </script>

    </body>

</html>