<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 13-1-2
  Time: 下午6:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4 col-xs-10 col-xs-offset-1">
            <div>
                <image alt="logo" src="${ctx}/static/images/login.jpg" class="img-responsive"></image>
            </div>
            <form action="${ctx}/login" method="post">
                <h3><spring:message code="login.caption"/> </h3>
                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                        <input name="username" class="form-control" placeholder=<spring:message code='login.userName.placeHolder'/> type="text" value="${username}">
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                        <input name="password" class="form-control" placeholder=<spring:message code="login.password.placeHolder"/> type="password">
                    </div>
                </div>
                <input type="submit" class="btn btn-large btn-primary" value=<spring:message code="login.submit"/> >
            </form>
        </div>
    </div>
</div>