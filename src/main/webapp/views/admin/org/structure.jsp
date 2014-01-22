<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-12-15
  Time: 下午9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<ol class="breadcrumb">
    <li><a href="${ctx}/admin/index">系统管理</a></li>
    <li><a href="${ctx}/admin/org/structure">组织结构配置</a></li>
</ol>
<div class="row">
    <div class="col-lg-4">
        <select id='org_type'>
            <c:forEach items="${orgType}" var="item">
                <option value="${item.id}">${item.name}</option>
            </c:forEach>
        </select>
        <ul id='org_tree' class="ztree" style="margin-top:10px;height: 400px;overflow-y: scroll;border: 1px solid #CCCCCC;"></ul>
        <button id='removeOrg' class="btn btn-default" style="margin-top: 10px">从上级删除</button>
    </div>
    <div class="col-lg-6">
        <div class="col-lg-6">
            <h3>未分配部门</h3>
            <div class="row" style="padding-bottom: 10px;padding-right: 5px">
                <select id='unAssignedDept' multiple="true" class="form-control" style="height: 375px"></select>
            </div>
            <div class="row">
                <button id='addDept' class="btn btn-default">添加到下级</button>
            </div>
        </div>
        <div class="col-lg-6">
            <h3>未分配员工</h3>
            <div class="row" style="padding-bottom: 10px;padding-left: 5px">
                <select id='unAssignedStaff' multiple="true" class="form-control" style="height: 375px"></select>
            </div>
            <div class="row" style="padding-left: 5px">
                <button id='addStaff' class="btn btn-default">添加到下级</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    require(['admin/structure','bootstrap','ztree'], function (controller) {
        controller.init();
    });
</script>
