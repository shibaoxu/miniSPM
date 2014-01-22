<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 13-2-19
  Time: 下午2:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<head>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#chgpwd_form').validate({
                errorLabelContainer: $("div#error"),
                rules: {
                    oldPassword: "required",
                    newPassword: {
                        required: true,
                        minlength: 6
                    },
                    rnewPassword: {
                        required: true,
                        minlength: 6,
                        equalTo: "#newPassword"
                    }
                },
                messages: {
                    oldPassword: {required: "必须输入旧密码"},
                    newPassword: {
                        required: "必须输入新密码",
                        minlength: "密码长度不能小于6位"
                    },
                    rnewPassword: {
                        required: "必须重复输入新密码",
                        minlength: "密码长度不能小于6位",
                        equalTo: "两次输入的新密码不一致"
                    }
                },
                wrapper: "li",
                errorElement: "em"
            });
        });
    </script>

</head>
<div class="container">
    <form id="chgpwd_form" action="${ctx}/security/user/chgpwd" method="post" class="form-signin">
        <h3 class="form-signin-heading">更改密码</h3>

        <div id="error" class="alert alert-block hide"></div>
        <div class="control-group">
            <div class="controls">
                <div class="input-prepend">
            <span class="add-on">
                <i class="icon-key"></i>
            </span>
                    <input name="oldPassword" class="input-block-level" placeholder="旧密码" type="password">
                </div>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <div class="input-prepend">
            <span class="add-on">
                <i class="icon-key"></i>
            </span>
                    <input id="newPassword" name="newPassword" class="input-block-level" placeholder="新密码" type="password">
                </div>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <div class="input-prepend">
            <span class="add-on">
                <i class="icon-key"></i>
            </span>
                    <input name="rnewPassword" class="input-block-level" placeholder="重复新密码" type="password">
                </div>
            </div>
        </div>
        <input type="submit" class="btn btn-primary" value="确定">
        <a class="btn" href="${ctx}/index">取消</a>
    </form>
</div>
