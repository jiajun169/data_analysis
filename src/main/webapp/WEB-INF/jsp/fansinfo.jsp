<%--
  Created by IntelliJ IDEA.
  User: haha
  Date: 2020/10/12
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <script>

    </script>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>Cloud Admin | Dynamic Tables</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- STYLESHEETS --><!--[if lt IE 9]><script src="/js/flot/excanvas.min.js"></script><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
    <link rel="stylesheet" type="text/css" href="/css/cloud-admin.css" >
    <link rel="stylesheet" type="text/css"  href="/css/themes/default.css" id="skin-switcher" >
    <link rel="stylesheet" type="text/css"  href="/css/responsive.css" >

    <link href="/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- JQUERY UI-->
    <link rel="stylesheet" type="text/css" href="/js/jquery-ui-1.10.3.custom/css/custom-theme/jquery-ui-1.10.3.custom.min.css" />
    <!-- DATE RANGE PICKER -->
    <link rel="stylesheet" type="text/css" href="/js/bootstrap-daterangepicker/daterangepicker-bs3.css" />
    <!-- DATA TABLES -->
    <link rel="stylesheet" type="text/css" href="/js/datatables/media/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="/js/datatables/media/assets/css/datatables.min.css" />
    <link rel="stylesheet" type="text/css" href="/js/datatables/extras/TableTools/media/css/TableTools.min.css" />
    <!-- FONTS -->
    <link href='#css?family=Open+Sans:300,400,600,700' rel='stylesheet' type='text/css'>
</head>
<body>
<!-- HEADER -->
<header class="navbar clearfix" id="header">
    <div class="container">
        <div class="navbar-brand">
            <!-- COMPANY LOGO -->
            <a href="index.html">
                <img src="img/logo/logo.png" alt="Cloud Admin Logo" class="img-responsive" height="30" width="120">
            </a>
            <!-- /COMPANY LOGO -->
            <!-- TEAM STATUS FOR MOBILE -->
            <div class="visible-xs">
                <a href="#" class="team-status-toggle switcher btn dropdown-toggle">
                    <i class="fa fa-users"></i>
                </a>
            </div>
            <!-- /TEAM STATUS FOR MOBILE -->
            <!-- SIDEBAR COLLAPSE -->
            <div id="sidebar-collapse" class="sidebar-collapse btn">
                <i class="fa fa-bars"
                   data-icon1="fa fa-bars"
                   data-icon2="fa fa-bars"></i>
            </div>
            <!-- /SIDEBAR COLLAPSE -->
        </div>

        <!-- BEGIN TOP NAVIGATION MENU -->
        <ul class="nav navbar-nav pull-right">
            <!-- BEGIN USER LOGIN DROPDOWN -->
            <li class="dropdown user pull-right" id="header-user">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <img alt="" src="img/avatars/avatar3.jpg"/>
                    <span class="username">John Doe</span>
                    <i class="fa fa-angle-down"></i>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="login.html"><i class="fa fa-power-off"></i> Log Out</a></li>
                </ul>
            </li>
            <!-- END USER LOGIN DROPDOWN -->
        </ul>
        <!-- END TOP NAVIGATION MENU -->
    </div>

</header>
<!--/HEADER -->

