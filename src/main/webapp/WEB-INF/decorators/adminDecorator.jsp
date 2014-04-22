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
    <title><spring:message code="productName"/></title>
    <meta charset="utf-8"/>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <%--<link rel="shortcut icon" href="${ctx}/static/images/favicon.ico"/>--%>
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
            <div id="sideBar" class="side-bar"  role="complementary">
                <ul class="nav side-nav">
                    <li><a href="#"><spring:message code="sidebar.userAndRole"/></a>
                        <ul class="nav">
                            <li id='sidebar_user'><a href="${ctx}/security/user/index"><i class="fa fa-user fa-fw"></i> <spring:message code="sidebar.user"/></a></li>
                            <li id='sidebar_role'><a href="${ctx}/security/role/index"><i class="fa fa-users fa-fw"></i> <spring:message code="sidebar.role"/></a></li>
                        </ul>
                    </li>
                    <li><a href="#"><spring:message code="sidebar.orgMgt"/></a>
                        <ul class="nav">
                            <li id='sidebar_org_company'><a href="${ctx}/admin/companies/"><i
                                    class="fa fa-home fa-fw"></i> <spring:message code="sidebar.company"/></a>
                            </li>
                            <li id='sidebar_org_department'><a href="${ctx}/admin/departments"><i
                                    class="fa fa-truck fa-fw"></i> <spring:message code="sidebar.department"/></a>
                            </li>
                            <li id='sidebar_org_staff'><a href="${ctx}/admin/org/staff/index"><i class="icon-user"></i> <spring:message code="sidebar.staff"/></a>
                            </li>
                            <li id='sidebar_org_structure'><a href="${ctx}/admin/org/structure"><i class="icon-sitemap"></i></i>
                                <spring:message code="sidebar.structure"/></a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-10 col-sm-9">
            <sitemesh:body/>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/decorators/footer.jsp" %>
</body>
</html>