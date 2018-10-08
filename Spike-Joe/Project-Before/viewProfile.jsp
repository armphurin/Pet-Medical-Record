<%-- 
    Document   : cus_profile
    Created on : Apr 4, 2018, 5:53:20 PM
    Author     : USER
--%>
<%@page import="models.User"%>
<%@page import="models.Account"%>
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
        <link rel="icon" type="image/png" sizes="96x96" href="images/favicon-96x96.png">

        <link rel="stylesheet" href="bootstrap3/css/bootstrap.min.css">
        <script src="js/jquery.min.js"></script>
        <script src="bootstrap3/js/bootstrap.min.js"></script>
        <script src="bootstrap3/js/bootstrap.js" type="text/javascript"></script>
        <script src="js/jquery.min.js"></script> 
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
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
        <div class="container">

            <hr>
            <div class="row">
                <!-- left column -->
                        <sql:query var="profile" dataSource="bakery">
                            SELECT profile_photo FROM account WHERE username = '${account.username}'
                        </sql:query>
                        <div class="col-md-3" style="margin-top: 10%; text-align:center;">
                    <div class="picture-container1">
                    <div class="picturePro" style="background: white; width: 100%; height: 100%;">

                                <c:choose>
                                    <c:when test="${profile.rows[0].profile_photo != null}">
                                        <img src="${profile.rows[0].profile_photo}"  class="picture-src"  style="object-fit: cover; border-radius: 50%;" title="">
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
                    <div class="form-group">
                        <label class="col-lg-3 control-label">ชื่อจริง:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="<%=user.getFirstname()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">นามสกุล:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="<%=user.getLastname()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">วันเกิด:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="date" value="<%=customer.getBirthday()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">อีเมล:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="<%=user.getEmail()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">เบอร์โทรศัพท์ (1):</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="<%=user.getPhoneNumber1()%>">
                        </div>
                    </div>
                    <% if (user.getPhoneNumber2() != null) {%>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">เบอร์โทรศัพท์ (2):</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" name="phone_number" value="<%=user.getPhoneNumber2()%>" /><br>
                        </div>
                    </div>
                    <% } %>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">ที่อยู่:</label>
                        <% for (CustomerAddress i : customer.getCustomerAddress()) {%>

                        <label class="col-lg-3 control-label"></label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="<%=i.getAddress()%> <%=i.getDistrict()%> <%=i.getProvince()%> <%=i.getPostcode()%>" >
                        </div>
                        <% } %>
                    </div>
                    <!--                      
                    <div class="form-group">
                        <label class="col-md-3 control-label">Password:</label>
                        <div class="col-md-8">
                            <input class="form-control" type="password" value="11111122333">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Confirm password:</label>
                        <div class="col-md-8">
                            <input class="form-control" type="password" value="11111122333">
                        </div>
                    </div>
                    -->
                    <div class="form-group">
                        <label class="col-md-3 control-label"></label>
                        <div class="col-md-8">
                            <form method="POST" action="editProfile.jsp">
                                <input style="display: inline;" type="submit" name="action" class="btn btn-primary" value="Edit profile"/>
                                <input style="display: inline;" type="submit" name="action" class="btn btn-primary" value="Change password"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr>
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
<!-- left column -->
                        <sql:query var="profile" dataSource="bakery">
                            SELECT profile_photo FROM account WHERE username = '${account.username}'
                        </sql:query>
                            <div class="col-md-3" style="margin-top: 10%; text-align:center;">
                    <div class="picture-container1">
                    <div class="picturePro" style="background: white; width: 100%; height: 100%;">

                                <c:choose>
                                    <c:when test="${profile.rows[0].profile_photo != null}">
                                        <img src="${profile.rows[0].profile_photo}"  class="picture-src"  style="object-fit: cover; border-radius: 50%;" title="">
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
                        <sql:query var="term" dataSource="bakery">
                            SELECT DISTINCT t.description
                            FROM term_of_use t
                            JOIN store_type_term_of_use stt
                            ON (t.id = stt.term_of_use_id)
                            JOIN store_type st
                            ON (st.id = stt.store_type_id)
                            JOIN seller s
                            ON (s.store_type_id = st.id)
                            WHERE s.account_username = '<%=account.getUsername()%>'
                        </sql:query>
                        <c:forEach var="i" items="${term.rows}">
                            ${i.description}<br>
                        </c:forEach>
                    </div>
                    <h2>Personal info</h2>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">First name:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="<%=user.getFirstname()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Last name:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="<%=user.getLastname()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Email:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="<%=user.getEmail()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Phone:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="<%=user.getPhoneNumber1()%>">
                        </div>
                    </div>
                    <% if (user.getPhoneNumber2() != null) {%>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Phone:</label>
                        <div class="col-lg-8">
                            <% if (user.getPhoneNumber2() != null) {%>
                            <input class="form-control" type="text" name="phone_number" value="<%=user.getPhoneNumber2()%>" /><br>
                            <% } %>
                        </div>
                    </div>
                    <% } %>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Store name:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="<%=seller.getStoreName()%>">
                        </div>
                    </div>
                    <% if (seller.getStoreDescript() != null) {%>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Store description:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="<%=seller.getStoreDescript()%>"><br>
                        </div>
                    </div>
                    <% } %>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Store address:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="<%=seller.getStoreAddress()%>">
                        </div>
                    </div>
                    <% if (seller.getStoreTerm() != null) {%>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Term of use:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="<%=seller.getStoreTerm()%>">
                        </div>
                    </div>
                    <% } %>
                    
                    <div class="form-group">
                        <label class="col-md-3 control-label"></label>
                        <div class="col-md-8">
                            <form method="POST" action="editProfile.jsp">
                                <input style="display: inline;"  type="submit" name="action" class="btn btn-primary" value="Edit profile"/>
                                <input style="display: inline;"  type="submit" name="action" class="btn btn-primary" value="Change password"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <% } %>
    </body>
</html>
