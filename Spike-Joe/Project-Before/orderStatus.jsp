<%@page import="models.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 

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
        <link rel="stylesheet" href="css/popup2.css">
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
        <script type="text/javascript" src="https//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

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
                    <h2>Order Status</h2>
                </div>
            </div>
        </div>

        <% Account account = (Account) session.getAttribute("account");
            String username = account.getUsername();
            System.out.println(username);
        %>

        <sql:query var="status" dataSource="bakery">
            SELECT review.id 'reviewId', order_item.inventory_id, order_item.item_no, order_item.status, date(shopping_basket.order_completion_time) 'date', order_item.shopping_basket_id, inventory.name, order_item.price, order_item.amount
            FROM order_item
            JOIN inventory ON (order_item.inventory_id = inventory.id)
            JOIN shopping_basket ON (shopping_basket.id = order_item.shopping_basket_id)
            LEFT OUTER JOIN review ON (review.order_item_item_no = order_item.item_no) AND (review.order_item_shopping_basket_id = order_item.shopping_basket_id)
            WHERE shopping_basket.customer_account_username = '<%=username%>'
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
                                        <th class="column2">Order ID</th>
                                        <th class="column3">Name</th>
                                        <th class="column4">Price</th>
                                        <th class="column5">Quantity</th>
                                        <th class="column6">Total</th>
                                        <th class="column7">Status</th>
                                        <th class="column8">Button</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="i" value="${1}"/>
                                    <c:forEach var="row" items="${status.rows}">
                                        <tr>
                                            <td class="column1">${row.date}</td>
                                            <td class="column2">${row.shopping_basket_id}</td>
                                            <td class="column3">${row.name}</td>
                                            <td class="column4">${row.price}</td>
                                            <td class="column5">${row.amount}</td>
                                            <td class="column6">${row.price*row.amount}</td>
                                            <td class="column7">${row.status}</td>
                                            
                                            <td class="column8">
                                                <c:if test="${row.status == 'delivering'}">
                                                <div class="w3-container">
                                                    <a href="#popup${i}">
                                                        <div class="buttonMain w3-container w3-display-container"><div>แก้ไขสถานะสินค้า</div></div>
                                                    </a>
                                                </div>
                                                        </c:if>
                                                <c:if test="${row.status == 'received'}">
                                                    <c:choose>
                                                        <c:when test="${row.id == null}">
                                                            <div class="w3-container">
                                                   
                                                    <a href="productDetail?id=${row.inventory_id}">
                                                        <div class="buttonMain w3-container w3-display-container"><div>รีวิวสินค้า</div></div>
                                                    </a>
                                                </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div>รีวิวเสร็จสิ้น</div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                
                                                        </c:if>
                                                
                                            </td>
                                            
                                        </tr>
                                        <c:if test="${row.status == 'delivering'}">
                                    <form id="form${i}" method="POST" action="UpdateStatusServlet">
                                        <div id="popup${i}" class="popup-container">
                                            <div class="popup-content w3-container" style="padding: 6em;">
                                                <a href="#" class="close">&times;</a>
                                                <h3>แก้ไขสถานะ</h3>
                                                <select name="status">
                                                    <option value="" disabled selected>สถานะ</option>
                                                    <option value="received">ได้รับสินค้าแล้ว</option>
                                                </select>

                                                <div class="w3-container">
                                                    <div class="buttonMain w3-container w3-right w3-display-container"><button form="form${i}">ยืนยัน</button></div>

                                                </div>
                                                    <input type="hidden" name="item_no" form="form${i}" value="${row.item_no}"/>
                                                    <input type="hidden" name="shopping_basket_id" form="form${i}" value="${row.shopping_basket_id}"/>
                                            </div>
                                        </div>
                                    </form>
                                        </c:if>

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
