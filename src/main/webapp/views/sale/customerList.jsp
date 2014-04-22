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
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div>
    <ol class="breadcrumb">
        <li><a href="${ctx}/index">首页</a></li>
        <li><a href="${ctx}/sale/index">销售</a></li>
        <li><a href="${ctx}/sale/customer/index">客户</a></li>
    </ol>
</div>
<div class="row toolbar clearfix">
    <form class="" action="#">
        <div class="col-md-6">
            <div class="input-group">
                <input type="text" class="form-control" name="search_LIKE_name" placeholder="请输入客户名称..."
                       value="${param.search_LIKE_name}">
                <span class="input-group-btn">
                    <button type="submit" class="btn btn-default" id="search_btn"><i class="fa fa-search fa-fw"></i></button>
                </span>
            </div>
        </div>
        <div class="col-md-6 text-right">
            <a class="btn btn-primary" href="${ctx}/sale/customer/new"><i class="fa fa-plus-circle fa-fw"></i> 增加新的客户</a>
        </div>
    </form>
</div>

<table class="table table-striped table-bordered table-hover table-condensed">
    <thead>
    <tr>
        <td>名称</td>
        <td>行业</td>
        <td>规模</td>
        <td>是否新客户</td>
        <td></td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${customers.content}" var="customer">
        <tr <c:if test="${customer.develop}">class="success" </c:if>>
            <td>
                <a href="${ctx}/sale/customer/${customer.id}">${customer.name}</a>
            </td>
            <td>
                    ${customer.industry.name}
            </td>
            <td>
                    ${customer.scale.name}
            </td>
            <td>
                <c:if test="${customer.develop}">
                    是
                </c:if>
            </td>

            <td class="text-center" style="width: 40px">
                <div class="dropdown">
                    <a class="btn dropdown-toggle context-menu" data-toggle="dropdown">
                        <i class="fa fa-list fa-fw"></i>
                    </a>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <li><a href="${ctx}/sale/customer/${customer.id}"><i class="fa fa-edit fa-fw"></i> 修改</a></li>
                        <li><a href="${ctx}/sale/customer/${customer.id}/remove"><i class="fa fa-cut fa-fw"></i> 删除</a></li>
                    </ul>
                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<tags:pagination page="${customers}"></tags:pagination>
<script type="text/javascript">
    require(['bootstrap'], function () {

    });
</script>
