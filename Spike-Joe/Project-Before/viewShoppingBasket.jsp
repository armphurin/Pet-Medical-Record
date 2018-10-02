<%@page import="models.*"%>
<%@page import="java.math.RoundingMode"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Wan-Jai</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="icon" type="image/png" sizes="96x96" href="images/favicon-96x96.png">
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/fontgoogle.css">
        <link rel="stylesheet" href="css/w3.css">
        <link rel="stylesheet" href="bootstrap3/css/bootstrap.min.css">
        <link href="css/shoppingbasket.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <script src="js/jquery.min.js"></script> 
        <!-- start top_js_button -->
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
        
        <% String name = null;%>
            <% double allPrice = 0;
                DecimalFormat df = new DecimalFormat("#.###");
                df.setRoundingMode(RoundingMode.FLOOR); %>
            
        
        <form action="UpdateShoppingBasketServlet" method="POST">
        <div class="card">
            <h1 class="w3-center w3-xxlarge w3-padding-16">Shopping List</h1>
            <div class="separator"></div>
            <div class="row" style="padding-bottom: 2em;">
                <div class="col-sm-3 w3-xlarge">Image</div>
                <div class="col-sm-5 w3-xlarge">Product</div>
                <div class="col-sm-1 w3-xlarge">Price</div>
                <div class="col-sm-1 w3-xlarge">Quantity</div>
                <div class="col-sm-1 w3-xlarge">Remove</div>
                <div class="col-sm-1 w3-xlarge">Total</div>
            </div>
            
            <% try {
                    for (ItemInBasket i : cart.getBasket()) {%>
            <div>
            <div class="row product">
                <div class="col-sm-3">
                    <sql:query var="basketPhoto" dataSource="bakery">
                                            SELECT * FROM product_photo WHERE inventory_id = <%=i.getInventoryId() %> ORDER BY RAND() LIMIT 1;
                                        </sql:query>
                                                <c:choose>
                                                    <c:when test="${basketPhoto.rows[0].product_photo != null}">
                                                        <img src="${basketPhoto.rows[0].product_photo}" style="width: 200px; height: 200px; object-fit: cover;">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="images/no-image-square.jpg" style="width: 200px; height: 200px; object-fit: cover;">
                                                    </c:otherwise>
                                                </c:choose>
                </div>
                <div class="col-sm-5 product-details">
                    <div class="product-title w3-xlarge"><%=i.getItemName()%></div>
                    <input type="hidden" name="id" value="<%=i.getInventoryId()%>">
                </div>
                <div class="col-sm-1 product-price w3-xlarge"><%=i.getItemPrice()%></div>
                <div class="col-sm-1 product-quantity w3-xlarge">
                    <input style="max-width: 3em;" type="number" width="3" name="amount" value="<%=i.getItemAmount()%>" min="1">
                </div>
                <div class="col-sm-1 product-removal w3-xlarge">
                    <button class="remove-product" type="button">
                        Remove
                    </button>
                </div>
                <div class="col-sm-1 product-line-price w3-xlarge">
                    <%=i.getItemPrice() * i.getItemAmount()%>
                </div>
            </div>
                <div class="separator" style="padding-top: 2em; padding-bottom: 2em; margin-top: 2em;"></div>
            </div>
            <% allPrice += i.getItemPrice() * i.getItemAmount(); } %>
            <div class="totals" style="text-align: right; margin-top: 2%;">
                <div class="totals-item">
                    <label>Subtotal</label>
                    <div class="totals-value w3-xlarge" id="cart-subtotal"><%=allPrice%></div>
                </div>
                <div class="totals-item totals-item-total">
                    <label>Grand Total</label>
                    <div class="totals-value w3-xlarge" id="cart-total"><%=allPrice%></div>
                </div>
            </div>
                
                <div style="text-align: right; margin-top: 2%;">
                <input class="w3-button w3-button-3 w3-button-hover-3 w3-round-xlarge" type="submit" value="Update Shopping Basket" />
                    <% if (cart.getBasket().size() > 0) { %>
                <input class="w3-button w3-button-3 w3-button-hover-3 w3-round-xlarge" type="submit" name="checkout" value="Check out" />
                </div>
                
                    <% } } catch (Exception e) {
                        System.out.println("error");
                    }
                %>
        </div>
        </form>
           
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
                    <a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
                    <!--end scroll_top_btn -->
                    <div class="copy">
                        <p class="link">&copy;  All rights reserved | © Project website 2018</p>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        
        

        <script type="text/javascript">
            /* Set rates + misc */
            var fadeTime = 300;


            /* Assign actions */
            $('.product-quantity input').change(function () {
                updateQuantity(this);
            });

            $('.product-removal button').click(function () {
                removeItem(this);
            });


            /* Recalculate cart */
            function recalculateCart()
            {
                var subtotal = 0;

                /* Sum up row totals */
                $('.product').each(function () {
                    subtotal += parseFloat($(this).children('.product-line-price').text());
                });

                /* Calculate totals */
                var total = subtotal;

                /* Update totals display */
                $('.totals-value').fadeOut(fadeTime, function () {
                    $('#cart-subtotal').html(subtotal.toFixed(2));
                    $('#cart-total').html(total.toFixed(2));
                    if (total == 0) {
                        $('.checkout').fadeOut(fadeTime);
                    } else {
                        $('.checkout').fadeIn(fadeTime);
                    }
                    $('.totals-value').fadeIn(fadeTime);
                });
            }


            /* Update quantity */
            function updateQuantity(quantityInput)
            {
                /* Calculate line price */
                var productRow = $(quantityInput).parent().parent();
                var price = parseFloat(productRow.children('.product-price').text());
                var quantity = $(quantityInput).val();
                var linePrice = price * quantity;

                /* Update line price display and recalc cart totals */
                productRow.children('.product-line-price').each(function () {
                    $(this).fadeOut(fadeTime, function () {
                        $(this).text(linePrice.toFixed(2));
                        recalculateCart();
                        $(this).fadeIn(fadeTime);
                    });
                });
            }


            /* Remove item from cart */
            function removeItem(removeButton)
            {
                /* Remove row from DOM and recalc cart total */
                var productRow = $(removeButton).parent().parent().parent();
                productRow.slideUp(fadeTime, function () {
                    productRow.remove();
                    recalculateCart();
                });
            }


        </script>
    </body>
</html>