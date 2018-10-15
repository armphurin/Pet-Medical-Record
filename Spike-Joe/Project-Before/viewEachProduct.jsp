<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
    <head>
        <title>Wan-jai</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="icon" type="image/png" sizes="96x96" href="images/favicon-96x96.png">
        <link href='css/fontgoogle.css' rel='stylesheet' type='text/css'> 
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link rel="stylesheet" href="css/popup2.css"/>
        <link rel="stylesheet" href="css/rating.css"/>
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
            ul.beeRating {
                float: right;

                list-style: none;
            }
            .beeRating li {
                display: inline-block;
                opacity: .25;
                font-size: 150%;
                cursor: pointer;
                color: orange;
            }
        </style>


        <!-- add bootstrap -->
        <link rel="stylesheet" href="bootstrap3/css/bootstrap.min.css">
    </head>
    <body>
        <jsp:useBean id="product" class="models.Product" scope="request"/>
        <jsp:useBean id="seller_seller" class="models.Seller" scope="request"/>
        <jsp:useBean id="seller_account" class="models.Account" scope="request"/>
        <jsp:useBean id="account" class="models.Account" scope="session"/>

        <%@ include file="header.jsp" %>   

        <!-- start main -->
        <div class="main_bg">
            <div class="wrap">	
                <div class="main">
                    <!-- start content -->
                    <div class="single">
                        <!-- แสดงรายละเอียดสินค้า -->
                        <div class="left_content">
                            <div class="span1_of_1">
                                <!-- รูปแสดงสินค้า -->
                                <div class="product-view">
                                    <div class="product-essential">
                                        <div class="product-img-box">
                                            <div class="more-views" style="float:left;">
                                                <div class="more-views-container">
                                                    <ul>
                                                        <li>
                                                            <a class="cs-fancybox-thumbs" data-fancybox-group="thumb" style="width:64px;height:85px;" href=""  title="" alt="">
                                                                <img src="" src_main=""  title="" alt="" /></a>            
                                                        </li>
                                                        <li>
                                                            <a class="cs-fancybox-thumbs" data-fancybox-group="thumb" style="width:64px;height:85px;" href=""  title="" alt="">
                                                                <img src="" src_main=""  title="" alt="" /></a>
                                                        </li>
                                                        <li>
                                                            <a class="cs-fancybox-thumbs" data-fancybox-group="thumb" style="width:64px;height:85px;" href=""  title="" alt="">
                                                                <img src="" src_main=""  title="" alt="" /></a> 
                                                        </li>
                                                        <li>
                                                            <a class="cs-fancybox-thumbs" data-fancybox-group="thumb" style="width:64px;height:85px;" href=""  title="" alt="">
                                                                <img src="" src_main="" title="" alt="" /></a>  
                                                        </li>
                                                        <li>
                                                            <a class="cs-fancybox-thumbs" data-fancybox-group="thumb" style="width:64px;height:85px;" href=""  title="" alt="">
                                                                <img src="" src_main="" title="" alt="" /></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <sql:query var="photo" dataSource="bakery">
                                                SELECT * FROM product_photo WHERE inventory_id = ${product.productId} ORDER BY RAND() LIMIT 5
                                            </sql:query>
                                            <div class="product-image"> 
                                                <a class="cs-fancybox-thumbs cloud-zoom" rel="adjustX:30,adjustY:0,position:'right',tint:'#202020',tintOpacity:0.5,smoothMove:2,showTitle:true,titleOpacity:0.5" data-fancybox-group="thumb" href="${photo.rows[0].product_photo}" title="Product Show Picture" alt="product">
                                                    <img src="${photo.rows[0].product_photo}" alt="Photo Main" title="Bakery Preview" style="object-fit: cover; width: 100%;" />
                                                </a>
                                            </div>
                                                    <c:set var="str" value="{\"prod_1\":{\"main\":{\"orig\":\"${photo.rows[0].product_photo}\",\"main\":\"${photo.rows[0].product_photo}\",\"thumb\":\"${photo.rows[0].product_photo}\",\"label\":\"\"},\"gallery\":{\"item_0\":{\"orig\":\"${photo.rows[0].product_photo}\",\"main\":\"${photo.rows[0].product_photo}\",\"thumb\":\"${photo.rows[0].product_photo}\",\"label\":\"\"},\"item_1\":{\"orig\":\"${photo.rows[1].product_photo}\",\"main\":\"${photo.rows[1].product_photo}\",\"thumb\":\"${photo.rows[1].product_photo}\",\"label\":\"\"},\"item_2\":{\"orig\":\"${photo.rows[2].product_photo}\",\"main\":\"${photo.rows[2].product_photo}\",\"thumb\":\"${photo.rows[2].product_photo}\",\"label\":\"\"},\"item_3\":{\"orig\":\"${photo.rows[3].product_photo}\",\"main\":\"${photo.rows[3].product_photo}\",\"thumb\":\"${photo.rows[3].product_photo}\",\"label\":\"\"},\"item_4\":{\"orig\":\"${photo.rows[4].product_photo}\",\"main\":\"${photo.rows[4].product_photo}\",\"thumb\":\"${photo.rows[4].product_photo}\",\"label\":\"\"}},\"type\":\"simple\",\"video\":false}}"/>

                                            <script type="text/javascript">
                                                var prodGallery = jQblvg.parseJSON('${str}'),
                                                        gallery_elmnt = jQblvg('.product-img-box'),
                                                        galleryObj = new Object(),
                                                        gallery_conf = new Object();
                                                gallery_conf.moreviewitem = '<a class="cs-fancybox-thumbs" data-fancybox-group="thumb" style="width:64px;height:85px;" href=""  title="" alt=""><img src="" src_main="" width="64" height="85" title="" alt="" /></a>';
                                                gallery_conf.animspeed = 200;
                                                jQblvg(document).ready(function () {
                                                    galleryObj[1] = new prodViewGalleryForm(prodGallery, 'prod_1', gallery_elmnt, gallery_conf, '.product-image', '.more-views', 'http:');
                                                    jQblvg('.product-image .cs-fancybox-thumbs').absoluteClick();
                                                    jQblvg('.cs-fancybox-thumbs').fancybox({prevEffect: 'none',
                                                        nextEffect: 'none',
                                                        closeBtn: true,
                                                        arrows: true,
                                                        nextClick: true,
                                                        helpers: {
                                                            thumbs: {
                                                                width: 64,
                                                                height: 85,
                                                                position: 'bottom'
                                                            }
                                                        }
                                                    });
                                                    jQblvg('#wrap').css('z-index', '100');
                                                    jQblvg('.more-views-container').elScroll({type: 'vertical', elqty: 4, btn_pos: 'border', scroll_speed: 400});
                                                });
                                                function initGallery(a, b, element) {
                                                    galleryObj[a] = new prodViewGalleryForm(prods, b, gallery_elmnt, gallery_conf, '.product-image', '.more-views', '');
                                                }
                                                ;
                                            </script>
                                        </div>
                                    </div>
                                </div>
                                <!-- end product_slider -->
                            </div>
                            <!-- Option ของ การสั่งซื้อ เลือกสี เลือกขนาด จำนวน -->
                            <div class="span1_of_1_des">
                                <div class="desc1">
                                    <h3><%=product.getProductName()%></h3>
                                    <% if (product.getProductDescription() != null) { %>
                                        <p><%=product.getProductDescription() %></p>
                                    <% } %>
                                    <h5><%=product.getProductPrice()%> บาท</h5>
                                    <% if (product.getProductStock() == 0){ %>
                                    <h4 style="color: red; font-weight: bold;">OUT OF STOCK</h4>
                                    <% } else { %>
                                    <h4>จำนวนคงเหลือ : <%=product.getProductStock()%></h4>
                                    <form action="AddProductServlet" method="POST">
                                        <div class="available">
                                            จำนวน <input type="number" name="amount" value="1" min="1" max="<%=product.getProductStock()%>"><br>
                                            <div class="btn_form">


                                                <button class="btn btn-info" name="add" value="<%=product.getProductId()%>" onclick="addAlert()">Add to cart</button>

                                            </div>
                                            <div class="clear"></div>
                                        </div>
                                    </form>
                                    <% } %>
                                    

                                </div>
                            </div>
                            <div class="clear"></div>
                            <!-- start tabs -->
                            <section class="tabs">
                                <input id="tab-1" type="radio" name="radio-set" class="tab-selector-1" checked="checked">
                                <label for="tab-1" class="tab-label-1" style="width: 40%">รายละเอียด</label>

                                <input id="tab-2" type="radio" name="radio-set" class="tab-selector-2">
                                <label for="tab-2" class="tab-label-2" style="width: 40%;">กฏของร้านค้า</label>

                                <div class="clear-shadow"></div>

                                <div class="content">
                                    <div class="content-1">
                                        <p class="para top">
                                            <% if (product.getProductDescription() != null) { %>
                                        <p><%=product.getProductDescription() %></p>
                                    <% } %>
                                        </p>
                                        <div class="clear"></div>
                                    </div>
                                    <div class="content-2">
                                        <p class="para">
                                            <span>กฎของร้านค้า</span></p>
                                        <p><%=seller_seller.getStoreTerm() %></p>

                                    </div>

                                </div>
                            </section>
                            <!-- end tabs -->
                        </div>
                        <!-- start sidebar -->
                        <div class="left_sidebar">
                            <div class="sellers">
                                <form action="ViewShopServlet" method="POST" target="_blank">
                                    <h4><button style="border:none;  outline:none;  background:none;  cursor:pointer;  color:#0000EE;  padding:0;  text-decoration:none; color: inherit;  font-family:inherit;  font-size:inherit;" name="seller_username" value="<%=seller_account.getUsername()%>"><%=seller_seller.getStoreName()%></button></h4>
                                </form>
                                    <sql:query var="allProduct" dataSource="bakery">
                                        SELECT * FROM inventory WHERE seller_account_username = '<%=seller_account.getUsername() %>'
                                    </sql:query>
                                
                                <div class="single-nav">
                                    <ul>
                                        <c:forEach var="row" items="${allProduct.rows}">
                                            <li><a href="productDetail?id=${row.id}">${row.name}</a></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                                
                                <% if (product.getMinimum() != 0) {%>                                                             
                                <div class="banner-wrap bottom_banner color_link">
                                    <a href="#" class="main_link">
                                        <figure><img src="images/delivery.png" alt=""></figure>
                                        <h5><span>Free Shipping</span><br> เมื่อสั่งมากกว่า <%=product.getMinimum()%> ชิ้นขึ้นไป</h5></a>
                                </div>
                                        <%
                                    }%>
                            </div>
                        </div>
                        <!-- end sidebar -->
                        <div class="clear"></div>
                    </div>	
                    <!-- end content -->
                    <sql:query dataSource="bakery" var="check">
                        SELECT *
                        FROM order_item o
                        LEFT OUTER JOIN review r
                        ON (o.item_no = r.order_item_item_no)
                        AND (o.shopping_basket_id = r.order_item_shopping_basket_id)
                        JOIN shopping_basket s
                        ON (o.shopping_basket_id = s.id)
                        WHERE o.inventory_id = ${product.productId}
                        AND s.customer_account_username = '${account.username}'
                        AND r.id is null AND o.status = 'received'
                    </sql:query>
                    <sql:query var="comment" dataSource="bakery">
                        SELECT * FROM review r 
                        JOIN order_item o 
                        ON (o.item_no = r.order_item_item_no) 
                        AND (o.shopping_basket_id = r.order_item_shopping_basket_id)
                        WHERE o.inventory_id = ${product.productId}
                    </sql:query>
                    <sql:query var="sumVote" dataSource="bakery">
                        SELECT count(*) 'count', avg(vote) 'avg' FROM review r 
                        JOIN order_item o 
                        ON (o.item_no = r.order_item_item_no) 
                        AND (o.shopping_basket_id = r.order_item_shopping_basket_id)
                        GROUP BY o.inventory_id
                        HAVING o.inventory_id = ${product.productId}
                    </sql:query>
                    <sql:query var="countVote1" dataSource="bakery">
                        SELECT count(*) 'count' FROM review r 
                        JOIN order_item o 
                        ON (o.item_no = r.order_item_item_no) 
                        AND (o.shopping_basket_id = r.order_item_shopping_basket_id)
                        WHERE o.inventory_id = ${product.productId} AND vote = 1;
                    </sql:query>
                    <sql:query var="countVote2" dataSource="bakery">
                        SELECT count(*) 'count' FROM review r 
                        JOIN order_item o 
                        ON (o.item_no = r.order_item_item_no) 
                        AND (o.shopping_basket_id = r.order_item_shopping_basket_id)
                        WHERE o.inventory_id = ${product.productId} AND vote = 2;
                    </sql:query>
                    <sql:query var="countVote3" dataSource="bakery">
                        SELECT count(*) 'count' FROM review r 
                        JOIN order_item o 
                        ON (o.item_no = r.order_item_item_no) 
                        AND (o.shopping_basket_id = r.order_item_shopping_basket_id)
                        WHERE o.inventory_id = ${product.productId} AND vote = 3;
                    </sql:query>
                    <sql:query var="countVote4" dataSource="bakery">
                        SELECT count(*) 'count' FROM review r 
                        JOIN order_item o 
                        ON (o.item_no = r.order_item_item_no) 
                        AND (o.shopping_basket_id = r.order_item_shopping_basket_id)
                        WHERE o.inventory_id = ${product.productId} AND vote = 4;
                    </sql:query>
                    <sql:query var="countVote5" dataSource="bakery">
                        SELECT count(*) 'count' FROM review r 
                        JOIN order_item o 
                        ON (o.item_no = r.order_item_item_no) 
                        AND (o.shopping_basket_id = r.order_item_shopping_basket_id)
                        WHERE o.inventory_id = ${product.productId} AND vote = 5;
                    </sql:query>
                    <c:if test="${check.rowCount != 0}">
                    <div class="popup-link">
                        <a href="#popup1">แสดงความคิดเห็น</a>
                    </div>
                    <!--popup1-->
                    <div id="popup1" class="popup-container">
                        <div class="popup-content">
                            <a href="#" class="close">&times;</a>
                            <!-- ฟอร์มวิจารณ์ -->
                            <div class="main">
                                <div class="contact">
                                </div>
                                <div class="contact-form">
                                    <h2>เขียนคำวิจารณ์</h2>
                                    <form method="post" action="ReviewServlet">
                                        <!-- ให้คะแนนดาว -->
                                        <div class="starform">
                                            <!--
                                                                            <div class="rating rating2">
                                                                                &nbsp;&nbsp;
                                                                                <a href="#5" title="Give 5 stars" class="starClick">★</a>
                                                                                <a href="#4" title="Give 4 stars" class="starClick">★</a>
                                                                                <a href="#3" title="Give 3 stars" class="starClick">★</a>
                                                                                <a href="#2" title="Give 2 stars" class="starClick">★</a>
                                                                                <a href="#1" title="Give 1 star" class="starClick">★</a>
                                                                                <h4 style="display: inline">: Rate</h4>
                                                                            </div>
                                            -->
                                            <ul class="beeRating">
                                                <label style="display: inline">Rate :</label>
                                                <li class="oneBee" id="1">★</li>
                                                <li class="twoBee" id="2">★</li>
                                                <li class="threeBee" id="3">★</li>
                                                <li class="fourBee" id="4">★</li>
                                                <li class="fiveBee" id="5">★</li>
                                            </ul>
                                            <input type="hidden" name="rating" id="ratingHidden" value="" />
                                        </div>
                                        <div>
                                            <span>
                                                <label>Message</label>
                                            </span>
                                            <span>
                                                <textarea name="comment"> </textarea>
                                            </span>
                                        </div>
                                        <div>
                                            <span>
                                                <input type="submit" class="" value="Submit us">
                                            </span>
                                        </div>
                                        <input type="hidden" name="itemNo" value="${check.rows[0].item_no}"/>
                                        <input type="hidden" name="shoppingBasketId" value="${check.rows[0].shopping_basket_id}"/>
                                        <input type="hidden" name="inventoryId" value="${product.productId}"/>
                                    </form>
                                </div>
                                <div class="clear"></div>
                            </div>

                        </div>
                    </div>
                    </c:if>

                    
                    <c:choose>
                        <c:when test="${sumVote.rowCount != 0}">
                    <!-- คะแนนโหวต -->
                    <div class="rating-block">
                        <div class="container">
                            <h2>คะแนนโหวต</h2>
                            <br>
                            <div class="media">
                                <div class="media-body">
                                    <div class="col-sm-5" style="text-align: center;">
                                        <h4>คะแนนโหวตรวม</h4>
                                        <div style="font-size: 50px">
                                            <fmt:formatNumber type = "number" pattern = "#.##" value = "${sumVote.rows[0].avg}" />
                                            
                                        </div>
                                    </div>
                                     <div class="col-sm-7">
                                        <div>
                                            <div style="width:80%; padding-left: 3em;">
                                                <div style="font-size: 20px; float: left;">5 <div class="glyphicon glyphicon-star"></div>&emsp;</div>
                                                <div style="float: right;">&emsp;${countVote5.rows[0].count}</div>
                                                <div class="progress" style="height:20px; margin: 0">
    
                                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="5" style="width: ${(countVote5.rows[0].count/sumVote.rows[0].count)*100}%">
                                                        <span class="sr-only">80% Complete (danger)</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div><br>
                                        <div>
                                            <div style="width:80%; padding-left: 3em;">
                                                <div style="font-size: 20px; float: left;">4 <div class="glyphicon glyphicon-star"></div>&emsp;</div>
                                                <div style="float: right;">&emsp;${countVote4.rows[0].count}</div>
                                                <div class="progress" style="height:20px; margin: 0">
    
                                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="5" style="width: ${(countVote4.rows[0].count/sumVote.rows[0].count)*100}%">
                                                        <span class="sr-only">80% Complete (danger)</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div><br>
                                        <div>
                                            <div style="width:80%; padding-left: 3em;">
                                                <div style="font-size: 20px; float: left;">3 <div class="glyphicon glyphicon-star"></div>&emsp;</div>
                                                <div style="float: right;">&emsp;${countVote3.rows[0].count}</div>
                                                <div class="progress" style="height:20px; margin: 0">
    
                                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="5" style="width: ${(countVote3.rows[0].count/sumVote.rows[0].count)*100}%">
                                                        <span class="sr-only">80% Complete (danger)</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div><br>
                                        <div>
                                            <div style="width:80%; padding-left: 3em;">
                                                <div style="font-size: 20px; float: left;">2 <div class="glyphicon glyphicon-star"></div>&emsp;</div>
                                                <div style="float: right;">&emsp;${countVote2.rows[0].count}</div>
                                                <div class="progress" style="height:20px; margin: 0">
    
                                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="5" style="width: ${(countVote2.rows[0].count/sumVote.rows[0].count)*100}%">
                                                        <span class="sr-only">80% Complete (danger)</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div><br>
                                        <div>
                                            <div style="width:80%; padding-left: 3em;">
                                                <div style="font-size: 20px; float: left;">1 <div class="glyphicon glyphicon-star"></div>&emsp;</div>
                                                <div style="float: right;">&emsp;${countVote1.rows[0].count}</div>
                                                <div class="progress" style="height:20px; margin: 0">
    
                                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="5" style="width: ${(countVote1.rows[0].count/sumVote.rows[0].count)*100}%">
                                                        <span class="sr-only">80% Complete (danger)</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div><br>
                                    </div>	
                                </div>
                            </div>
                        </div>

                    </div>
                    </c:when>
                    <c:otherwise>
                        <div class="rating-block">
                        <div class="container">
                            <h2>คะแนนโหวต</h2>
                            <br>
                            <div class="media">
                                <div class="media-body">
                                    <div class="col-sm-5" style="text-align: center;">
                                        <h4>คะแนนโหวตรวม</h4>
                                        <div style="font-size: 50px">
                                            -
                                            
                                        </div>
                                    </div>
                                </div></div></div></div>
                    </c:otherwise>
                    </c:choose>
                </div>

                <hr>
                
                <sql:query var="allReview" dataSource="bakery">
                    SELECT *
                    FROM review r
                    JOIN order_item o
                    ON (r.order_item_item_no = o.item_no)
                    AND (r.order_item_shopping_basket_id = o.shopping_basket_id)
                    JOIN shopping_basket s
                    ON (s.id = o.shopping_basket_id)
                    JOIN account a
                    ON (a.username = s.customer_account_username)
                    WHERE o.inventory_id = ${product.productId}
                </sql:query>
                
                <!-- คำวิจารณ์ -->
                <div class="container">
                    <h2>คำวิจารณ์</h2>
                    <br>
                    <c:forEach var="row" items="${allReview.rows}">
                    <div class="media">
                        <div class="media-body">
                            <div class="col-sm-2">
                                <c:choose>
                                    <c:when test="${row.profile_photo != null}">
                                        <img src="${row.profile_photo}"  class="img-circle"  style="object-fit: cover; border-radius: 50%; height: 80px; width: 80px;" title="">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="image/no-image-square.jpg" class="img-circle" title="" style="object-fit: cover; border-radius: 50%; height: 80px; width: 80px;">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="col-sm-10">
                                <h4 class="media-heading">${row.username}</h4>
                                <p>${row.review}</p>
                                
                            </div>
                        </div>
                    </div>
                                                    <hr>
                    </c:forEach>
                </div>

            </div>
        </div>	

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
                    <a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
                    <!--end scroll_top_btn -->
                    <div class="copy">
                        <p class="link">&copy;  All rights reserved | © Project website 2018</p>
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
        <!--script rating -->
        <script>
            var index = 1;
            $(".beeRating li").on({
                mouseover: function () {
                    if (index == 1)
                    {
                        $(this).addClass('stop');
                        $("li").each(function (index, domEle) {
                            $(domEle).css('opacity', '1');
                            if ($(this).hasClass('stop')) {
                                return false;
                            }
                        })
                    }
                },
                mouseleave: function () {
                    if (index == 1)
                    {
                        $(this).removeClass('stop');
                        $("li").each(function (index, domEle) {
                            $(domEle).css('opacity', '.25');
                        })
                    }
                },
                click: function () {
                    var rating = $(this).attr('id');
                    console.log(rating);
                    $('#ratingHidden').val(rating);
                    index = 0;
                    $.ajax({// do ajax request
                        url: "/echo/json/"

                    }).done(function () {
                        alert("success");
                        index = 1;  // on done set the index as 1
                    });
                }
            });
        </script>
    </body>
</html>