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

<html>
<head>
    <link href="${ctx}/static/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" media="screen">
    <script src="${ctx}/static/ztree/js/jquery.ztree.all-3.5.min.js"></script>
    <link>
</head>
<body>
<h3>组织结构配置</h3>

<%--<div class="container-fluid">--%>
<div class="row-fluid">
    <div class="span4">
        <select id='org_type'>
            <c:forEach items="${orgType}" var="item">
                <option value="${item.id}">${item.name}</option>
            </c:forEach>
        </select>

        <ul id='org_tree' class="ztree"></ul>
    </div>
    <div class="span8">
        <ul id='org_tab' class="nav nav-tabs">
            <li class="active">
                <a href="#company_tab" data-toggle="tab">公司</a>
            </li>
            <li>
                <a href="#department_tab" data-toggle="tab">部门</a>
            </li>
            <li>
                <a href="#staff_tab" data-toggle="tab">员工</a>
            </li>
        </ul>
        <div id="myTabContent" class="tab-content">
            <div id='company_tab' class="tab-pane fade in active">
            </div>
            <div id='department_tab' class="tab-pane fade">
            </div>
            <div id='staff_tab' class="tab-pane fade">
            </div>
        </div>
    </div>
</div>
<%--</div>--%>
<script type="text/javascript">
    $(document).ready(function () {
        $('#org_tab a').click(function (e) {
            e.preventDefault();
            $(this).tab('show');
        });
        var initOrgTree = function(){
            $.getJSON("${ctx}/admin/org/structure/" + $('#org_type').val(),function(data){
                var t = $("#org_tree");
                t = $.fn.zTree.init(t, setting, data);
                var zTree = $.fn.zTree.getZTreeObj("tree");
            });
        };

        $('#org_type').change(initOrgTree);
//        $('#org_type').bind('change', initOrgTree)
        var setting = {
            view:{
                dblClickExpand:false,
                showLine:true,
                selectedMulti:false,
                expandSpeed:($.browser.msie && parseInt($.browser.version) <= 6) ? "" : "fast"
            }
// ,
//            data:{
//                simpleData:{
//                    enable:true,
//                    idKey:"id",
//                    pIdKey:"pId",
//                    rootPId:""
//                }
//            }
        };
//        var zNodes = {};
//
//        var t = $("#org_tree");
//        t = $.fn.zTree.init(t, setting, zNodes);
//        var zTree = $.fn.zTree.getZTreeObj("tree");
//        zTree.selectNode(zTree.getNodeByParam("id", 101));

    });
</script>
</body>
</html>