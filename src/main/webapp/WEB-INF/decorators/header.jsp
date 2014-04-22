<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-11-12
  Time: 下午9:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script src="${ctx}/static/require/require.js" type="text/javascript"></script>
<script src="${ctx}/js/common.js"></script>


<div class="navbar  navbar-fixed-top navbar-inverse" id="topbar">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#"><spring:message code="productName"/></a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li id='navbar_homepage'><a href="${ctx}/index"><spring:message code="topbar.homepage"/> </a></li>
                <shiro:hasAnyRoles name="sales,tradeManager,saleManager,salessistant,divisionManager">
                    <li id='navbar_sale'><a href="${ctx}/sale/index"><spring:message code="topbar.sale"/></a></li>
                </shiro:hasAnyRoles>
                <shiro:hasRole name="administrator">
                    <li id='navbar_admin'><a href="${ctx}/admin/index"><spring:message code="topbar.systemManagement"/></a></li>
                </shiro:hasRole>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <shiro:principal property="name"/><b
                            class="caret"></b></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="${ctx}/logout"><i class="icon-signout"></i><spring:message code="command.exit"/></a></li>
                        <li><a href="${ctx}/security/user/chgpwd"><i class="icon-key"></i><spring:message code="command.changePassword"/> </a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>