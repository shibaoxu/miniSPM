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
    <link href="${ctx}/static/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet"/>
    <sitemesh:head/>
</head>
<body>
<%@ include file="/WEB-INF/decorators/header.jsp" %>
<div class="row body-content">
    <div class="col-lg-2" id='sale_sidebar'>
        <ul class="nav nav-pills nav-stacked">
            <li>用户与角色</li>
            <li id='sidebar_user'><a href="${ctx}/security/user/index"><i class="icon-user"></i>用户</a></li>
            <li id='sidebar_role'><a href="${ctx}/security/role/index"><i class="icon-user-md"></i>角色</a></li>
            <li>组织管理</li>
            <li id='sidebar_org_company'><a href="${ctx}/admin/org/company/index"><i class="icon-home"></i>公司</a></li>
            <li id='sidebar_org_department'><a href="${ctx}/admin/org/department/index"><i class="icon-truck"></i>组织</a></li>
            <li id='sidebar_org_staff'><a href="${ctx}/admin/org/staff/index"><i class="icon-user"></i>员工</a></li>
            <li id='sidebar_org_structure'><a href="${ctx}/admin/org/structure"><i class="icon-sitemap"></i></i>结构</a>
            </li>
        </ul>
    </div>
    <div class="col-lg-10 ">
        <sitemesh:body/>
    </div>
</div>
<%@ include file="/WEB-INF/decorators/footer.jsp" %>
</body>
</html>