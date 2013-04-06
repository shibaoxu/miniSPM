<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-11-12
  Time: 下午9:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<div class="navbar">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="#">iLA</a>

            <div class="nav-collapse collapse">
                <div class="pull-right">
                    <%--Logged in as <a href="#" class="navbar-link">Username</a>--%>

                    <div class="btn-group">
                        <button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
                            <shiro:principal property="name"/>&nbsp<span class="caret"/>
                        </button>
                        <ul class="dropdown-menu pull-right">
                            <li><a href="${ctx}/logout"><i class="icon-signout"></i>退出</a></li>
                            <li><a href="${ctx}/security/user/chgpwd"><i class="icon-key"></i>修改密码</a></li>
                        </ul>
                    </div>
                </div>
                <ul class="nav">

                    <li id='navbar_homepage'><a href="${ctx}/index">首页</a></li>
                    <shiro:hasAnyRoles name="sales,tradeManager,saleManager,salessistant,divisionManager">
                        <li id='navbar_sale'><a href="${ctx}/sale/index">销售</a></li>
                    </shiro:hasAnyRoles>
                    <%--<li id='navbar_project'><a href="${ctx}/project/index">项目</a></li>--%>
                    <shiro:hasRole name="administrator">
                        <li id='navbar_admin'><a href="${ctx}/admin/index">系统管理</a></li>
                    </shiro:hasRole>
                </ul>
            </div>
        </div>
    </div>
</div>
