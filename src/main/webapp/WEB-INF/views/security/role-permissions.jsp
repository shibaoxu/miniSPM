<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 13-8-22
  Time: 下午9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<ol class="breadcrumb">
    <li><a href="${ctx}/index">首页</a></li>
    <li><a href="${ctx}/admin/index">系统管理</a></li>
    <li><a href="${ctx}/admin/security/role/index">角色管理</a></li>
    <li><a href="">${role.description}</a></li>

</ol>
<div>
    <div class="col-lg-6">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h6 class="panel-title">已分配权限</h6>
            </div>
            <div class="panel-body">
                <label class="">对象</label>
                <select id='domain' style="font-size: 14px">
                    <c:forEach items="${domains}" var="domain">
                        <option value="${domain.id}">${domain.detail}</option>
                    </c:forEach>
                </select>
                <table id='permission-list' class="table table-striped table-bordered table-hover table-condensed">
                    <thead>
                        <tr>
                            <td>操作</td>
                            <td>范围</td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>

    </div>

    <div class="col-lg-6">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h6 class="panel-title">全部权限</h6>
            </div>
            <div class="panel-body">
                <label class="">对象</label>
                <select id='domain1' style="font-size: 14px">
                    <c:forEach items="${domains}" var="domain">
                        <option value="${domain.id}">${domain.detail}</option>
                    </c:forEach>
                </select>
                <table id='operation-list' class="table table-striped table-bordered table-hover table-condensed">
                    <thead>
                        <tr>
                            <td>名称</td>
                            <td>简述</td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('#domain').change(function(){
        loadPermissionByDomainId($(this).val());
    });

    $('#domain1').change(function(){
        loadOperationByDomainId($(this).val());
    });

    var loadPermissionByDomainId = function(id){
        $('#permission-list tbody').html('');
        $.getJSON("${ctx}/security/domain/" + id + "/permission/index", function(data){
            $.each(data, function(){
                var html = "<tr><td>" + this.operation.brief + "</td><td>" + this.scope +"</td><td><span class='icon-remove-circle'/></td></tr>";
                $('#permission-list tbody').append(html);
            });
        });


    };
    var loadOperationByDomainId = function(id){
        $('#operation-list tbody').html('');
        $.getJSON("${ctx}/security/domain/" + id + "/operation/index", function(data){
            $.each(data, function(){
                var html = "<tr><td>" + this.name + "</td><td>" + this.brief + "</td><td><span class='icon-arrow-left'></span></td></tr>";
                $('#operation-list tbody').append(html);
            }) ;
        })
    };
    loadOperationByDomainId($('#domain1').val());
    loadPermissionByDomainId($('#domain').val());

</script>


