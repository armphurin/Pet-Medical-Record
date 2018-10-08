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
        <%@include file="header.jsp" %>
        <% String complete = ""; %>
        <!-- start main -->
        <div class="main_bg">
            <div class="wrap">	
                <div class="main">
                    <div class="contact">				
                        <div class="contact-form">
                            <h2>Submit a request</h2><br>
                            <form method="post" action="ComplaintServlet">
                                <label class="fake-select">
                                    <select id="support_subject" class="select" name="select">
                                        <option value="0" selected="selected" disabled="">เลือกหัวข้อ</option>
                                        <option value="ไม่ได้รับสินค้า">ไม่ได้รับสินค้า</option>
                                        <option value="สินค้ามีปัญหา/มีตำหนิ">สินค้ามีปัญหา/มีตำหนิ</option>
                                        <option value="ระบบมีปัญหา">ระบบมีปัญหา</option>
                                        <option value="ร้องเรียนร้านค้า">ร้องเรียนร้านค้า</option>
                                        <option value="ร้องเรียนลูกค้า">ร้องเรียนลูกค้า</option>
                                        <option value="ร้องเรียนระบบ">ร้องเรียนระบบ</option>
                                        <option value="อื่นๆ">อื่นๆ</option>
                                    </select>
                                </label><br><br>
                                <span class="input-group">
                                    <label for="userEmail" style="font-size: 18px;">หัวเรื่อง</label>
                                    <input name="head" type="text" class="textbox">

                                </span>
                                <span class="textarea-group">
                                    <label for="userMsg" style="font-size: 18px;">คำร้องเรียน / ข้อเสนอแนะ</label>
                                    <textarea id="userMsg" name="complaint" cols="45" rows="5"></textarea>

                                </span><br>
                                <input type="submit" name="add" onclick="addAlert()" value="ส่งคำร้อง">
                            </form>
                        </div>
                        <div class="clear"></div>		
                    </div>
                </div>
            </div>
        </div>
        <script>
            function addAlert() {
                alert('ส่งคำร้องเสร็จสิ้น');
            }
        </script>
        
        
    </body>
</html>