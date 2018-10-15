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
        <link rel="stylesheet" href="bootstrap3/css/bootstrap.min.css" type="text/css">
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
    </head>

    <body>
        <%@ include file="header.jsp" %>          

        <sql:query var="inventory" dataSource="bakery">
            <%=searchProduct%>
        </sql:query>

        <sql:query var="seller" dataSource="bakery">
            <%=searchShop%>
        </sql:query>
        
        
        
        <% if (search_from.equals("product")) {%>

        <sql:query var="count" dataSource="bakery">
            <%=searchAllProduct%>
        </sql:query>
        <c:set var="count" value="${count.rowCount}"/>
        <% int count = (int) pageContext.getAttribute("count");
            int pageNum = (int) Math.ceil((double) count / 12);
            int before_page = 1;
            if (request.getAttribute("before_page") != null) {
                before_page = Integer.parseInt((String) request.getAttribute("before_page"));
            }
        %>

        <!-- start main -->
        <!-- sเลือกเรียงรายการสินค้าจาก -->
        <div class="main_bg1">
            <div class="wrap">
                <div class="main1">
                    <h2>featured products</h2>
                    <div class="dropdown">
                        <button class="dropbtn">SHOW</button>
                        <div class="dropdown-content">
                            <a href="search?keyword=<%=keyword%>&sort=name&page=1">A-Z</a>
                            <a href="search?keyword=<%=keyword%>&sort=price+(min-max)&page=1">ราคา (น้อย-มาก)</a>
                            <a href="search?keyword=<%=keyword%>&sort=price+(max-min)&page=1">ราคา (มาก-น้อย)</a>
                        </div>
                    </div>
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
                </div>
            </div>
            <div class="pagmore">
                <div class="pagination">
                    <% for (int i = 1; i < pageNum + 1; i++) {
                                if (before_page != 1 && i == 1) {
                                    if (url.equals("viewProduct.jsp")) {%>
                    <a href="search?keyword=&sort=name&page=<%=i%>">&laquo;</a>
                    <% } else {%>
                    <a href="<%=url%>&page=<%=i%>">&laquo;</a>
                    <% }
                        }
                        if (url.equals("viewProduct.jsp")) {
                                        if (i == 1) {%>
                    <a href="search?keyword=&sort=name&page=<%=i%>" class="active"><%=i%></a>
                    <% } else {%>
                    <a href="search?keyword=&sort=name&page=<%=i%>"><%=i%></a>
                    <% }
                                } else {
                                    if (i == before_page) {%>
                    <a href="<%=url%>&page=<%=i%>" class="active"><%=i%></a> <!-- add query text -->
                    <% } else {%>
                    <a href="<%=url%>&page=<%=i%>"><%=i%></a>
                    <% }
                        }
                        if (before_page != pageNum && i == pageNum) {
                                        if (url.equals("viewProduct.jsp")) {%>
                    <a href="search?keyword=&sort=name&page=<%=i%>">&raquo;</a>
                    <% } else {%>
                    <a href="<%=url%>&page=<%=i%>">&raquo;</a>
                    <% }
                                        }
                                    }%>
                </div>
            </div>
        </div>

        <% } else if (search_from.equals("shop_name")) {%>

        <sql:query var="count" dataSource="bakery">
            <%=searchAllShop %>
        </sql:query>

        <c:set var="count" value="${count.rowCount}"/>
        
        <% int count = (int) pageContext.getAttribute("count");
            int pageNum = (int) Math.ceil((double) count / 12);
            int before_page = 1;
            if (request.getAttribute("before_page") != null) {
                before_page = Integer.parseInt((String) request.getAttribute("before_page"));
            }
        %>
        

        <!-- start main -->
        <!-- sเลือกเรียงรายการสินค้าจาก -->
        <div class="main_bg1">
            <div class="wrap">
                <div class="main1">
                    <h2>featured products</h2>
                    <div class="dropdown">
                        <button class="dropbtn">SHOW</button>
                        <div class="dropdown-content">
                            <a href="search?search_from=shop_name&keyword=<%=keyword%>&sort=shop+name+(A-Z)&page=1">ชื่อร้านค้า (A-Z)</a>
                            <a href="search?search_from=shop_name&keyword=<%=keyword%>&sort=shop+name+(Z-A)&page=1">ชื่อร้านค้า (Z-A)</a>
                            <!--<a href="search?keyword=<%=keyword%>&sort=price+(max-min)&page=1">ราคา (มาก-น้อย)</a>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- แสดงรายการสินค้าเรียงตาม A-z -->
        <div class="main_bg">
            <div class="wrap">
                <div class="main">
                    <c:set var = "count_row" value = "${0}"/>
                    <!-- รายการสินค้า -->
                    <c:forEach var="row" items="${seller.rows}">
                        <c:if test = "${count_row%3 == 0}">
                            <div class="grids_of_3">
                            </c:if>
                                <sql:query var="photo" dataSource="bakery">
                                SELECT store_photo FROM store_photo WHERE seller_account_username = '${row.account_username}' ORDER BY RAND() LIMIT 1;
                            </sql:query>
                            <div class="grid1_of_3">
                                    <c:choose>
                                    <c:when test="${photo.rowCount != 0}">
                                        <img src="${photo.rows[0].store_photo}" style="height: 150px; width: 150px; object-fit: cover;" alt=""/>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="images/pic1.png" style="height: 150px; width: 150px; object-fit: cover;" alt=""/>
                                    </c:otherwise>
                                </c:choose>
                                    <form action="viewShop.jsp" method="post" target="_blank">
                                        <a href="javascript:;" onclick="parentNode.submit();" style="text-decoration: none;"><h3>${row.shop_name}</h3></a>
                                        <input type="hidden" name="seller_username" value="${row.account_username}"/>
                                    </form>
                                <div class="price">
                                    <h4>
                                        <form style="display: inline;" action="viewShop.jsp" method="POST" target="_blank">
                                            <button name="seller_username" value="${row.account_username}">Go to shop</button>
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
                </div>
            </div>
            <div class="pagmore">
                <div class="pagination">
                    <% for (int i = 1; i < pageNum + 1; i++) {
                                if (before_page != 1 && i == 1) {
                                    if (url.equals("viewProduct.jsp")) {%>
                    <a href="search?keyword=&sort=shop+name+%28A-Z%29&page=<%=i%>">&laquo;</a>
                    <% } else {%>
                    <a href="<%=url%>&page=<%=i%>">&laquo;</a>
                    <% }
                        }
                        if (url.equals("viewProduct.jsp")) {
                                        if (i == 1) {%>
                    <a href="search?keyword=&sort=shop+name+%28A-Z%29&page=<%=i%>" class="active"><%=i%></a>
                    <% } else {%>
                    <a href="search?keyword=&sort=shop+name+%28A-Z%29&page=<%=i%>"><%=i%></a>
                    <% }
                                } else {
                                    if (i == before_page) {%>
                    <a href="<%=url%>&page=<%=i%>" class="active"><%=i%></a> <!-- add query text -->
                    <% } else {%>
                    <a href="<%=url%>&page=<%=i%>"><%=i%></a>
                    <% }
                        }
                        if (before_page != pageNum && i == pageNum) {
                                        if (url.equals("viewProduct.jsp")) {%>
                    <a href="search?keyword=&shop+name+%28A-Z%29&page=<%=i%>">&raquo;</a>
                    <% } else {%>
                    <a href="<%=url%>&page=<%=i%>">&raquo;</a>
                    <% }
                                        }
                                    }%>
                </div>
            </div>
        </div>

        <% }%>



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
            function addAlert() {
                alert('สินค้าถูกเพิ่มเข้าตะกร้า');
            }
        </script>

        <script>
            $(function () {
                $('input[name="search_from"]').on('click', function () {
                    if ($(this).val() == 'shop_name') {
                        $('#input_product').hide();
                        document.getElementById('input_product').disabled = true;
                        $('#select_product').hide();
                        document.getElementById('select_product').disabled = true;
                        $('#input_shop_name').show();
                        document.getElementById('input_shop_name').disabled = false;
                        $('#select_shop_name').show();
                        document.getElementById('select_shop_name').disabled = false;
                    } else {
                        $('#input_product').show();
                        document.getElementById('input_product').disabled = false;
                        $('#select_product').show();
                        document.getElementById('select_product').disabled = false;
                        $('#input_shop_name').hide();
                        document.getElementById('input_shop_name').disabled = true;
                        $('#select_shop_name').hide();
                        document.getElementById('select_shop_name').disabled = true;
                    }
                });
            });
        </script>


    </body>

</html>
