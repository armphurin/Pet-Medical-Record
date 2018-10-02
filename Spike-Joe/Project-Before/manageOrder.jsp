<%-- 
    Document   : manageOrder
    Created on : Apr 27, 2018, 7:47:28 PM
    Author     : Sattaya Singkul
--%>

<%@page import="models.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700' rel='stylesheet' type='text/css'>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link rel="icon" type="image/png" sizes="96x96" href="images/favicon-96x96.png">
        <!-- start details -->
        <link rel="stylesheet" type="text/css" href="css/productviewgallery.css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/popup2.css" media="all" />
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
    </head>

    <body>
        <%@ include file="header.jsp" %>

        <!-- start main -->
        <!-- sเลือกเรียงรายการสินค้าจาก -->
        <div class="main_bg1">
            <div class="wrap">
                <div class="main1">
                    <h2>Order Management</h2>
                </div>
            </div>
        </div>
        <% Account account = (Account) session.getAttribute("account");
            String username = account.getUsername();
        %>

        <sql:query var="status" dataSource="bakery">
            SELECT order_item.item_no, order_item.status, shopping_basket.customer_account_username, DATE_FORMAT(shopping_basket.order_completion_time, "%d %M %Y") 'Date', shopping_basket.id, inventory.name, order_item.amount
            FROM order_item
            JOIN inventory
            ON (order_item.inventory_id = inventory.id)
            JOIN shopping_basket
            ON (shopping_basket.id = order_item.shopping_basket_id)
            WHERE inventory.seller_account_username = '<%=username%>' AND order_item.status != 'pending';
        </sql:query>


        <div style="text-align: center;">
            <div class="limiter">
                <div class="container-table100">
                    <div class="wrap-table100">
                        <div class="table100">
                            <table class="table100c">
                                <thead>
                                    <tr class="table100-head">
                                        <th class="column1">Date</th>
                                        <th class="column2">Shopping Basket ID</th>
                                        <th class="column3">Item Name</th>
                                        <th class="column4">Customer</th>
                                        <th class="column5">Quantity</th>
                                        <th class="column6">Status</th>
                                        <th class="column7">Button</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="i" value="${1}"/>
                                    <c:forEach var="row" items="${status.rows}">
                                        <tr>
                                            <td class="column1">${row.date}</td>
                                            <td class="column2">${row.id}</td>
                                            <td class="column3">${row.name}</td>
                                            <td class="column4">${row.customer_account_username}</td>
                                            <td class="column5">${row.amount}</td>
                                            <td class="column6">${row.status}</td>


                                            <c:if test="${row.status == 'paid'}">
                                                <td class="column7">
                                                    <div class="w3-container">
                                                        <a href="#popup${i}">
                                                            <div class="buttonMain w3-container w3-display-container"><div>แก้ไขสถานะสินค้า</div></div>
                                                        </a>
                                                    </div>
                                                </td>

                                        <form id="form${i}" method="POST" action="UpdateOrderStatusServlet">
                                            <div id="popup${i}" class="popup-container">
                                                <div class="popup-content w3-container" style="padding: 6em;">
                                                    <a href="#" class="close">&times;</a>
                                                    <h3>แก้ไขสถานะ</h3>
                                                    <select name="status" form="form${i}">
                                                        <option value="" disabled selected>สถานะ</option>
                                                        <option value="preparing">กำลังจัดเตรียม</option>
                                                        <option value="delivering">อยู่ในระหว่างการส่ง</option>
                                                    </select>
                                                    <input type="hidden" form="form${i}" name="shopping_basket_id" value="${row.id}"/>
                                                    <input type="hidden" form="form${i}" name="item_no" value="${row.item_no}"/>
                                                    <div class="w3-container">
                                                        <div class="buttonMain w3-container w3-right w3-display-container"><button form="form${i}">ยืนยัน</button></div>

                                                    </div>

                                                </div>
                                            </div>
                                        </form>
                                    </c:if>
                                    <c:if test="${row.status == 'preparing'}">
                                        <td class="column7">
                                            <div class="w3-container">
                                                <a href="#popup${i}">
                                                    <div class="buttonMain w3-container w3-display-container"><div>แก้ไขสถานะสินค้า</div></div>
                                                </a>
                                            </div>
                                        </td>
                                        <form id="form${i}" method="POST" action="UpdateOrderStatusServlet">
                                            <div id="popup${i}" class="popup-container">
                                                <div class="popup-content w3-container" style="padding: 6em;">
                                                    <a href="#" class="close">&times;</a>
                                                    <h3>แก้ไขสถานะ</h3>
                                                    <select name="status" form="form${i}">
                                                        <option value="" disabled selected>สถานะ</option>
                                                        <option value="delivering">อยู่ในระหว่างการส่ง</option>
                                                    </select>
                                                    <input type="hidden" form="form${i}" name="shopping_basket_id" value="${row.id}"/>
                                                    <input type="hidden" form="form${i}" name="item_no" value="${row.item_no}"/>
                                                    <div class="w3-container">
                                                        <div class="buttonMain w3-container w3-right w3-display-container"><button form="form${i}">ยืนยัน</button></div>

                                                    </div>

                                                </div>
                                            </div>
                                        </form>
                                    </c:if>
                                    <c:if test="${row.status == 'delivering'}">
                                        <td class="column7">
                                            <div class="w3-container">
                                                <div>กำลังจัดส่ง</div>
                                            </div>
                                        </td>

                                    </c:if>
                                    <c:if test="${row.status == 'received'}">
                                        <td class="column7">
                                            <div class="w3-container">
                                                <div>ได้รับสินค้าแล้ว</div>
                                            </div>
                                        </td>

                                    </c:if>
                                    </tr>
                                    <c:set var="i" value="${i+1}"/>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
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

        <!--===============================================================================================-->  
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>
        <script sec="js/util.js"></script>



    </body>

</html>