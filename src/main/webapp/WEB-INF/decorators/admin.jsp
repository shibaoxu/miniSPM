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
    <title>miniSPM</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <link rel="shortcut icon" href="${ctx}/static/images/favicon.ico"/>
    <link href="${ctx}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${ctx}/static/css/ila.css" rel="stylesheet" media="screen">
    <link href="${ctx}/static/awesome/css/font-awesome.css" rel="stylesheet">
    <script src="${ctx}/static/jquery/jquery-1.8.2.min.js"></script>

    <sitemesh:head/>
</head>

<body>
<%@ include file="/WEB-INF/decorators/header.jsp" %>
<div class="row body-content">
    <div class="col-lg-2">
        <ul class="nav nav-pills nav-stacked">
            <li>用户与角色</li>
            <li id='sidebar_user'><a href="${ctx}/security/user/index">用户</a></li>
            <li id='sidebar_role'><a href="${ctx}/security/role/index">角色</a></li>
            <li>组织管理</li>
            <li id='sidebar_org_company'><a href="${ctx}/admin/org/company/index">公司</a></li>
            <li id='sidebar_org_department'><a href="${ctx}/admin/org/department/index">部门</a></li>
            <li id='sidebar_org_staff'><a href="${ctx}/admin/org/staff/index">员工</a></li>
            <li id='sidebar_org_structure'><a href="${ctx}/admin/org/structure">结构</a></li>
        </ul>
    </div>
    <div class="col-lg-10 ">
        <sitemesh:body/>
    </div>
</div>

<%@ include file="/WEB-INF/decorators/footer.jsp" %>
</div>
<script src="${ctx}/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $('#navbar_admin').addClass('active');
    if ("${url}".indexOf('/admin/user') >= 0) {
        $('#sidebar_user').addClass('active');
    } else if ("${url}".indexOf('/admin/role') >= 0) {
        $('#sidebar_role').addClass('active');
    }
    else if ("${url}".indexOf('/admin/org/company') >= 0) {
        $('#sidebar_org_company').addClass('active');
    }
    else if ("${url}".indexOf('/admin/org/department') >= 0) {
        $('#sidebar_org_department').addClass('active');
    }
    else if ("${url}".indexOf('/admin/org/staff') >= 0) {
        $('#sidebar_org_staff').addClass('active');
    }
    else if ("${url}".indexOf('/admin/org/structure') >= 0) {
        $('#sidebar_org_structure').addClass('active');
    }
    else {
    }
</script>

</body>
</html>