<!-- PAGE -->
<section id="page">
    <!-- SIDEBAR -->
    <div id="sidebar" class="sidebar">
        <div class="sidebar-menu nav-collapse">
            <!-- SIDEBAR MENU -->
            <ul>
                <li>
                    <a href="/index.html">
                        <i class="fa fa-tachometer fa-fw"></i> <span class="menu-text">粉丝信息可视化</span>
                    </a>
                </li>
                <li class="active"><a class="" href="/fans/findByCondition"><i class="fa fa-th-large fa-fw"></i> <span class="menu-text">粉丝信息管理</span></a>
                </li>
                <li><a class="" href="#" target="_blank"><i class="fa fa-desktop fa-fw"></i>
                    <span class="menu-text">粉丝信息分析</span></a></li>
                <li><a class="" href="#"><i class="fa fa-envelope-o fa-fw"></i> <span
                        class="menu-text">用户信息</span></a></li>
            </ul>
            <!-- /SIDEBAR MENU -->
        </div>
    </div>
    <!-- /SIDEBAR -->
    <div id="main-content">
        <!-- SAMPLE BOX CONFIGURATION MODAL FORM-->
        <div class="modal fade" id="box-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Box Settings</h4>
                    </div>
                    <div class="modal-body">
                        Here goes box setting content.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- /SAMPLE BOX CONFIGURATION MODAL FORM-->
        <div class="container">
            <div class="row">
                <div id="content" class="col-lg-12">
                    <!-- PAGE HEADER-->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="page-header">
                                <!-- STYLER -->
                                </br>
                                </br>
                                <!-- /STYLER -->
                                <div class="clearfix">
                                    <h3 class="content-title pull-left">粉丝数信息列表</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /PAGE HEADER -->

                    <!-- DATA TABLES -->
                    <div class="row">
                        <div class="col-md-12">

                            <div class="box border orange">
                                <div class="box-body big">
                                    <h3 class="form-title">信息检索</h3>
                                    <form class="form-inline" role="form" action="/fans/findByCondition">
                                        <div class="form-group">
                                            <label class="sr-only" for="exampleInputEmail2">Email address</label>
                                            <input type="text" class="form-control" id="exampleInputEmail2" name="name" value="${condition.name}" placeholder="昵称">
                                        </div>
                                        <div class="form-group">
                                            <label class="sr-only" for="exampleInputPassword2">Password</label>
                                            <input type="text" class="form-control" id="exampleInputPassword2" name="location" value="${condition.location}" placeholder="地区">
                                        </div>
                                        <div class="form-group">
                                            <select class="form-control" name="gender">
                                                <option value="" <c:if test="${condition.gender ==''}">
                                                    selected
                                                </c:if> >请选择性别
                                                </option>
                                                <option value="男" <c:if test="${condition.gender =='男'}">
                                                    selected
                                                </c:if>>男</option>
                                                <option value="女" <c:if test="${condition.gender =='女'}">
                                                    selected
                                                </c:if>>女</option>
                                            </select>
                                        </div>
                                        <button type="submit" class="btn btn-inverse">查询</button>
                                    </form>
                                </div>
                            </div>


                            <!-- BOX -->
                            <div class="box border pink">
                                <div class="box-title">
                                    <h4><i class="fa fa-table"></i>Simple Table</h4>
                                </div>
                                <div class="box-body">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th>编号</th>
                                            <th>昵称</th>
                                            <th>性别</th>
                                            <th>地区</th>
                                            <th>关注人数</th>
                                            <th>粉丝人数</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${pageInfo.list}" var="fan" varStatus="s">
                                            <tr>
                                                <td>${fan.id }</td>
                                                <!--						  <td><input type="checkbox"></td> -->
                                                <td>${fan.name }</td>
                                                <td>${fan.gender }</td>
                                                <td>${fan.location}</td>
                                                <td>${fan.follow}</td>
                                                <td>${fan.fans}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <td colspan="8" align="center">
                                                <ul class="pagination">
                                                    <li><a href="findByCondition?pn=1&name=${condition.name}&gender=${condition.gender}&location=${condition.location}">首页</a></li>
                                                    <c:if test="${pageInfo.hasPreviousPage}">
                                                        <li><a href="findByCondition?pn=${pageInfo.pageNum-1}&name=${condition.name}&gender=${condition.gender}&location=${condition.location}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
                                                    </c:if>
                                                    <c:forEach items="${pageInfo.navigatepageNums }"  var="page_Num">
                                                        <c:if test="${page_Num==pageInfo.pageNum }">
                                                            <li class="active"><a href="#">${page_Num}</a></li>
                                                        </c:if>
                                                        <c:if test="${page_Num!=pageInfo.pageNum }">
                                                            <li><a href="findByCondition?pn=${page_Num}&name=${condition.name}&gender=${condition.gender}&location=${condition.location}">${page_Num}</a></li>
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:if test="${pageInfo.hasNextPage}">
                                                        <li><a href="findByCondition?pn=${pageInfo.pageNum+1}&name=${condition.name}&gender=${condition.gender}&location=${condition.location}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
                                                    </c:if>
                                                    <li><a href="findByCondition?pn=${pageInfo.pages }&name=${condition.name}&gender=${condition.gender}&location=${condition.location}">尾页</a></li>
                                                </ul>
                                                <div>共 ${pageInfo.pages} 页，总共 ${pageInfo.total} 记录</div>
                                            </td>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                            <!-- /BOX -->
                        </div>

                    </div>
                    <!-- SIMPLE STRIPED -->
                    <!-- /DATA TABLES -->
                    <div class="separator"></div>
                    <div class="footer-tools">
							<span class="go-top">
								<i class="fa fa-chevron-up"></i> Top
							</span>
                    </div>
                </div><!-- /CONTENT-->
            </div>
        </div>
    </div>
</section>
<!--/PAGE -->
<!-- JAVASCRIPTS -->
<!-- Placed at the end of the document so the pages load faster -->
<!-- JQUERY -->
<script src="/js/jquery/jquery-2.0.3.min.js"></script>
<!-- JQUERY UI-->
<script src="/js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
<!-- BOOTSTRAP -->
<script src="/bootstrap-dist/js/bootstrap.min.js"></script>


<!-- DATE RANGE PICKER -->
<script src="/js/bootstrap-daterangepicker/moment.min.js"></script>

<script src="/js/bootstrap-daterangepicker/daterangepicker.min.js"></script>
<!-- SLIMSCROLL -->
<script type="/text/javascript" src="/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script><script type="text/javascript" src="js/jQuery-slimScroll-1.3.0/slimScrollHorizontal.min.js"></script>
<!-- BLOCK UI -->
<script type="/text/javascript" src="/js/jQuery-BlockUI/jquery.blockUI.min.js"></script>
<!-- TABLE CLOTH -->
<!-- TYPEHEAD -->
<script type="text/javascript" src="/js/typeahead/typeahead.min.js"></script><!-- AUTOSIZE -->
<script type="text/javascript" src="/js/autosize/jquery.autosize.min.js"></script>
<!-- COUNTABLE -->
<script type="text/javascript" src="/js/countable/jquery.simplyCountable.min.js"></script>
<!-- INPUT MASK -->
<script type="text/javascript" src="/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
<!-- SELECT2 -->
<script type="text/javascript" src="/js/select2/select2.min.js"></script>
<!-- UNIFORM -->
<script type="text/javascript" src="/js/uniform/jquery.uniform.min.js"></script>

<script type="/text/javascript" src="/js/tablecloth/js/jquery.tablecloth.js"></script>
<script type="/text/javascript" src="/js/tablecloth/js/jquery.tablesorter.min.js"></script>
<!-- COOKIE -->
<script type="/text/javascript" src="/js/jQuery-Cookie/jquery.cookie.min.js"></script>
<!-- CUSTOM SCRIPT -->
<script src="/js/script.js"></script>
<script>
    jQuery(document).ready(function() {
        App.setPage("simple_table");  //Set current page
        App.init(); //Initialise plugins and elements
    });
</script>
<!-- /JAVASCRIPTS -->
</body>
</html>