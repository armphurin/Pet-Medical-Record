<%@page import="models.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>

    <head>
        <title>Wan-jai</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="icon" type="image/png" sizes="96x96" href="images/favicon-96x96.png">
        <link href='css/fontgoogle.css' rel='stylesheet' type='text/css'>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- start details -->
        <link rel="stylesheet" type="text/css" href="css/productviewgallery.css" media="all" />
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
        <script type="text/javascript" src="https//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    </head>

    <body>
        <%@ include file="header.jsp" %>     
        
        <% String seller_username = request.getParameter("seller_username");
            System.out.println(seller_username);
        %>
        
        <sql:query dataSource = "bakery" var = "result_spec">
            SELECT *
            from seller s
            join account a
            on (s.account_username=a.username)
            and account_username='<%= seller_username%>';
        </sql:query>

        <sql:query dataSource = "bakery" var = "store_photo">
            SELECT *
            from seller s
            join store_photo p
            on (s.account_username=p.seller_account_username)
            WHERE account_username='<%=seller_username%>'
            ORDER BY RAND();
        </sql:query>

        <sql:query dataSource = "bakery" var = "count">
            SELECT count(*) 'count'
            from seller s
            join inventory i
            on (s.account_username=i.seller_account_username)
            WHERE account_username='<%=seller_username%>'
        </sql:query>
            
        <sql:query dataSource = "bakery" var = "vote">
            SELECT ROUND(avg(vote),2) 'avg'
            FROM review r
            JOIN order_item o
            ON (r.order_item_item_no = o.item_no) AND (r.order_item_shopping_basket_id = o.shopping_basket_id)
            JOIN inventory i
            ON (o.inventory_id = i.id)
            WHERE seller_account_username = '<%=seller_username%>'
        </sql:query>
            
        <sql:query dataSource = "bakery" var = "comment">
            SELECT count(*) 'count'
            FROM review r
            JOIN order_item o
            ON (r.order_item_item_no = o.item_no) AND (r.order_item_shopping_basket_id = o.shopping_basket_id)
            JOIN inventory i
            ON (o.inventory_id = i.id)
            WHERE seller_account_username = '<%=seller_username%>'
        </sql:query>
        
        <!-- start main1 -->
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
                                <img src="${result_spec.rows[0].profile_photo}" style="width: 100%; height: 100%; object-fit: cover; border-radius: 50%;" class="img-circle img-responsive center" />
                            </div><!--/logo-->
                            <ul class="nav nav-pills nav-stacked">
                                <li class="active"><a href="#"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp; ${result_spec.rows[0].shop_name}</a></li>
                                <li><a href="#"><span class="glyphicon glyphicon-cutlery"></span>&nbsp;&nbsp;Product : ${count.rows[0].count}</a></li>
                                <li><a href="#"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;Rate : ${vote.rows[0].avg}</a></li>
                                <li><a href="#"><span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;Comment ${comment.rows[0].count}</a></li>         
                            </ul>
                        </div>
                    </nav><!--/nav-->

                    <div class="col-sm-10">      
                        <div><!-- class of slide for animation -->
                            <div class="carousel-inner">
                                <div class="item active"><!-- class of active since it's the first item -->
                                    <img src="${result_spec.rows[0].banner_photo}"  style="width: 940px;height: 380px;object-fit: cover;" alt="" />
                                    <!--<div class="carousel-caption">
                                        <p>Picture</p>
                                    </div>-->
                                </div>
                            </div><!-- /.carousel-inner -->
                        </div><!-- /.carousel -->

                        <div class="row">
                            <div class="col-xs-12">           
                                <div class="row">
                                    <div class="col-md-12">
                                        <h1>Store Description</h1>
                                        <div style="font-size: 100%;">

                                            <!-- Store Address -->
                                            Address : ${result_spec.rows[0].address}
                                        </div>
                                        <p class="lead">
                                            <!-- Store Description -->
                                            STORE DESCRIPTION : ${result_spec.rows[0].description}
                                        </p>
                                        <p class="lead">
                                            Term of Use : ${result_spec.rows[0].term_of_use}
                                        </p>  
                                    </div>
                                </div>
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

                                            <sql:query var="storePhoto" dataSource="bakery">
                                                SELECT store_photo
                                                FROM store_photo
                                                WHERE seller_account_username = '<%=seller_username%>'
                                                ORDER BY RAND()
                                                LIMIT 10;
                                            </sql:query>

                        <div id="slideshow-wrap">
                            <c:set var="checkRadio" value="${1}"/>
                            <c:forEach var="i" items="${storePhoto.rows}">
                                <c:choose>
                                    <c:when test="${checkRadio == 1}">
                                        <input type="radio" id="button-${checkRadio}" name="controls" checked="checked"/>
                                        <label for="button-${checkRadio}"></label>

                                    </c:when>
                                    <c:otherwise>
                                        <input type="radio" id="button-${checkRadio}" name="controls"/>
                                        <label for="button-${checkRadio}"></label>
                                    </c:otherwise>
                                </c:choose>
                                <c:set var="checkRadio" value="${checkRadio+1}"/>
                            </c:forEach>

                            <c:set var="checkRadio" value="${1}"/>
                            <c:forEach var="i" items="${storePhoto.rows}">
                                <label for="button-${i}" class="arrows" id="arrow-${i}">
                                    <img src="images/rightArrow.png"/>
                                </label>
                                <c:set var="checkRadio" value="${checkRadio+1}"/>
                            </c:forEach>
                            
                            <sql:query var="storePhoto2" dataSource="bakery">
                                                SELECT store_photo
                                                FROM store_photo
                                                WHERE seller_account_username = '<%=seller_username%>'
                                                ORDER BY RAND()
                                                LIMIT 10;
                                            </sql:query>
                            <div id="slideshow-inner">

                                <ul>
                                    <c:set var="checkRadio" value="${1}"/>
                                    <c:forEach var="i" items="${storePhoto2.rows}">
                                    <li id="slide${checkRadio}">
                                        <img class="slide-img" src="${i.store_photo}">
                                        <div class="description">
                                            <input type="checkbox" id="show-description-${checkRadio}"/>
                                            <label for="show-description-${checkRadio}" class="show-description-label"> <span> &hearts; </span> </label>
                                            <div class="description-text">
                                                <!--<h2>Amsterdam, Netherlands</h2>
                                                <p>Reguliersgracht on the corner with the Keizersgracht</p>-->
                                            </div>
                                        </div>
                                    </li>
                                    <c:set var="checkRadio" value="${checkRadio+1}"/>
                                        </c:forEach>
                                </ul>

                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>

        
        <sql:query dataSource = "bakery" var = "inventory">
            SELECT * from inventory where seller_account_username='<%=seller_username%>' order by rand();
        </sql:query>
        <c:set var="count" value="${inventory.rowCount}"/>
        
        <div class="main_bg1">
            <div class="wrap">
                <div class="main1">
                    <h2>featured products</h2>
                </div>
            </div>
        </div>
        <!-- แสดงรายการสินค้าเรียงตาม A-z -->
        <div class="main_bg">
            <div class="wrap">
                <div class="main">
                    <c:set var = "count_row" value = "${0}"/>
                    <!-- รายการสินค้า -->
                    <c:forEach var="row" items="${inventory.rows}">
                        <c:if test = "${count_row%3 == 0}">
                            <div class="grids_of_3">
                            </c:if>
                            <sql:query var="photo" dataSource="bakery">
                                SELECT product_photo FROM product_photo WHERE inventory_id = ${row.id} ORDER BY RAND() LIMIT 1;
                            </sql:query>
                            <div class="grid1_of_3">
                                <a href="productDetail?id=${row.id}"style="text-decoration: none;"  target="_blank"/>
                                <c:choose>
                                    <c:when test="${photo.rowCount != 0}">
                                        <img src="${photo.rows[0].product_photo}" style="height: 150px; width: 150px; object-fit: cover;" alt=""/>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="images/pic1.png" style="height: 150px; width: 150px; object-fit: cover;" alt=""/>
                                    </c:otherwise>
                                </c:choose>
                                
                                <h3>${row.name}
                                    <br>${row.price} </h3>
                                </a>
                                <!--<div class="price">
                                    <h4>
                                        <form style="display: inline;" action="AddProductServlet" method="POST">
                                            <button name="add" value="${row.id}" onclick="addAlert()">Add to cart</button>
                                            <input type="hidden" name="viewShop" value="view"/>
                                        </form>
                                    </h4>
                                </div>-->
                                <span class="b_btm"></span>

                            </div>
                            <c:if test = "${count_row%3 == 2}">
                            </div>
                            <div class="clear"></div>
                        </c:if>
                        <c:set var = "count_row" value = "${count_row+1}"/>
                    </c:forEach>
                    

                </div>
                

                
            </div>
                
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
        <script>
            function addAlert() {
                alert('สินค้าถูกเพิ่มเข้าตะกร้า');
            }
        </script>
    </body>

</html>