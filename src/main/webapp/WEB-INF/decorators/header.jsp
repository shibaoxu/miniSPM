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
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script src="${ctx}/static/require/require.js" type="text/javascript"></script>
<script src="${ctx}/js/common.js"></script>


<div class="navbar navbar-default" role="navigation">
    <div class="navbar-header">
        <a class="navbar-brand" href="#">miniSPM</a>
        <%--<img src="${ctx}/static/images/logo.png" class="navbar-brand" >--%>
    </div>
    <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
            <li id='navbar_homepage'><a href="${ctx}/index">首页</a></li>
            <shiro:hasAnyRoles name="sales,tradeManager,saleManager,salessistant,divisionManager">
                <li id='navbar_sale'><a href="${ctx}/sale/index">销售</a></li>
            </shiro:hasAnyRoles>
            <shiro:hasRole name="administrator">
                <li id='navbar_admin'><a href="${ctx}/admin/index">系统管理</a></li>
            </shiro:hasRole>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <shiro:principal property="name"/><b class="caret"></b></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="${ctx}/logout"><i class="icon-signout"></i>退出</a></li>
                    <li><a href="${ctx}/security/user/chgpwd"><i class="icon-key"></i>修改密码</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
