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
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<ol class="breadcrumb">
    <li><a href="${ctx}/index">首页</a></li>
    <li><a href="${ctx}/sale/index">销售</a></li>
    <c:if test="${type =='leads'}">
        <li><a href="${ctx}/sale/leads/index">销售线索</a></li>
    </c:if>
    <c:if test="${type =='opportunity'}">
        <li><a href="${ctx}/sale/opportunity/index">销售机会</a></li>
    </c:if>
    <li><a href="${ctx}/sale/${type}/view/${leadsBase.id}">${leadsBase.name}</a></li>

    <li><a href="">销售活动</a></li>
</ol>
<div class="form-group">
    <c:if test="${type == 'leads'}">
        <shiro:hasPermission name="leads:edit:*">
            <a class="btn btn-primary" href="${ctx}/sale/${type}/${leadsBase.id}/action/new"><i class="icon-plus"></i>增加销售活动</a>
        </shiro:hasPermission>
    </c:if>
    <c:if test="${type == 'opportunity'}">
        <shiro:hasPermission name="opportunity:edit:*">
            <a class="btn btn-primary" href="${ctx}/sale/${type}/${leadsBase.id}/action/new"><i class="icon-plus"></i>增加销售活动</a>
        </shiro:hasPermission>
    </c:if>
</div>

<table class="table table-striped table-bordered table-hover table-condensed">
    <thead>
    <tr>
        <td>类型</td>
        <td>简述</td>
        <td>时间</td>
        <td>参入者</td>
        <td>所有者</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${actions}" var="action">
        <tr <c:if test="${action.milestone}">class='success'</c:if>>
            <td>
                <c:choose>
                <c:when test="${action.actionType.id=='telephone'}"><i class="icon-phone"></c:when>
                <c:when test="${action.actionType.id=='visit'}"><i class="icon-plane"></c:when>
                    <c:when test="${action.actionType.id=='mail'}"><i class="icon-envelope"></c:when>
                        <c:when test="${action.actionType.id=='meeting'}"><i class="icon-group"></c:when>
                            <c:when test="${action.actionType.id=='message'}"><i class="icon-facebook-sign"></c:when>
                                <c:when test="${action.actionType.id=='system'}"><i class="icon-lightbulb"></c:when>
                                    <c:otherwise><i class="icon-question-sign"></c:otherwise>
                                        </c:choose>
            </td>
            <td><a href="${ctx}/sale/${type}/${leadsBase.id}/action/view/${action.id}">${action.brief}</a>
            </td>
            <td><fmt:formatDate value="${action.occurDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
            <td>${action.customerParticipants};${action.selfParticipants}</td>
            <td>${action.owner.name}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

