<%-- 
    Document   : userAccount
    Created on : Apr 27, 2018, 6:21:11 PM
    Author     : Sattaya Singkul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Wanjai Admin</title>
        <link rel="icon" type="image/png" sizes="96x96" href="images/favicon-96x96.png">
        <!-- Bootstrap core CSS-->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Page level plugin CSS-->
        <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="css/sb-admin.css" rel="stylesheet">
    </head>

    <body class="fixed-nav sticky-footer bg-dark" id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
            <a class="navbar-brand" href="adminIndex.jsp">Wanjai</a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                    aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
                        <a class="nav-link" href="adminIndex.jsp">
                            <i class="fa fa-fw fa-dashboard"></i>
                            <span class="nav-link-text">หน้าหลัก</span>
                        </a>
                    </li>

                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Example Pages">
                        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseExamplePages" data-parent="#exampleAccordion">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">ตาราง</span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="collapseExamplePages">
                            <li>
                                <a href="shoppingCartHistory.jsp">ประวัติการสั่งซื้อ</a>
                            </li>
                                                        <li>
                                <a href="contactData.jsp">ข้อมูลติดต่อผู้ดูแล</a>
                            </li>
                            <li>
                                <a href="termManage.jsp">เงื่อนไขของแต่ละประเภทร้านค้า</a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                        <a class="nav-link" href="userAccount.jsp">
                            <i class="fa fa-fw fa-wrench"></i>
                            <span class="nav-link-text">จัดการบัญชีผู้ใช้</span>
                        </a>
                    </li>
                    

                </ul>
                <ul class="navbar-nav sidenav-toggler">
                    <li class="nav-item">
                        <a class="nav-link text-center" id="sidenavToggler">
                            <i class="fa fa-fw fa-angle-left"></i>
                        </a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">s
                    
                    <li class="nav-item">
                        <form class="form-inline my-2 my-lg-0 mr-lg-2">
                            <div class="input-group">
                                <input class="form-control" type="text" placeholder="Search for...">
                                <span class="input-group-append">
                                    <button class="btn btn-primary" type="button">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                            </div>
                        </form>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
                            <i class="fa fa-fw fa-sign-out"></i>ออกจากระบบ</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="content-wrapper">
            <div class="container-fluid">
                <!-- Breadcrumbs-->
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="adminIndex.jsp">หน้าหลัก</a>
                    </li>
                    <li class="breadcrumb-item active">จัดการบัญชีผู้ใช้</li>
                </ol>


                <sql:query var="cart" dataSource="bakery">
                    SELECT shopping_basket.id, shopping_basket.order_completion_time, shopping_basket.customer_account_username, sum(order_item.price) 'Total', order_item.status, inventory.seller_account_username
                    FROM shopping_basket
                    JOIN order_item
                    ON (shopping_basket.id = order_item.shopping_basket_id)
                    JOIN inventory
                    ON (order_item.inventory_id = inventory.id)
                    GROUP BY shopping_basket.id, inventory.seller_account_username
                </sql:query>


                <!-- Example DataTables Card-->
                            <!-- Example DataTables Card-->
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fa fa-table"></i>Data Table Example</div>
                <div class="card-body">
                    <div class="table-responsive">
                        <sql:query var="account" dataSource="bakery">
                            SELECT username, user_email, last_login_date, account_type
                            FROM account
                            WHERE account_type is not null
                        </sql:query>

                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>User name</th>
                                    <th>Email</th>
                                    <th>Last Login Date</th>
                                    <th>Account type</th>
                                    <th>Manage</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>User name</th>
                                    <th>Email</th>
                                    <th>Last Login Date</th>
                                    <th>Account type</th>
                                    <th>Manage</th>
                                </tr>
                            </tfoot>
                            <!-- start loop -->
                            <tbody>
                                <c:set var="count" value="${0}"/>
                                <c:forEach var="row" items="${account.rows}">
                                    <tr>
                                        <td>${row.username}</td>
                                        <td>${row.user_email}</td>
                                        <td>${row.last_login_date}</td>
                                        <td>${row.account_type}</td>
                                        <td>
                                            <form method="POST" action="DeleteAccountServlet" id="delete${count}">
                                                <a href="javascript:;" class="btn btn-primary" onclick="deleteAlert('username${count}', ${count});">ลบบัญชี</a>
                                                <input type="hidden" id="username${count}" value="${row.username}"/>
                                                <input type="hidden" name="user_name" value="${row.username}"/>
                                                <input type="hidden" name="user_email" value="${row.user_email}"/>
                                                <input type="hidden" name="accountType" value="${row.account_type}"/>
                                            </form>
                                        </td>
                                    </tr>
                                    <c:set var="count" value="${count+1}"/>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
            </div>
            </div>
            <!-- /.container-fluid-->
            <!-- /.content-wrapper-->
            <footer class="sticky-footer">
                <div class="container">
                    <div class="text-center">
                        <small>&copy;  All rights reserved | © Project website 2018</small>
                    </div>
                </div>
            </footer>
            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fa fa-angle-up"></i>
            </a>
            <!-- Logout Modal-->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                             <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <a class="btn btn-primary" href="SignoutAdminServlet">Logout</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Bootstrap core JavaScript-->
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <!-- Core plugin JavaScript-->
            <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
            <!-- Page level plugin JavaScript-->
            <script src="vendor/datatables/jquery.dataTables.js"></script>
            <script src="vendor/datatables/dataTables.bootstrap4.js"></script>
            <!-- Custom scripts for all pages-->
            <script src="js/sb-admin.min.js"></script>
            <!-- Custom scripts for this page-->
            <script src="js/sb-admin-datatables.min.js"></script>
        </div>
                                
                                <script>
                                                                                        function deleteAlert(clickedId, count) {
                                                        if (confirm('ต้องการลบผู้ใช้งาน Username : ' + document.getElementById(clickedId).value + '?')) {
                                                            document.getElementById('delete' + count).submit();
                                                        }
                                                    }
                                </script>
    </body>

</html>