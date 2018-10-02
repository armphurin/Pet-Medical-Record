<%@page import="models.*"%>
<%@page import="java.math.RoundingMode"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 


<!DOCTYPE HTML>
<html>
    <head>
        <title>Wan-Jai</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="icon" type="image/png" sizes="96x96" href="images/favicon-96x96.png">
        <link href="css/fontgooglekani.css" rel="stylesheet">
        <link rel="stylesheet" href="css/fontgooglekani.css">
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
        
        <% String name = null;%>
        <% double allPrice = 0;
        double total_delivery_cost = (double) session.getAttribute("total_delivery_cost"); %>
        <form id="payment" action="ConfirmationServlet" method="POST">
        <!-- start main -->
        <div class="w3-container w3-padding-16">
            <div class="w3-row w3-container">
                <div class="w3-col w3-container" style="width:10%"></div>
                <div class="w3-col w3-container w3-card" style="width:80%">
                    <h1 class="w3-center w3-padding-16 w3-xxlarge w3-container">Payment</h1>

                    <!--Transfer Type-->
                    <div class="w3-container">
                        <div class="w3-container w3-topbar w3-border-orange">
                            <div class="w3-col w3-container " style="width:50%">
                                <!-- วิธีการชำระเงินและการส่ง -->
                                <div class="w3-container">
                                    <h1 class="w3-padding-16">วิธีการส่งสินค้า</h1>
                                    <div class="w3-container w3-padding-16">
                                        <label class="radio inline w3-large"> 
                                            <input type="radio" name="deliveryType" value="by vendor" checked>
                                            <span> จัดส่งโดยร้าน </span> 
                                        </label><br><br>
                                        <label class="radio inline w3-large"> 
                                            <input type="radio" name="deliveryType" value="line man">
                                            <span> Line man </span> 
                                        </label><br><br>
                                        <label class="radio inline w3-large"> 
                                            <input type="radio" name="deliveryType" value="foodpanda">
                                            <span> FoodPanda </span> 
                                        </label><br><br>
                                        <label class="radio inline w3-large"> 
                                            <input type="radio" name="deliveryType" value="lalamove">
                                            <span> Lalamove </span> 
                                        </label><br><br>
                                        <label class="radio inline w3-large"> 
                                            <input type="radio" name="deliveryType" value="now delivery">
                                            <span> Now delivery </span> 
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Shopping List -->
                    <div class="w3-container">
                        <div class="w3-container w3-topbar w3-border-orange">
                            <!-- Shopping List Start Loop-->
                            
                            <% 
                                for (ItemInBasket i : cart.getBasket()) {%>
                            
                            <div class="w3-padding-16 w3-row-padding w3-border-bottom">
                                <div class="w3-container w3-col" style="width: 20%">
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
                                </div>
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
                            
                            <%
                                allPrice += i.getItemPrice() * i.getItemAmount();
                    }
                         %>
                    
                            
                            <!-- End Loop -->
                        </div>
                        
                
                        <!-- สรุปค่าจัดส่ง -->
                        <div class="w3-topbar w3-border-orange ">
                            <div class="w3-container">
                                <div class="w3-padding-16">วิธีการจัดส่ง</div><br>
                                <div class=" w3-row-padding">

                                    <!--Product image-->
                                    <div class="w3-container w3-col" style="width: 20%">
                                        <img src="images/logo.jpg" style="width: 100px">
                                    </div>
                                    <% Customer customer = (Customer) session.getAttribute("customer"); %>
                                    <!---Text-->
                                    <div class="w3-container w3-col w3-large" style="width: 60%">
                                        ที่อยู่การจัดส่ง<br><br>
                                        <div id="select-address"><%=customer.getCustomerAddress().get(0).getAddress() %> <%=customer.getCustomerAddress().get(0).getDistrict()%> <%=customer.getCustomerAddress().get(0).getProvince()%> <%=customer.getCustomerAddress().get(0).getPostcode()%>
                                        </div><br><br>
                                        <input type="hidden" name="selectAddress" id="select-address-hidden" value="<%=customer.getCustomerAddress().get(0).getAddress()+" "+customer.getCustomerAddress().get(0).getDistrict()+" "+customer.getCustomerAddress().get(0).getProvince()+" "+customer.getCustomerAddress().get(0).getPostcode()%>"/>
                                        
                                        <!--Button-->
                                        <div class="w3-container">
                                            <a href="#popup2">
                                                <div class="w3-button w3-border w3-round-xlarge w3-small">แก้ไข</div>
                                            </a>
                                        </div>
                                        <div id="popup2" class="popup-container">
                                            <div class="popup-content w3-container">
                                                <a href="#" class="close">&times;</a>
                                                <br><br>กรุณาเลือกที่อยู่จัดส่ง<br><br>
                                                
                                                    <% if (customer.getCustomerAddress() != null){
                                                        int check = 0;
                                                        for (CustomerAddress i : customer.getCustomerAddress()){ 
                                                        if (check == 0) {%>
                                                        <input type="radio" name="addr" value="<%=i.getAddress() %> <%=i.getDistrict()%> <%=i.getProvince()%> <%=i.getPostcode()%>" checked>
                                                        <% } else {%>
                                                            <input type="radio" name="addr" value="<%=i.getAddress() %> <%=i.getDistrict()%> <%=i.getProvince()%> <%=i.getPostcode()%>">
                                                            
                                                        <% } check = 1;%>
                                                        <%=i.getAddress() %> <%=i.getDistrict()%> <%=i.getProvince()%> <%=i.getPostcode()%><br> 
                                                    <% }} %>
                                                    <input id="new-address" type="radio" name="addr" value=""> ที่อยู่ใหม่
                                                    <div style="margin:2%;">
                                                        <input id="address" type="text" name="address" value="" placeholder="ที่อยู่"/>
                                                        <input id="district" type="text" name="district" value="" placeholder="เขต/อำเภอ"/>
                                                        <input id="province" type="text" name="province" value="" placeholder="จังหวัด"/>
                                                        <input id="postcode" type="text" name="postcode" value="" placeholder="รหัสไปรษณีย์"/>
                                                        
                                                    </div>
                                                    <br><a href="#">
                                                        <div id="edit-address-button" class="w3-button w3-border w3-round-xlarge w3-small">แก้ไขที่อยู่</div><br><br>
                                                    </a><br>
                                            </div><br>
                                        </div><br>
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
                            <!--End-->
                            <!--More detail-->
                <div class="w3-container w3-topbar w3-border-orange w3-padding-8">
                    <div class="w3-panel">
                    <div>
                        <h3>รายละเอียดเพิ่มเติมถึงผู้ขาย</h3><br>
                        <p><textarea name="description" rows="3" cols="50" style="width:1053px; height: 192px; resize: none;"></textarea></p>
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
                                    </div><br><br><br>
                                    <div class="w3-display-container w3-xlarge">
                                        <button form="payment" class="btn-link w3-display-right w3-button w3-round-xlarge w3-orange w3-text-white" 
                                                 style="font-family: serif;font-size: 20px">
                                        CONFIRM</button>
                                    </div>
                                </div>
                            </div>
                            
                                    
                            
            
                        </div>
                    </div>
                    <div class="w3-col w3-container" style="width:10%">
                    </div>
                </div>
            </div>
        </div>
        </form>
                
            
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
                $('#edit-address-button').click(function () {
                    var ad = document.getElementsByName('addr');
                    var ad_value;
                    for(var i = 0; i < ad.length; i++){
                        if(ad[i].checked){
                            ad_value = ad[i].value;
                            if (i == ad.length-1){
                                ad_value = document.getElementById("address").value+" "+document.getElementById("district").value+" "+document.getElementById("province").value+" "+document.getElementById("postcode").value;
                            }
                        }
                    }
                   document.getElementById("select-address").innerHTML = ad_value;
                   document.getElementById("select-address-hidden").value = ad_value;
                });
            </script>
            <% } catch(Exception e){
        } %>
    </body>
</html>


