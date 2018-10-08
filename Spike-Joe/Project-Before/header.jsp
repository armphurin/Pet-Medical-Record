<%@page import="models.ItemInBasket"%>
<%@page import="models.ShoppingBasket"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wan-jai</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all">
        <link rel="icon" type="image/png" sizes="96x96" href="images/favicon-96x96.png">
        <link rel="stylesheet" href="cart.css">
        <link rel="stylesheet" href="wcart.css">
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1200);
                });
            });
        </script>
        <!-- //Owl Carousel Assets -->
        <!-- start top_js_button -->
        <title>JSP Page</title>
    </head>
    <body>
        <% String searchProduct = "SELECT id, shop_name, name, price, inventory.description, stock, seller_account_username FROM seller, inventory WHERE (seller.account_username = inventory.seller_account_username) ORDER BY name LIMIT 12";
            String searchAllProduct = "SELECT id, shop_name, name, price, inventory.description, stock FROM seller, inventory WHERE (seller.account_username = inventory.seller_account_username) ORDER BY name";
            String searchShop = "SELECT shop_name, address, description, type, account_username FROM seller, store_type WHERE (seller.store_type_id = store_type.id) ORDER BY shop_name LIMIT 12";
            String searchAllShop = "SELECT shop_name, address, description, type, account_username FROM seller, store_type WHERE (seller.store_type_id = store_type.id) ORDER BY shop_name";

            String search_from = "product";
            String keyword = "";
            String url = "viewProduct.jsp";
            if (request.getAttribute("url") != null) {
                url = (String) request.getAttribute("url");
            }
            if (request.getAttribute("searchProduct") != null) {
                searchProduct = (String) request.getAttribute("search");
                keyword = (String) request.getAttribute("keyword");
                searchAllProduct = (String) request.getAttribute("searchAll");
            }
            if (request.getAttribute("search_from") != null) {
                search_from = (String) request.getAttribute("search_from");
                if (search_from.equals("product")) {
                    searchProduct = (String) request.getAttribute("search");
                    keyword = (String) request.getAttribute("keyword");
                    searchAllProduct = (String) request.getAttribute("searchAll");
                } else if (search_from.equals("shop_name")) {
                    searchShop = (String) request.getAttribute("search");
                    keyword = (String) request.getAttribute("keyword");
                    searchAllShop = (String) request.getAttribute("searchAll");
                }
            }
        %>

        <sql:query var="inventory" dataSource="bakery">
            <%=searchProduct%>
        </sql:query>

        <sql:query var="seller" dataSource="bakery">
            <%=searchShop%>
        </sql:query>  

        <datalist id="name">
            <c:forEach var="row" items="${inventory.rows}">
                <option value="${row.name}">
                </c:forEach>
        </datalist>

        <datalist id="shop_name">
            <c:forEach var="row" items="${seller.rows}">
                <option value="${row.shop_name}">
                </c:forEach>
        </datalist>
        
        <% ShoppingBasket cart = (ShoppingBasket) session.getAttribute("cart"); %>
        <% double totalPrice = 0;
            if (cart!=null){
            for (ItemInBasket i : cart.getBasket()){
            totalPrice += (i.getItemPrice()*i.getItemAmount());
            }
        } %>
        <!-- start header -->
        <div class="header_bg">
            <div class="wrap">
                <div class="header">
                    <div class="logo">
                        <a href="index.jsp">
                            <img src="images/logo.jpg" alt="" height="100" width="auto" /> </a>
                    </div>

                    <div class="h_icon">
                        <ul class="icon1 sub-icon1">
                            
                            <% if (session.getAttribute("customer") != null) {
                                    if (cart != null){ %>
                            <li>
                                <a class="active-icon c1" href="#">
                                    <i>฿<%=totalPrice %></i>
                                </a>
                                <ul style="display: block;" class="sub-icon1 list">
                                    <!-- Content cart popup -->
                                    <div class="w3-bottombar w3-container w3-pedding-16 w3-border-orange">
                                        <li class="w3-right w3-large">
                                            <p class="w3-row w3-right">
                                            <div class="w3-cell w3-text-gray">Total : </div>
                                            <div class="w3-cell w3-text-gray">฿<%=totalPrice %></div>
                                            </p>
                                        </li>
                                        <br>
                                        <br>
                                    </div>
                                    <br>
                                    <form action="UpdateShoppingBasketServlet" method="POST">
                                    <div>
                                        
                                        <% for (ItemInBasket i : cart.getBasket()){ %>
                                        <sql:query var="basketPhoto" dataSource="bakery">
                                            SELECT * FROM product_photo WHERE inventory_id = <%=i.getInventoryId() %> ORDER BY RAND() LIMIT 1;
                                        </sql:query> 
                                        <li class="w3-container w3-border-bottom">
                                            <p class="w3-row">
                                            <div class="w3-col" style="width: 30%">
                                                <c:choose>
                                                    <c:when test="${basketPhoto.rows[0].product_photo != null}">
                                                        <img src="${basketPhoto.rows[0].product_photo}" height="55" width="55">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="images/no-image-square.jpg" height="55" width="55">
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="w3-col" style="width: 50%"> <%=i.getItemName() %>
                                                <br> Qty. <%=i.getItemAmount() %> <br> <%=i.getItemPrice()%> THB </div>
                                            <div class="w3-col product-removal" style="width: 20%">
                                                <button type="button" class="w3-button w3-round-xxlarge w3-orange w3-text-white w3-tiny remove-product">remove</button>
                                            </div>
                                            <input type="hidden" name="id" value="<%=i.getInventoryId()%>">
                                            <input type="hidden" name="amount" value="<%=i.getItemAmount()%>">
                                            </p>
                                        </li>
                                        <br>
                                        <% } %>
                                        
                                    </div>
                                    <br>
                                    <input class="w3-button w3-round-xxlarge w3-orange w3-text-white" type="submit" value="Update Shopping Basket" />
                                    <div class="buttoncheckout">
                                        <a href="viewShoppingBasket.jsp">
                                            <button class="w3-button w3-round-xxlarge w3-orange w3-text-white" style="width: 100%">check out</button>
                                        </a>
                                    </div>
                                    </form>
                                </ul>
                            </li>
                            <% } else { %>
                            <li>
                                <a class="active-icon c1">
                                    <i>฿0</i>
                                </a>
                            </li>
                            <% }} %>
                        </ul>
                    </div>

                    <div>
                        <form action="search">
                            <div>
                                <div class="h_search_option">
                                    <span style="float: left;">ค้นหา:</span>
                                    <input type="radio" name="search_from" value="product" checked="checked" /> สินค้า <input type="radio" name="search_from" value="shop_name" /> ร้านค้า
                                    <span style="float: right;">เรียงตาม : <select name="sort" id="select_product">
                                            <option value="name">ชื่อสินค้า</option>
                                            <option value="price (min-max)">ราคา (น้อย-มาก)</option>
                                            <option value="price (max-min)">ราคา (มาก-น้อย)</option>
                                        </select>
                                        <select name="sort" id="select_shop_name" style="display: none" disabled>
                                            <option value="shop name (A-Z)">shop name (A-Z)</option>
                                            <option value="shop name (Z-A)">shop name (Z-A)</option>
                                        </select></span>
                                </div>
                                <div class="h_search">

                                    <input type="text" name="keyword" value="<%=keyword%>" list="name" id="input_product"/>
                                    <input type="text" name="keyword" value="<%=keyword%>" list="shop_name" id="input_shop_name" style="display: none" disabled/>
                                    <input type="hidden" name="sort" value="name" id="select_product"/>
                                    <input type="hidden" name="sort" value="shop_name" id="select_shop_name" disabled/>
                                    <input type="hidden" name="page" value="1"/>
                                    <input type="submit" value="" />
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="header_btm">
            <div class="wrap">
                <div class="header_sub">
                    <div class="h_menu">
                        <ul>
                            <li class="active" style="display: inline-block">
                                <a href="index.jsp">Home</a>
                            </li> |
                            
                            <li style="display: inline-block">
                                <a href="viewProduct.jsp">Product</a>
                            </li>
                            <% if (session.getAttribute("username") != null) { %> |
                            <li style="display: inline-block">
                                <a href="complaint.jsp">Complaint</a>
                            </li><% } %>
                        </ul>

                    </div>
                    <div style="text-align: right;">
                        <% if (session.getAttribute("username") != null) { %>
                        <div class="dropdown" style="display: inline-block;">
                            
                                
                                <% if (session.getAttribute("customer") != null){ %>
                                <button class="dropbtn1">My Account</button>
                            <div class="dropdown-content" style="text-align: left; z-index: 100">
                                <a href="viewProfile.jsp">Profile</a>
                                <a href="orderStatus.jsp">View order history</a>
                                <a href="SignoutServlet">Logout</a>
                                </div>
                                <% } else if (session.getAttribute("seller") != null){ %>
                                <button class="dropbtn1">My Account</button>
                            <div class="dropdown-content" style="text-align: left; z-index: 100">
                                <a href="viewProfile.jsp">Profile</a>
                                <a href="manageOrder.jsp">View order</a>
                                <a href="dailyReport.jsp">Daily Report</a>
                                <a href="editShop.jsp">Edit shop</a>
                                <a href="SignoutServlet">Logout</a>
                                </div>
                                <% } else { %>
                                <form method="POST" action="signin.html"><button class="dropbtn1">SIGN IN</button></form>
                                <% } %>
                                
                            
                        </div>
                        <% } else { %>
                        <div class="dropdown" style="display: inline-block;">
                            <form method="POST" action="signin.html"><button class="dropbtn1">SIGN IN</button></form>
                        </div>
                        <% }%>
                    </div>
                    <div class="top-nav">
                        <nav class="nav">
                            <a href="#" id="w3-menu-trigger"> </a>
                            <ul class="nav-list" style="">
                                <li class="nav-item">
                                    <a class="active" href="index.html">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a href="viewProduct.jsp">Product</a>
                                </li>
                                <li class="nav-item">
                                    <a href="complaint.jsp">Complaint</a>
                                </li>
                            </ul>
                        </nav>
                        <div class="search_box">
                            <form>
                                <input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {
                                            this.value = 'Search';
                                        }">
                                <input type="submit" value="">
                            </form>
                        </div>
                        <div class="clear"> </div>
                        <script src="js/responsive.menu.js"></script>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <!-- end header -->

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
        <script type="text/javascript">
            var fadeTime = 300;
            $('.product-removal button').click(function () {
                removeItem(this);
            });
            function removeItem(removeButton)
            {
                /* Remove row from DOM and recalc cart total */
                var productRow = $(removeButton).parent().parent();
                productRow.slideUp(fadeTime, function () {
                    productRow.remove();
                });
            }
        </script>
    </body>
</html>
