<%-- 
    Document   : modify_cus
    Created on : Apr 4, 2018, 7:49:51 PM
    Author     : USER
--%>
<%@page import="models.Account"%>
<%@page import="models.User"%>
<%@page import="models.CustomerAddress"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Wan-Jai</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="bootstrap3/css/bootstrap.min.css">
        <link rel="icon" type="image/png" sizes="96x96" href="images/favicon-96x96.png">
        <!-- ajax <script src="js/jquery.min.js"></script> -->
        <script src="bootstrap3/js/bootstrap.min.js"></script>
        <script src="bootstrap3/js/bootstrap.js" type="text/javascript"></script>
        <script src="js/jquery.min.js"></script> 
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
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
        <style>
            /*Profile Pic Start*/
            .picture-container1{
                position: relative;
                height: 250px;
                width: 250px;
                cursor: pointer;
                text-align: center;
            }
            .picture-container2{
                position: relative;
                height: 380px;
                width: 940px;
                cursor: pointer;
                text-align: center;
            }
            .picturePro{
                width: 250px;
                height: 250px;
                background-color: #999999;
                border: 4px solid #CCCCCC;
                color: #FFFFFF;
                border-radius: 50%;
                /*margin: 0px auto;*/
                overflow: hidden;
                transition: all 0.2s;
                -webkit-transition: all 0.2s;
            }

            .pictureBan{
                width: 940px;
                height: 380px;
                background-color: #999999;
                border: 4px solid #CCCCCC;
                color: #FFFFFF;
                border-radius: 0%;
                /*margin: 0px auto;*/
                overflow: hidden;
                transition: all 0.2s;
                -webkit-transition: all 0.2s;
            }
            .picturePro:hover{
                border-color: #2ca8ff;
            }
            .pictureBan:hover{
                border-color: #2ca8ff;
            }
            .content.ct-wizard-green .picture:hover{
                border-color: #05ae0e;
            }
            .content.ct-wizard-blue .picture:hover{
                border-color: #3472f7;
            }
            .content.ct-wizard-orange .picture:hover{
                border-color: #ff9500;
            }
            .content.ct-wizard-red .picture:hover{
                border-color: #ff3b30;
            }
            .picturePro input[type="file"] {
                cursor: pointer;
                display: block;
                height: 250px;
                left: 0;
                opacity: 0 !important;
                position: absolute;
                top: 0;
                width: 250px;
            }
            .pictureBan input[type="file"] {
                cursor: pointer;
                display: block;
                height: 380px;
                left: 0;
                opacity: 0 !important;
                position: absolute;
                top: 0;
                width: 940px;
            }

            .picture-src{
                width: 100%;
                height: 100%;
            }
            /*Profile Pic End*/
        </style>
        <% if (session.getAttribute("customer") != null) {%>

        <jsp:useBean id="customer" class="models.Customer" scope="session"/>
        <jsp:useBean id="account" class="models.Account" scope="session"/>
        <jsp:useBean id="user" class="models.User" scope="session"/>
        <div class="header_con">
            My Profile
        </div>
        <style>

            .popup-container{
                overflow: scroll;
            }

            .popup-container input{


                resize: none !important;
                width: 100% !important;
                -moz-appearance: none !important;
                -webkit-appearance: none !important;
                -o-appearance: none;
                -ms-appearance: none;
                appearance: none;
            }

            .popup-container textarea{


                resize: none !important;
                width: 100% !important;
                -moz-appearance: none !important;
                -webkit-appearance: none !important;
                -o-appearance: none;
                -ms-appearance: none;
                appearance: none;
            }

            .popup-container label{
                color: #3498db;

            }

            .popup-container h2,
            .popup-container h3 {
                color: #545454;
                font-weight: 700;
                line-height: 1.5em;
                margin: 0 0 1em 0;
                letter-spacing: -0.01em;
            }

            .popup-container h2 {
                font-size: 1.75em;
            }

            .popup-container h3 {
                font-size: 1.25em;
            }

            .popup-container ul {
                list-style: disc;
                margin: 0 0 2em 0;
                padding-left: 1em;
            }

            .popup-container ul.actions {
                cursor: default;
                list-style: none;
                padding-left: 0;
            }

            .popup-container ul.actions li {
                display: inline-block;
                padding: 0 1em 0 0;
                vertical-align: middle;
            }

            .popup-container ul.actions li:last-child {
                padding-right: 0;
            }

            .area-product{
                margin: 20px;
            }
            
            bu{
                margin: 2%;
            }


        </style>
        <script>
            $(document).ready(function () {
                // Prepare the preview for profile picture
                $("#wizard-picturePro").change(function () {
                    readURLPro(this);
                });

                $("#wizard-pictureBan").change(function () {
                    readURLBan(this);
                });
            });
            function readURLPro(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#wizardPicturePreviewPro').attr('src', e.target.result).fadeIn('slow');
                    },
                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>
        
        <script>
            var loadFile = function (event) {
                var output = document.getElementById('output');
                output.src = URL.createObjectURL(event.target.files[0]);
            };
        </script>
        <div class="container">

            <hr>
            <div class="row">
                <% if (request.getParameter("action").equals("Edit profile")) {%>
                <sql:query var="profile" dataSource="bakery">
                    SELECT profile_photo FROM account WHERE username = '${account.username}'
                </sql:query>
                <div class="col-md-3" style="margin-top: 15%; text-align:center;">
                    <div class="picture-container1">
                    <div class="picturePro" style="background: white; width: 100%; height: 100%;">
                        

                        <c:choose>
                            <c:when test="${profile.rows[0].profile_photo != null}">
                                <img src="${profile.rows[0].profile_photo}" class="picture-src" id="wizardPicturePreviewPro" style="object-fit: cover; border-radius: 50%;" title="">
                            </c:when>
                            <c:otherwise>
                                <img src="images/no-image-square.jpg" class="picture-src" id="wizardPicturePreviewPro" title="">
                            </c:otherwise>
                        </c:choose>
                        <input type="file" id="wizard-picturePro" class="">
                        </div>
                    </div>
                    
                    <br>
                    <h6>เลือกรูปภาพเพื่อเปลี่ยนภาพโปรไฟล์</h6>
                    <div id="showdivPro"></div>
                </div>

                <!-- edit form column -->
                <div class="col-md-9 personal-info">
                    <div class="alert alert-info alert-dismissable">
                        <a class="panel-close close" data-dismiss="alert">×</a>
                        <i class="fa fa-coffee"></i>
                        Hello
                        <strong> <%=account.getUsername()%> </strong>
                    </div>
                    <h2>Personal info</h2>

                    <form class="form-horizontal" role="form" id="edit_profile" method="POST" action="EditProfileServlet">

                        <div class="form-group">
                            <label class="col-lg-3 control-label">First name:</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" name="firstname" value="<%=user.getFirstname()%>" required="required">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Last name:</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" name="lastname" value="<%=user.getLastname()%>" required="required">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Birth Day:</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="date" name="birthday" value="<%=customer.getBirthday()%>" required="required">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Phone:</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" name="phone_number" value="<%=user.getPhoneNumber1()%>" required="required">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Phone:</label>
                            <div class="col-lg-8">
                                <% if (user.getPhoneNumber2() != null) {%>
                                <input class="form-control" type="text" name="phone_number2" value="<%=user.getPhoneNumber2()%>" /><br>
                                <% } else { %>
                                <input class="form-control" type="text" name="phone_number2" value="" />
                                <% }%>
                            </div>
                        </div>
                        <div class="form-group" id="addedRows1">
                            <label class="col-lg-3 control-label">Address:</label>
                            <%  int count = 0;
                                if (customer.getCustomerAddress() != null){
                                for (CustomerAddress i : customer.getCustomerAddress()) {
                                    if (count == 0) {%>
                            <div>
                                <label class="col-lg-3 control-label"></label>
                                <div class="col-lg-8">
                                    <input class="form-control" name="address" type="text" value="<%=i.getAddress()%>" />
                                    <input class="form-control" name="district" type="text" value="<%=i.getDistrict()%>" />
                                    <input class="form-control" name="province" type="text" value="<%=i.getProvince()%>" />
                                    <input class="form-control" name="postcode" type="text" value="<%=i.getPostcode()%>" />
                                    <button onclick="addMoreRows1(this.form);">
                                        Add More
                                    </button> 
                                </div>
                            </div>
                            <% } else {%>

                            <div id="rowCount0<%=count%>">
                                <label class="col-lg-3 control-label"></label>
                                <div class="col-lg-8">
                                    <input class="form-control" name="address" type="text" value="<%=i.getAddress()%>" />
                                    <input class="form-control" name="district" type="text" value="<%=i.getDistrict()%>" />
                                    <input class="form-control" name="province" type="text" value="<%=i.getProvince()%>" />
                                    <input class="form-control" name="postcode" type="text" value="<%=i.getPostcode()%>" />
                                    <button onclick="removeRow1(<%=count%>);">Delete</button>
                                </div>
                            </div>
                            <% }
                                    count++;
                                }
                            } %>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Password:</label>
                            <div class="col-md-8">
                                <input class="form-control" name="password" type="password" required="required">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label"></label>
                            <div class="col-md-8">
                                <input type="submit" class="btn btn-primary" value="Save Changes">
                                <span></span>
                            </div>
                        </div>
                        <input type="hidden" name="account" value="customer"/>
                        <input type="hidden" name="action" value="edit profile"/>
                    </form>
                    <% } else if (request.getParameter("action").equals("Change password")) {%>
                    <!-- left column -->
                    <div class="col-md-3">
                        <sql:query var="profile" dataSource="bakery">
                            SELECT profile_photo FROM account WHERE username = '${account.username}'
                        </sql:query>
                        <div>
                            <div >

                                <c:choose>
                                    <c:when test="${profile.rows[0].profile_photo != null}">
                                        <img src="${profile.rows[0].profile_photo}" style="width: 200px; height: 200px; object-fit: cover; border-radius: 50%;" title="">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="images/no-image-square.jpg" class="picture-src" title="">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <!--<div id="showdivPro">Show : </div>-->
                        </div>
                    </div>

                    <!-- edit form column -->
                    <div class="col-md-9 personal-info">
                        <div class="alert alert-info alert-dismissable">
                            <a class="panel-close close" data-dismiss="alert">×</a>
                            <i class="fa fa-coffee"></i>
                            Hello
                            <strong> <%=account.getUsername()%> </strong>
                        </div>
                        <h2>Personal info</h2>

                        <form class="form-horizontal" role="form" method="POST" action="EditProfileServlet">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Old Password:</label>
                                <div class="col-md-8">
                                    <input class="form-control" name="password" type="password" required="required">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Password:</label>
                                <div class="col-md-8">
                                    <input class="form-control" name="new_password" type="password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Confirm password:</label>
                                <div class="col-md-8">
                                    <input class="form-control" name="confirmed_password" type="password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label"></label>
                                <div class="col-md-8">
                                    <input type="submit" class="btn btn-primary" value="Edit password">
                                    <span></span>
                                </div>
                            </div>
                            <input type="hidden" name="account" value="customer"/>
                            <input type="hidden" name="action" value="change password"/>
                        </form>
                        <% } %>
                    </div>
                </div>
            </div>
            <hr>
        </div>

        <% } else if (session.getAttribute("seller") != null) { %>
        <jsp:useBean id="seller" class="models.Seller" scope="session"/>
        <% Account account = (Account) session.getAttribute("account");
            User user = (User) session.getAttribute("user");
        %>
        <div class="header_con">
            My Profile
        </div>
        <div class="container">

            <hr>
            <div class="row">
                <% if (request.getParameter("action").equals("Edit profile")) {%>
                <sql:query var="profile" dataSource="bakery">
                    SELECT profile_photo FROM account WHERE username = '<%=account.getUsername() %>'
                </sql:query>
                <div class="col-md-3" style="margin-top: 15%; text-align:center;">
                    <div class="picture-container1">
                    <div class="picturePro" style="background: white; width: 100%; height: 100%;">
                        

                        <c:choose>
                            <c:when test="${profile.rows[0].profile_photo != null}">
                                <img src="${profile.rows[0].profile_photo}" class="picture-src" id="wizardPicturePreviewPro" style="object-fit: cover; border-radius: 50%;" title="">
                            </c:when>
                            <c:otherwise>
                                <img src="images/no-image-square.jpg" class="picture-src" id="wizardPicturePreviewPro" title="">
                            </c:otherwise>
                        </c:choose>
                        <input type="file" id="wizard-picturePro" class="">
                        </div>
                    </div>
                    
                    <br>
                    <h6>เลือกรูปภาพเพื่อเปลี่ยนภาพโปรไฟล์</h6>
                    <div id="showdivPro"></div>
                </div>

                <!-- edit form column -->
                <div class="col-md-9 personal-info">
                    <div class="alert alert-info alert-dismissable">
                        <a class="panel-close close" data-dismiss="alert">×</a>
                        <i class="fa fa-coffee"></i>
                        Hello
                        <strong> <%=account.getUsername()%> </strong>
                    </div>
                    <h2>Personal info</h2>

                    <form class="form-horizontal" role="form" id="edit_profile" method="POST" action="EditProfileServlet">

                        <div class="form-group">
                            <label class="col-lg-3 control-label">First name:</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" name="firstname" value="<%=user.getFirstname()%>" required="required">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Last name:</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" name="lastname" value="<%=user.getLastname()%>" required="required">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Phone:</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" name="phone_number" value="<%=user.getPhoneNumber1()%>" required="required">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Phone:</label>
                            <div class="col-lg-8">
                                <% if (user.getPhoneNumber2() != null) {%>
                                <input class="form-control" type="text" name="phone_number2" value="<%=user.getPhoneNumber2()%>" /><br>
                                <% } else { %>
                                <input class="form-control" type="text" name="phone_number2" value="" />
                                <% }%>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Store name:</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" name="storeName" value="<%=seller.getStoreName()%>" required="required">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Store description:</label>
                            <div class="col-lg-8">
                                <% if (seller.getStoreDescript() != null) {%>
                                <input class="form-control" type="text" name="storeDescript" value="<%=seller.getStoreDescript()%>">
                                <% } else { %>
                                <input class="form-control" type="text" name="storeDescript" value="">
                                <% }%>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Store address:</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" name="storeAddress" value="<%=seller.getStoreAddress()%>" required="required">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Term of use:</label>
                            <div class="col-lg-8">
                                <% if (seller.getStoreTerm() != null) {%>
                                <input class="form-control" type="text" name="storeTerm" value="<%=seller.getStoreTerm()%>">
                                <% } else { %>
                                <input class="form-control" type="text" name="storeTerm" value="">
                                <% }%>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Password:</label>
                            <div class="col-md-8">
                                <input class="form-control" name="password" type="password" required="required">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label"></label>
                            <div class="col-md-8">
                                <input type="submit" class="btn btn-primary" value="Save Changes">
                                <span></span>
                            </div>
                        </div>
                        <input type="hidden" name="account" value="seller"/>
                        <input type="hidden" name="action" value="edit profile"/>
                    </form>
                    <% } else if (request.getParameter("action").equals("Change password")) {%>
                    <!-- left column -->
                    <div class="col-md-3">
                        <sql:query var="profile" dataSource="bakery">
                            SELECT profile_photo FROM account WHERE username = '${account.username}'
                        </sql:query>
                        <div>
                            <div >

                                <c:choose>
                                    <c:when test="${profile.rows[0].profile_photo != null}">
                                        <img src="${profile.rows[0].profile_photo}" style="width: 200px; height: 200px; object-fit: cover; border-radius: 50%;" title="">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="image/no-image-square.jpg" class="picture-src" title="">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <!--<div id="showdivPro">Show : </div>-->
                        </div>
                    </div>

                    <!-- edit form column -->
                    <div class="col-md-9 personal-info">
                        <div class="alert alert-info alert-dismissable">
                            <a class="panel-close close" data-dismiss="alert">×</a>
                            <i class="fa fa-coffee"></i>
                            Hello
                            <strong> <%=account.getUsername()%> </strong>
                        </div>
                        <h2>Personal info</h2>

                        <form class="form-horizontal" role="form" method="POST" action="EditProfileServlet">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Old Password:</label>
                                <div class="col-md-8">
                                    <input class="form-control" name="password" type="password" required="required">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Password:</label>
                                <div class="col-md-8">
                                    <input class="form-control" name="new_password" type="password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Confirm password:</label>
                                <div class="col-md-8">
                                    <input class="form-control" name="confirmed_password" type="password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label"></label>
                                <div class="col-md-8">
                                    <input type="submit" class="btn btn-primary" value="Edit password">
                                    <span></span>
                                </div>
                            </div>
                            <input type="hidden" name="account" value="seller"/>
                            <input type="hidden" name="action" value="change password"/>
                        </form>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <% }%>
        <script type="text/javascript">
            var rowCount1 = 1;
            function addMoreRows1(frm) {
                rowCount1++;
                var recRow1 = '<div id="rowCount0' + rowCount1 + '"><label class="col-lg-3 control-label"></label><div class="col-lg-8"><input class="form-control" name="address" type="text" /><input class="form-control" name="district" type="text" /><input class="form-control" name="province" type="text" /><input class="form-control" name="postcode" type="text" required/> <button onclick="removeRow1(' + rowCount1 + ');">Delete</button></div></div>';
                $(recRow1).hide().appendTo('#addedRows1').fadeIn(300);
            }

            function removeRow1(removeNum) {
                jQuery('#rowCount0' + removeNum).fadeOut(300, function () {
                    $(this).remove();
                });
            }
        </script>


        <!-- start footer -->
        <div class="footer_bg">
            <div class="wrap">	
                <div class="footer">
                    <!-- start grids_of_4 -->	

                </div>
            </div>
        </div>	

        <!--===============================================================================================-->  
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <!--<script src="vendor/bootstrap/js/bootstrap.min.js"></script>-->
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>


        <!-- add Script firebase -->
        <script src="https://www.gstatic.com/firebasejs/4.12.1/firebase.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

        <!-- script config firebase -->
        <script>
            //config firebase
            var config = {
                apiKey: "AIzaSyABXOvnuXXMaI4a8J64Gt2Y9P-V5UG-Ftw",
                authDomain: "bakerysystem-661db.firebaseapp.com",
                databaseURL: "https://bakerysystem-661db.firebaseio.com",
                projectId: "bakerysystem-661db",
                storageBucket: "bakerysystem-661db.appspot.com",
                //messagingSenderId: "141182130037"
            };
            firebase.initializeApp(config);
        </script>
        <script>

            //servlet connect for send profile value
            function servletCallPro(path) {
                $.post(
                        "GetUserServlet",
                        {profile: path}, //meaasge you want to send
                        function (result) {
                            //$('#showdivPro').html('Here is your result : <strong>' + result + '</strong>'); //message you want to show
                            $('#showdivPro').html('อัพโหลดเสร็จสิ้น');
                        });
            }
            ;

            //get elements profile
            var uploaderPro = document.getElementById('uploaderPro');
            var fileButtonPro = document.getElementById('wizard-picturePro');

            //Listener
            fileButtonPro.addEventListener('change', function (e) {
                //get file
                var file = e.target.files[0];

                //create a storage ref
                  var storageRef = firebase.storage().ref('${account.username}/profile/' + file.name);

                //upload file
                var task = storageRef.put(file);
                console.log(file, storageRef, task);

                //update progress bar
                task.on('state_changed',
                        function progress(snapshot) {
                            var percentage = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
                            uploaderPro.value = percentage;
                        },
                        function error(err) {},
                        function complete() {
                            var downloadURL = task.snapshot.downloadURL;
                            servletCallPro(downloadURL);
                        }
                );

            });


            //servlet connect for send banner value
            function servletCallBan(path) {
                $.post(
                        "GetUserServlet",
                        {banner: path}, //meaasge you want to send
                        function (result) {
                            $('#showdivBan').html('Here is your result : <strong>' + result + '</strong>'); //message you want to show
                        });
            }
            ;

        </script>

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
    </body>
</html>
