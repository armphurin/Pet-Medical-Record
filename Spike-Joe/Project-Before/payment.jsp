<%-- 
    Document   : payment
    Created on : Apr 23, 2018, 10:32:02 PM
    Author     : kukki
--%>

<%@page import="models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Wan-Jai</title>
        <meta http-equiv="Content-Type" content="text/html;" charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="icon" type="image/png" sizes="96x96" href="images/favicon-96x96.png">
        <link href="css/fontgoogle.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Saira+Semi+Condensed" rel="stylesheet">
        <link rel="stylesheet" href="css/w3.css">
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link rel="stylesheet" href="css/popup2.css">
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
        <style>
            .maxl{
                margin:25px ;
            }
            .inline{
                display: inline-block;
            }
            .inline + .inline{
                margin-left:10px;
            }
            .radio{
                color:#999;
                font-size:15px;
                position:relative;
            }
            .radio span{
                position:relative;
                padding-left:20px;
            }
            .radio span:after{
                content:'';
                width:15px;
                height:15px;
                border:3px solid;
                position:absolute;
                left:0;
                top:1px;
                border-radius:100%;
                -ms-border-radius:100%;
                -moz-border-radius:100%;
                -webkit-border-radius:100%;
                box-sizing:border-box;
                -ms-box-sizing:border-box;
                -moz-box-sizing:border-box;
                -webkit-box-sizing:border-box;
            }
            .radio input[type="radio"]{
                cursor: pointer; 
                position:absolute;
                width:100%;
                height:100%;
                z-index: 1;
                opacity: 0;
                filter: alpha(opacity=0);
                -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)"
            }
            .radio input[type="radio"]:checked + span{
                color:#FFA500;  
            }
            .radio input[type="radio"]:checked + span:before{
                content:'';
                width:5px;
                height:5px;
                position:absolute;
                background:#FFA500;
                left:5px;
                top:6px;
                border-radius:100%;
                -ms-border-radius:100%;
                -moz-border-radius:100%;
                -webkit-border-radius:100%;
            }
        </style>
    </head>
    <body>
        <% try { %>
        <%@ include file="header.jsp" %>   
        
        <% String name = null;
        request.setCharacterEncoding("UTF-8"); %>
        <% double allPrice = 0;
        double total_delivery_cost = (double) session.getAttribute("total_delivery_cost"); %>

        <!-- start main -->
        <form id="payment" method="POST" action="PaymentServlet">
        <div class="w3-container w3-padding-16 ">
            <div class="w3-row w3-container">
                <div class="w3-col w3-container" style="width:10%"></div>
                <div class="w3-col w3-container w3-card" style="width:80%">
                    <h1 class="w3-center w3-padding-16 w3-xxlarge w3-container">Payment</h1>

                    <!--Transfer Type ****Fixed-->
                    <div class="w3-container">
                        <div class="w3-container w3-topbar w3-border-orange">
                            <div class="w3-col w3-container">

                                <div class="w3-col w3-container">

                                <!--Payment Type-->
                                <div class="w3-container">
                                    <h1 class="w3-padding-16" style="font-family: 'Kanit';font-size: 18px;">วิธีการชำระเงิน</h1>
                                    <div class="w3-container w3-padding-16">

                                        <!--Type-->
                                        <label class="radio inline w3-large"> 
                                            <input type="radio" id="cod" name="pay_type" value="COD" checked>
                                            <span> ชำระเงินปลายทาง </span> 
                                        </label><br><br>
                                        <label class="radio inline w3-large"> 
                                            <input type="radio" id="creditCard" name="pay_type" value="card">
                                            <span> Credit Card </span>
                                        </label>
                                        <div id="cardInput" style="display: none; margin: 1%;">
                                            <br>Credit Card Number : 
                                            <input type="text" id="cardNum1" name="cardNum1" value="" maxlength="4" size="4" required="" disabled=""/>
                                            <input type="text" id="cardNum2" name="cardNum2" value="" maxlength="4" size="4" required="" disabled=""/>
                                            <input type="text" id="cardNum3" name="cardNum3" value="" maxlength="4" size="4" required="" disabled=""/>
                                            <input type="text" id="cardNum4" name="cardNum4" value="" maxlength="4" size="4" required="" disabled=""/><br>
                                            CVV : <input type="text" id="cvv" name="cvv" value="" maxlength="3" size="3" required="" disabled=""/><br>
                                            Expiration date :<br> 
                                            เดือน : 
                                            <select name="month" required="" id="month" disabled="">
                                                <option value="" disabled selected>month</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                            </select>
                                            ปี :
                                            <select name="year" required="" id="year" disabled="">
                                                <option value="" disabled selected>year</option>
                                                <option value="2018">2018</option>
                                                <option value="2019">2019</option>
                                                <option value="2020">2020</option>
                                                <option value="2021">2021</option>
                                                <option value="2022">2022</option>
                                                <option value="2023">2023</option>
                                            </select>
                                            
                                        </div>
                                        
                                        <!--End Type-->

                                    </div>  
                                </div>
                                <!--End Payment Type-->

                            </div>
                            </div>
                            
                        </div>
                    </div>


                    <div class="w3-container">
                        <div class="w3-container w3-topbar w3-border-orange">
                            <!-- Shopping List Start Loop-->
                            
                            <% 
                                for (ItemInBasket i : cart.getBasket()) {%>
                            
                            <div class="w3-padding-16 w3-row-padding w3-border-bottom">
                                <sql:query var="basketPhoto" dataSource="bakery">
                                            SELECT * FROM product_photo WHERE inventory_id = <%=i.getInventoryId() %> ORDER BY RAND() LIMIT 1;
                                        </sql:query>
                                                <c:choose>
                                                    <c:when test="${basketPhoto.rows[0].product_photo != null}">
                                                        <img src="${basketPhoto.rows[0].product_photo}" style="width: 50px; height: auto">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="images/no-image-square.jpg" style="width: 50px; height: auto">
                                                    </c:otherwise>
                                                </c:choose>
                                <div class="w3-container w3-col" style="width: 60%">
                                    <%=i.getItemName()%><br><br>
                                    <div class="w3-text-gray"><%=i.getItemAmount()%> piece</div>
                                </div>
                                <div class="w3-panel w3-col " style="width:20%;">
                                    <div class="w3-panel">
                                        <div class="w3-display-container w3-xlarge">
                                            <div class="w3-display-right">
                                                <%=i.getItemPrice()%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <% allPrice += i.getItemPrice() * i.getItemAmount();
                        } %>
                    
                            
                            <!-- End Loop -->
                        </div>


                        <!-- สรุปค่าจัดส่ง -->
                        <div class="w3-topbar w3-border-orange ">
                            <div class="w3-container">
                                <div class="w3-padding-16">วิธีการจัดส่ง</div><br>
                                <div class=" w3-row-padding">

                                    <!--Product image-->
                                    <div class="w3-container w3-col" style="width: 20%">
                                        
                                    </div>

                                    <!---Text-->
                                    <div class="w3-container w3-col w3-large" style="width: 60%">
                                        <%=request.getParameter("deliveryType") %><br><br>
                                        ที่อยู่การจัดส่ง<br>
                                        <%=request.getParameter("selectAddress") %><br><br>
                                        <input type="hidden" name="deliveryType" value="<%=request.getParameter("deliveryType") %>"/>
                                        <input type="hidden" name="selectAddress" value="<%=request.getParameter("selectAddress") %>"/>
                                        <br><br>
                                    </div>

                                    <!--Price-->
                                    <div class="w3-panel w3-col " style="width:20%;">
                                        <div class="w3-panel">
                                            <div class="w3-display-container w3-xlarge">
                                                <div class="w3-display-right">
                                                    <%=total_delivery_cost %>THB
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>
                        <!--End-->
                        <!--More detail-->
                <div class="w3-container w3-topbar w3-border-orange w3-padding-8">
                    <div class="w3-panel">
                    <div>
                        <h3>รายละเอียดเพิ่มเติมถึงผู้ขาย</h3><br>
                        <p><%=request.getParameter("description") %></p>
                        <input type="hidden" name="description" value="<%=request.getParameter("description") %>"/>
                    </div>
                </div>
                </div>
                        
                        <div class="w3-container w3-topbar w3-border-orange w3-padding-32">
                            <div class="w3-panel">
                                <div class="w3-display-container w3-xlarge">
                                    <div class="w3-container w3-display-right">
                                        <div class="w3-cell w3-padding-24" style="font-size: 14px">total cost </div>
                                        <div class="w3-cell w3-container"></div>
                                        <div class="w3-cell" style="font-size: 30px"> <%=(allPrice + total_delivery_cost)%>THB</div></div>
                                        <input type="hidden" name="total_price" value="<%=(allPrice + total_delivery_cost)%>"/>
                                </div><br><br><br>

                                <!--Pay : ชำระเงินปลายทาง-->
                                <!--
                                <div class="w3-container">
                                    <a href="index.html">
                                        <div class="buttonMain w3-container w3-right w3-display-container"><div class="w3-display-middle" >PAY</div></div>
                                    </a>
                                </div>
                                -->

                                <!--Pay : หักผ่านบัตร-->     
                                <div class="w3-container w3-topbar w3-border-orange w3-padding-32">
                                    <div class="w3-panel">
                                        <div class="w3-display-container w3-xlarge">
                                            <button form="payment" class="btn-link w3-display-right w3-button w3-round-xlarge w3-orange w3-text-white" 
                                                    style="font-family: serif;font-size: 20px">
                                                PAY</button>
                                        </div>
                                    </div>
                                </div>

                                <!--End PAY-->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="w3-col w3-container" style="width:10%"></div>
            </div>
        </div>
        </form>
        <% } catch(Exception e){
        } %>

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
            $("#cod").click(function(){
                $("#cardInput").hide();
                document.getElementById("cardNum1").disabled = true;
                document.getElementById("cardNum2").disabled = true;
                document.getElementById("cardNum3").disabled = true;
                document.getElementById("cardNum4").disabled = true;
                document.getElementById("cvv").disabled = true;
                document.getElementById("month").disabled = true;
                document.getElementById("year").disabled = true;
            });

            $("#creditCard").click(function(){
                $("#cardInput").show();
                document.getElementById("cardNum1").disabled = false;
                document.getElementById("cardNum2").disabled = false;
                document.getElementById("cardNum3").disabled = false;
                document.getElementById("cardNum4").disabled = false;
                document.getElementById("cvv").disabled = false;
                document.getElementById("month").disabled = false;
                document.getElementById("year").disabled = false;
            }); 
        </script>
    </body>
</html>
