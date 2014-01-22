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
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<ol class="breadcrumb">
    <li><a href="${ctx}/index">首页</a></li>
    <li><a href="${ctx}/sale/index">销售</a></li>
    <li><a href="${ctx}/sale/market_action/index">市场活动</a></li>
</ol>
<div>
    <form class="form-horizontal" action="#">
        <div class="form-group">
            <div class="input-group col-lg-4">
                <input type="text" class="form-control" name="search_condition" placeholder="请输入简述..."
                       value="${param.search_condition}">
                <span class="input-group-btn">
                    <button type="submit" class="btn btn-default" id="search_btn"><i class="icon-search"></i>
                    </button>
                </span>
            </div>
            <shiro:hasPermission name="market_action:create:self">
                <a class="btn btn-primary" href="${ctx}/sale/market_action/new"><i class="icon-plus"></i>增加市场活动</a>
            </shiro:hasPermission>

        </div>
    </form>
</div>

<div>
    <table class="table table-striped table-condensed table-hover table-bordered">
        <thead>
        <tr>
            <td>类型</td>
            <td>简述</td>
            <td>客户</td>
            <td>时间</td>
            <td>所有者</td>
            <td>所属部门</td>
            <td></td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${marketActions.content}" var="action">
            <tr <c:if test="${action.important}">class='success'</c:if>>
                <td>
                    <c:choose>
                    <c:when test="${action.actionType.id=='telephone'}"><i class="icon-phone"></c:when>
                    <c:when test="${action.actionType.id=='visit'}"><i class="icon-plane"></c:when>
                        <c:when test="${action.actionType.id=='mail'}"><i class="icon-envelope"></c:when>
                            <c:when test="${action.actionType.id=='meeting'}"><i class="icon-group"></c:when>
                                <c:when test="${action.actionType.id=='message'}"><i
                                        class="icon-facebook-sign"></c:when>
                                    <c:otherwise><i class="icon-question-sign"></c:otherwise>
                                        </c:choose>
                </td>
                <td><a href="${ctx}/sale/market_action/view/${action.id}">${action.brief}</a>
                </td>
                </td>
                <td>${action.customer.name}
                </td>
                <td><fmt:formatDate value="${action.eventDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                <td>${action.owner.name}</td>
                <td>${action.department.name}</td>
                <td>
                    <div class="dropdown">
                        <a class="relate_menu dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-list"></i>
                        </a>
                        <ul class="dropdown-menu pull-right" role="menu">

                            <shiro:hasPermission name="market_action:view:*">
                            <li><a
                                    href="${ctx}/sale/market_action/view/${action.id}"><i class="icon-eye-close"></i>查看详情</a>
                            </li>
                            </shiro:hasPermission>
                            <li><a
                                    href="${ctx}/sale/market_action/edit/${action.id}"><i
                                    class="icon-edit"></i>修改</a>
                            </li>
                        </ul>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="row body-content">
    <tags:pagination page="${marketActions}"></tags:pagination>
    <div class="content-toolbar btn-toolbar pull-right clearfix">
        <div class="btn-group">
            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
                <i class="icon-share"></i>导出<span class="caret"></span>
            </button>
            <ul class="dropdown-menu pull-right" role="menu">
                <li>
                    <a href="?">
                        <i class="icon-table"></i>
                        Excel
                    </a>
                </li>
                <li>
                    <a href="?">
                        <i class="icon-table"></i>
                        Excel
                    </a>
                </li>
            </ul>

        </div>
        <button class="btn btn-default btn-sm pull-right" type="button">
            <i class="icon-fullscreen"></i>
        </button>
    </div>

</div>
<script type="text/javascript">
    require(['bootstrap'],function(){

    });
</script>

