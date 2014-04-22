<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-12-30
  Time: 下午9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<ol class="breadcrumb">
    <li><a href="${ctx}/index">首页</a></li>
    <li><a href="${ctx}/sale/index">销售</a></li>
    <c:if test="${url == 'leads'}">
        <li><a href="${ctx}/sale/${url}/index">销售线索</a></li>
    </c:if>
    <c:if test="${url == 'opportunity'}">
        <li><a href="${ctx}/sale/${url}/index">销售机会</a></li>
    </c:if>
    <li><a href="${ctx}/sale/${url}/view/${leadsBaseId}">${leadsBaseName}</a></li>
    <li><a href="">关闭</a></li>
</ol>

<div>
    <form action="" method="post" id="closeLeads" class="form-horizontal">
        <fieldset>
            <%--<legend><h3><i class="icon-star"></i>&nbsp关闭销售线索或销售机会</h3></legend>--%>
            <div id="error" class="alert alert-warning hidden"></div>

            <input type="hidden" name="leadsId" value="${leadsBaseId}">

            <div class="form-group">
                <label class="col-md-1 text-right">关闭原因</label>

                <div class="col-md-2">
                    <select name="closeReasonId" class="form-control">
                        <c:forEach items="${closeReasons}" var="reason">
                            <option value="${reason.id}">${reason.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-1 text-right" for="closeReasonDetail">关闭详情</label>

                <div class="col-md-6">
                    <textarea id="closeReasonDetail" name="closeReasonDetail" rows="10" class="form-control"></textarea>
                </div>
            </div>
            <div class="controls-row form-action row">
                <div class="col-md-10 col-md-offset-1">
                <input class="btn btn-primary" type="submit" value="确定">
                <c:if test='${url == "leads"}'>
                    <a class="btn btn-default" href="${ctx}/sale/leads/index">返回</a>
                </c:if>
                <c:if test='${url == "opportunity"}'>
                    <a class="btn btn-default" href="${ctx}/sale/opportunity/index">返回</a>
                </c:if>
                </div>
            </div>
        </fieldset>
    </form>
</div>
