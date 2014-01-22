<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-12-30
  Time: 下午9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<ol class="breadcrumb">
    <li><a href="${ctx}/admin/index">系统管理</a></li>
    <li><a href="${ctx}/security/user/index">用户</a></li>
</ol>
<div class="row">
    <div class="col-lg-6">
        <table class="table table-striped table-bordered table-hover table-condensed">
            <thead>
            <tr>
                <td>登录名</td>
                <td>姓名</td>
                <td>状态</td>
                <td>操作</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="user">
                <tr <c:if test="${action.milestone}">class='success'</c:if>>
                    <td>
                            ${user.jobNumber}
                    </td>
                    <td>
                        <a href="${ctx}/security/user/${user.id}">${user.name}</a>
                    </td>
                    <td>${user.status}</td>
                    <td>
                        <div class="dropdown">
                            <a class="relate_menu dropdown-toggle" data-toggle="dropdown">
                                <i class="icon-list"></i>
                            </a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="${ctx}/security/user/${user.id}"><i class="icon-edit"></i>修改</a></li>
                                <li><a href="#" class='lockUser' userId='${user.id}'><i class="icon-lock"></i>锁定</a>
                                </li>
                                <li><a href="#" class='unlockUser' userId='${user.id}'><i class="icon-unlock"></i>解锁</a>
                                </li>
                                <li><a href="#" class='activeUser' userId='${user.id}'><i class="icon-lightbulb"></i>激活</a>
                                </li>
                            </ul>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="row">
    <div class="col-lg-6">
        <a class="btn btn-primary" href="${ctx}/security/user/new"><i class="icon-plus"></i>增加新用户</a>
    </div>
</div>

<script type="text/javascript">
    require(['admin/user', 'bootstrap'], function (controller) {
        controller.init();
    });
</script>