<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
                    <li class="breadcrumb-item">
                        <a href="#">ตาราง</a>
                    </li>
                    <li class="breadcrumb-item active">ข้อมูลติดต่อผู้ดูแล</li>
                </ol>
                <sql:query var="term" dataSource="bakery">
                    SELECT s.account_username, s.shop_name, stt.store_type_id , t.description, stt.term_of_use_id , st.type, max(i.price) 'max_price', max(delivery_cost) 'max_delivery'
                    FROM term_of_use t
                    JOIN store_type_term_of_use stt
                    ON (t.id = stt.term_of_use_id)
                    JOIN store_type st
                    ON (stt.store_type_id = st.id)
                    JOIN seller s
                    ON (s.store_type_id = st.id)
                    JOIN inventory i
                    ON (i.seller_account_username = s.account_username)
                    GROUP BY s.account_username, t.id;
                </sql:query>
                
                <!-- Example DataTables Card-->
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fa fa-table"></i> Data Table Example</div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Seller Username</th>
                                        <th>Store name</th>
                                        <th>Term of Use ID</th>
                                        <th>Description</th>
                                        <th>Store type ID</th>
                                        <th>Store type name</th>
                                        <th>Max Item Price</th>
                                        <th>Max Delivery Cost</th>

                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Seller Username</th>
                                        <th>Store name</th>
                                        <th>Term of Use ID</th>
                                        <th>Description</th>
                                        <th>Store type ID</th>
                                        <th>Store type name</th>
                                        <th>Max Item Price</th>
                                        <th>Max Delivery Cost</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    <c:forEach var="row" items="${term.rows}">
                                    <tr>
                                        <td>${row.account_username}</td>
                                        <td>${row.shop_name}</td>
                                        <td>${row.term_of_use_id}</td>
                                        <td>${row.description}</td>
                                        <td>${row.store_type_id}</td>
                                        <td>${row.type}</td>
                                        <td>${row.max_price}</td>
                                        <td>${row.max_delivery}</td>
                                    </tr>
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
    </body>

</html>

