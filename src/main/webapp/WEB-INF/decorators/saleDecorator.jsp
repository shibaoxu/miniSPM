<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-11-12
  Time: 下午9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="url" value="${pageContext.request.servletPath}"/>

<!DOCTYPE html>
<html>
<head>
    <title>miniSPM</title>
    <meta charset="utf-8"/>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="shortcut icon" href="${ctx}<spring:theme code='shortcutIcon'/>"/>
    <link href="${ctx}<spring:theme code='bootstrapCSS' />" rel="stylesheet"/>
    <link href="${ctx}/static/awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="${ctx}<spring:theme code="miniSPMCSS"/>" rel="stylesheet"/>

    <%--<link href="${ctx}/static/awesome/css/font-awesome.css" rel="stylesheet">--%>
    <link href="${ctx}/static/jquery-validation/1.10.0/validate.css" type="text/css" rel="stylesheet"/>
    <link href="${ctx}/static/datepicker/css/datepicker.css" type="text/css" rel="stylesheet"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<div class="container" id="content">
    <%@ include file="/WEB-INF/decorators/header.jsp" %>
    <div class="row">
        <div class="col-md-2 col-sm-3">
            <div id="sideBar" class="side-bar" role="complementary">
                <ul class="nav side-nav">
                    <li>
                        <a href="#">机会与线索</a>
                        <ul class="nav">
                            <li id='sidebar_market_action'><a href="${ctx}/sale/market_action/index"><i
                                    class="fa fa-eye fa-fw"></i> 市场活动</a></li>
                            <li id='sidebar_leads'><a href="${ctx}/sale/leads/index"><i class="fa fa-bell fa-fw"></i> 销售线索</a>
                            </li>
                            <li id='sidebar_opportunity'><a href="${ctx}/sale/opportunity/index"><i
                                    class="fa fa-anchor fa-fw"></i> 销售机会</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">客户管理</a>
                        <ul class="nav">
                            <li id='sidebar_customer'><a href="${ctx}/sale/customer/index"><i
                                    class="fa fa-shopping-cart fa-fw"></i> 客户</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-10 ">
            <sitemesh:body/>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/decorators/footer.jsp" %>
</div>
</body>
</html>