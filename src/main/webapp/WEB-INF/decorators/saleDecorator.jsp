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
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="url" value="${pageContext.request.servletPath}"/>

<!DOCTYPE html>
<html>
<head>
    <title>miniSPM<sitemesh:title/></title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>

    <%--<link rel="shortcut icon" href="${ctx}/static/images/favicon.ico"/>--%>
    <link rel="shortcut icon" href="${ctx}/static/images/logo.png" />
    <link href="${ctx}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${ctx}/static/css/ila.css" rel="stylesheet" media="screen">
    <link href="${ctx}/static/awesome/css/font-awesome.css" rel="stylesheet">
    <link href="${ctx}/static/jquery-validation/1.10.0/validate.css" type="text/css" rel="stylesheet"/>
    <link href="${ctx}/static/datepicker/css/datepicker.css" type="text/css" rel="stylesheet"/>


    <sitemesh:head/>
</head>

<body>
<%@ include file="/WEB-INF/decorators/header.jsp" %>
<div class="clearfix row body-content">
    <div class="col-md-2">
        <ul class="nav nav-pills nav-stacked">
            <li>机会与线索</li>
            <li id='sidebar_market_action'><a href="${ctx}/sale/market_action/index"><i
                    class="icon-bullhorn"></i>市场活动</a></li>
            <li id='sidebar_leads'><a href="${ctx}/sale/leads/index"><i class="icon-eye-open"></i>销售线索</a></li>
            <li id='sidebar_opportunity'><a href="${ctx}/sale/opportunity/index"><i class="icon-star"></i>销售机会</a></li>
            <li>客户维护</li>
            <li id='sidebar_customer'><a href="${ctx}/sale/customer/index"><i class="icon-shopping-cart"></i>客户</a></li>
        </ul>
    </div>
    <div class="col-md-10 ">
        <sitemesh:body/>
    </div>
</div>
<%@ include file="/WEB-INF/decorators/footer.jsp" %>
</div>
</body>
</html>