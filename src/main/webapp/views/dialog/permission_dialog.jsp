<%--
  Created by IntelliJ IDEA.
  User: shibaoxu
  Date: 12-12-27
  Time: 下午7:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="modal fade" id="pDialog" role='dialog' tabindex="-1" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">权限配置</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="#">
                    <input type="hidden" id='pDialogDomainId'>
                    <input type="hidden" id='pDialogOperationId'>
                    <input type="hidden" id='pDialogRoleId'>
                    <div class="form-group">
                        <label class="control-label col-lg-2 text-right">对象</label>
                        <div class="col-lg-9">
                            <input id= 'pDialogDomainName' class="form-control" readonly="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-2 text-right">操作</label>
                        <div class="col-lg-9">
                            <input id='pDialogOperationName' class="form-control" readonly="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-2 text-right">数据范围</label>
                        <div class="col-lg-9">
                            <select id='pDialogOperationScope' class="form-control">
                                <option id='SELF'>自己</option>
                                <%--<option id='SELFANDSUB'>自己及下级</option>--%>
                                <option id='DEPT'>本部门</option>
                                <option id='DEPTANDSUB'>本部门及下级部门</option>
                                <%--<option id='DIVISION'>本事业部</option>--%>
                                <option id='ORG'>本单位</option>
                                <option id='CUSTOM'>定制...</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div name='pDialogOrgTree' class="col-lg-offset-2 col-lg-9">
                            <ul id='pDialogOrgTree' class="ztree  pre-scrollable" style="max-height: 200px;border: 1px solid #CCCCCC; border-radius: 4px 4px 4px 4px;"></ul>
                        </div>
                    </div>
                </form>


            </div>
            <div class="modal-footer">
                <button id='ok' class="btn btn-primary">添加</button>
                <button id='cancel' class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
