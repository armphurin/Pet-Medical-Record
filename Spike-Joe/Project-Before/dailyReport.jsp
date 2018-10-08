<%@page import="models.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Wan-jai</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" sizes="96x96" href="images/favicon-96x96.png">
        <link rel="stylesheet" href="bootstrap3/css/bootstrap.min.css">
        <link href="css/calendar.css" rel="stylesheet" />
        <script src="js/jquery.min.js"></script>
        <script src="bootstrap3/js/bootstrap.min.js"></script>


        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />


        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <!--===============================================================================================-->

        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="main_bg1">
            <div class="wrap">
                <div class="main1">
                    <h2>Report Sell Date</h2>
                </div>
            </div>
        </div>
         <% Account account = (Account) session.getAttribute("account");
            String username = account.getUsername();
            String sql = "SELECT DATE_FORMAT(shopping_basket.order_completion_time, '%d') 'date', DATE_FORMAT(shopping_basket.order_completion_time, '%M') 'Month',inventory.name, sum(order_item.amount) 'amount', order_item.price*sum(order_item.amount) 'price' FROM order_item JOIN inventory ON (order_item.inventory_id = inventory.id) JOIN shopping_basket ON (order_item.shopping_basket_id = shopping_basket.id) WHERE seller_account_username = '"+account.getUsername()+"' AND DATE(shopping_basket.order_completion_time) = CURDATE() GROUP BY inventory.id";
            if (request.getAttribute("queryString") != null){
                sql = (String) request.getAttribute("queryString");
            }
        %>
        <sql:query var="dailyReport" dataSource="bakery">
            <%=sql%>
        </sql:query>
        
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div style="text-align: center;">
                        <div class="limiter">
                            <div class="container-table100">
                                <div class="wrap-table100">
                                    <div class="table100">
                                        <table class="table100c">
                                            <thead>
                                                <tr class="table100-head">
                                                    <th class="column1">Name</th>
                                                    <th class="column2">Total Amount</th>
                                                    <th class="column3">Total Price</th>
                                                    <!--<th class="column4">Price</th>
                                                    <th class="column5">Quantity</th>
                                                    <th class="column6">Total</th>-->
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="row" items="${dailyReport.rows}">
                                                <tr>
                                                    <td class="column1">${row.name}</td>
                                                    <td class="column2">${row.amount}</td>
                                                    <td class="column3">${row.price}</td>
                                                </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--<div class="pagmore">
                            <div class="pagination">
                                <a href="#">&laquo;</a>
                                <a href="#">&raquo;</a>
                            </div>
                        </div>-->
                    </div>

                </div>
                
                
                <div class="col-sm-6">  <div class="calendar-container">
                        <header>
                            <c:choose>
                                <c:when test="${dailyReport.rows[0].date == null}">
                                    <h1>NOT FOUND</h1>
                                </c:when>
                                <c:otherwise>
                                    <div class="day">${dailyReport.rows[0].date}</div>
                            <div class="month">${dailyReport.rows[0].month}</div>
                                </c:otherwise>
                            </c:choose>
                            
                            
                        </header>
                            <form method="POST" action="ViewDailyReportServlet">
                            <input type="date" name="date" value=""/>
                            <button>Submit</button>
                            </form>
                        <table class="calendar tcalendar">

                            <thead>

                                <tr>
                                    <td>Sun</td>
                                    <td>Mon</td>
                                    <td>Tue</td>
                                    <td>Wed</td>
                                    <td>Thu</td>
                                    <td>Fri</td>
                                    <td>Sat</td>
                                    

                                </tr>

                            </thead>

                            <tbody>

                                <tr>
                                    <!--<td class="prev-month">29</td>
                                    <td class="prev-month">30</td>
                                    <td class="prev-month">31</td>-->
                                    <td>1</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>5</td>
                                    <td>6</td>
                                    <td>7</td>
                                </tr>

                                <tr>
                                    <td>8</td>
                                    <td>9</td>
                                    <td>10</td>
                                    <td>11</td>
                                    <td>12</td>
                                    <td>13</td>
                                    <td>14</td>
                                </tr>

                                <tr>
                                    <td>15</td>
                                    <td>16</td>
                                    <td>17</td>
                                    <td>18</td>
                                    <td>19</td>
                                    <td>20</td>
                                    <td>21</td>
                                </tr>

                                <tr>
                                    <td>22</td>
                                    <td>23</td>
                                    <td>24</td>
                                    <td>25</td>
                                    <td>26</td>
                                    <td>27</td>
                                    <td>28</td>
                                </tr>

                                <tr>
                                    <td>29</td>
                                    <td>30</td>
                                    <td class="next-month">1</td>
                                    <td class="next-month">2</td>
                                    <td class="next-month">3</td>
                                    <td class="next-month">4</td>
                                    <td class="next-month">5</td>
                                </tr>

                            </tbody>

                        </table>

                        <!--<div class="ring-left"></div>
                        <div class="ring-right"></div>-->

                    </div></div>
            </div>
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

    </body>
</html>
