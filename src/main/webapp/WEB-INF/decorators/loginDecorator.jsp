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

<html>
<head>
    <title>miniSPM<sitemesh:title/></title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <link rel="shortcut icon" href="${ctx}/static/images/favicon.ico"/>


    <link rel="shortcut icon" href="${ctx}/static/images/favicon.ico" />
    <link href="${ctx}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${ctx}/static/css/ila.css" rel="stylesheet" media="screen">
    <link href="${ctx}/static/awesome/css/font-awesome.css" rel="stylesheet">

    <script src="${ctx}/static/jquery/jquery-1.8.2.min.js"></script>
    <script src="${ctx}/static/jquery-validation/1.10.0/jquery.validate.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/jquery-validation/1.10.0/messages_bs_zh.js" type="text/javascript"></script>
    <link href="${ctx}/static/jquery-validation/1.10.0/validate.css" type="text/css" rel="stylesheet" />
    <script src="${ctx}/static/datepicker/js/bootstrap-datepicker.js" type="text/javascript"></script>
    <link href="${ctx}/static/datepicker/css/datepicker.css" type="text/css" rel="stylesheet" />

    <sitemesh:head/>
</head>

<body>
<sitemesh:body/>
<script src="${ctx}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>