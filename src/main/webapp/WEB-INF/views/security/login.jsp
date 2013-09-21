<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 13-1-2
  Time: 下午6:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title></title>
</head>
<body>

<div class="container">
    <form action="${ctx}/login" method="post" class="form-signin">
        <h3 class="form-signin-heading">请登录</h3>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="icon-user"></i></span>
                <input name="username" class="form-control" placeholder="工号" type="text" value="${username}">
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="icon-lock"></i></span>
                <input name="password" class="form-control" placeholder="密码" type="password">
            </div>
        </div>

        <label class="checkbox">
            <input type="checkbox" name="rememberMe"/>
            记住我
        </label>
        <input type="submit" class="btn btn-large btn-primary" value="登录">
    </form>
</div>
<div class="form-signin">
    <img src="${ctx}/static/images/chrome.png" width="30px" height="30px" alt="">
    <img src="${ctx}/static/images/firefox.png" width="30px" height="30px" alt="">
    <img src="${ctx}/static/images/noIE.png" width="30px" height="30px" alt="">
</div>

</body>
</html>