<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Wan-jai</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="icon" type="image/png" sizes="96x96" href="images/favicon-96x96.png">
        <link href="css/fontgoogle.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all">
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/productviewgallery.css" media="all" />
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
        <link href="css/slider.css" rel="stylesheet" type="text/css" media="all">
        <script type="text/javascript" src="js/modernizr.custom.28468.js"></script>
        <script type="text/javascript" src="js/jquery.cslider.js"></script>
        <script type="text/javascript">
            $(function () {
                $('#da-slider').cslider();
            });
        </script>
        <!-- Owl Carousel Assets -->
        <link href="css/owl.carousel.css" rel="stylesheet">
        <!-- Owl Carousel Assets -->
        <!-- Prettify -->
        <script src="js/owl.carousel.js"></script>
        <script>
            $(document).ready(function () {

                $("#owl-demo").owlCarousel({
                    items: 4,
                    lazyLoad: true,
                    autoPlay: true,
                    navigation: true,
                    navigationText: ["", ""],
                    rewindNav: false,
                    scrollPerPage: false,
                    pagination: false,
                    paginationNumbers: false
                });

            });
        </script>
        
    </head>

    <body>
        <%@ include file="header.jsp" %>

        <!-- start slider -->
        <div id="da-slider" class="da-slider">
            <div class="da-slide">
                <h2>Welcome to Wanjai Bakery</h2>
                <p>ขอต้อนรับสู่เว็บไซต์ของเรา หวานใจเบเกอรี่ เว็บไซต์ที่จะทำให้คุณเพลิดเพลินกับของหวานนานาชนิด ที่จะได้เลือกสรร หากคุณเป็นคนที่ต้องการหาของหวานแล้วละก็ หวานใจจะแนะนำของหวานที่ดีให้คุณเอง</p>
                <a href="viewProduct.jsp" class="da-link">shop now</a>
                <div class="da-img">
                    <img src="images/bakeslider1.png" alt="image01"> </div>
            </div>
            <div class="da-slide">
                <h2>Easy to Buy</h2>
                <p>หวานใจง่ายต่อการทำหาซื้อสินค้าของหวานนานาชนิดเพียงแค่ พิมพ์ชื่อค้นหาเท่านั้น ดราจะนำเสนอเมนูของหวานให้กับคุณ</p>
                <a href="details.html" class="da-link">shop now</a>
                <div class="da-img">
                    <img src="images/bakeslider2.png" alt="image01"> </div>
            </div>
            <div class="da-slide">
                <h2>Register to more Function</h2>
                <p>เพียงคุณสมัครสมาชิกกับทางเราเท่านั้น คุณก็จะสามารถซื้อสินค้าจากเว็บเราง่ายๆ ไปเลย</p>
                <a href="details.html" class="da-link">shop now</a>
                <div class="da-img">
                    <img src="images/slider3.png" alt="image01"> </div>
            </div>
            <div class="da-slide">
                <h2>Create you store</h2>
                <p>หวานใจเปิดโอกาสให้คนที่สนใจขายเบเกอรี่ทุกคนสามารถสมัคร และเปิดร้านกับเราได้ง่ายๆ เพียงแค่คลิกที่เข้าสู่ระบบและสมัครสมาชิกเท่านั้น</p>
                <a href="details.html"
                   class="da-link">shop now</a>
                <div class="da-img">
                    <img src="images/slider4.png" alt="image01"> </div>
            </div>
            <nav class="da-arrows"> <span class="da-arrows-prev"></span> <span class="da-arrows-next"></span> </nav>
        </div>
        <!----start-cursual---->
        <div class="wrap">
            <!----start-img-cursual---->
            <div id="owl-demo" class="owl-carousel">
                <div class="item" onclick="location.href = 'details.html';">
                    <div class="cau_left">
                        <img class="lazyOwl" data-src="images/c1.png" alt="Lazy Owl Image"> </div>
                    <div class="cau_left">
                        <h4>
                            <a href="search?search_from=shop_name&sort=shop+name+%28A-Z%29&keyword=thai&page=1">Thai</a>
                        </h4>
                        <a href="search?search_from=shop_name&sort=shop+name+%28A-Z%29&keyword=thai&page=1" class="btn">shop</a>
                    </div>
                </div>
                <div class="item" onclick="location.href = 'details.html';">
                    <div class="cau_left">
                        <img class="lazyOwl" data-src="images/c2.png" alt="Lazy Owl Image"> </div>
                    <div class="cau_left">
                        <h4>
                            <a href="search?search_from=shop_name&sort=shop+name+%28A-Z%29&keyword=western&page=1">Western</a>
                        </h4>
                        <a href="search?search_from=shop_name&sort=shop+name+%28A-Z%29&keyword=western&page=1" class="btn">shop</a>
                    </div>
                </div>
                <div class="item" onclick="location.href = 'details.html';">
                    <div class="cau_left">
                        <img class="lazyOwl" data-src="images/c3.png" alt="Lazy Owl Image"> </div>
                    <div class="cau_left">
                        <h4>
                            <a href="search?search_from=shop_name&sort=shop+name+%28A-Z%29&keyword=japanese&page=1">Japanese</a>
                        </h4>
                        <a href="search?search_from=shop_name&sort=shop+name+%28A-Z%29&keyword=japanese&page=1" class="btn">shop</a>
                    </div>
                </div>
            </div>
            <!----//End-img-cursual---->
        </div>
        <!-- start main1 -->
        <div class="main_bg1">
            <div class="wrap">
                <div class="main1">
                    <h2>featured products</h2>
                </div>
            </div>
        </div>

        <sql:query var="inventory" dataSource="bakery">
            SELECT * FROM inventory JOIN seller ON (inventory.seller_account_username = seller.account_username) ORDER BY RAND() LIMIT 6;
        </sql:query>

        <!-- start main -->
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
                                <div class="price">
                                    <h4>
                                        <form style="display: inline;" action="viewShop.jsp" method="POST" target="_blank">
                                            <button name="seller_username" value="${row.seller_account_username}">Go to shop</button>
                                        </form>
                                        <form style="display: inline;" action="AddProductServlet" method="POST">
                                            <button name="add" value="${row.id}" onclick="addAlert()">Add to cart</button>
                                        </form>
                                    </h4>
                                </div>
                                <span class="b_btm"></span>

                            </div>
                            <c:if test = "${count_row%3 == 2}">
                            </div>
                            <div class="clear"></div>
                        </c:if>
                        <c:set var = "count_row" value = "${count_row+1}"/>
                    </c:forEach>
                    <div class="clear"></div>
                </div>
                <!-- end grids_of_3 -->
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
                    <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"></span> </a>
                    <!--end scroll_top_btn -->
                    <div class="copy">
                        <p class="link">&copy;  All rights reserved | © Project website 2018
                        </p>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
    </body>

</html>