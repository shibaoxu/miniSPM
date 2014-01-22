/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-9-25
 * Time: PM9:12
 * To change this template use File | Settings | File Templates.
 */
//
define(['jquery', 'ztree', 'bootstrap'], function ($) {
    var permissionManager = {};
    permissionManager.dialog = {};
    permissionManager.loadOperationByDomainId = function (id) {
        $('#operation-list tbody').html('');
        $.getJSON(appContext + "/security/domain/" + id + "/operation/index", function (data) {
            $.each(data, function () {
                var html = "<tr><td operation-id='" + this.id + "'>" + this.name + "</td><td>" + this.brief + "</td><td class='text-center'><span style='cursor:pointer' class='icon-arrow-left'></span></td></tr>";
                $('#operation-list tbody').append(html);
            });
        })
    };

    permissionManager.loadPermissionByRoleIdAndDomainId = function (roleId, domainId) {
        $('#permission-list tbody').html('');
        $.getJSON(appContext + "/security/role/" + roleId + "/domain/" + domainId + "/permission/index", function (data) {
            $.each(data, function () {
                var scope;
                switch(this.scope){
                    case 'SELF':
                        scope = '自己';
                        break;
                    case 'SELFANDSUB':
                        scope = '自己及下级';
                        break;
                    case 'DEPT':
                        scope = '本部门';
                        break;
                    case 'DEPTANDSUB':
                        scope = '本部门及下级部门';
                        break;
                    case 'DIVISION':
                        scope = '本事业部';
                        break;
                    case 'ORG':
                        scope = '本单位';
                        break;
                    case 'CUSTOM':
                        scope = '定制';
                        break;
                }
                var html = "<tr><td permission-id='" + this.id + "'>" + this.operation.brief + "</td><td>" + scope + "</td><td class='text-center'><span style='cursor:pointer' class='icon-remove-circle'/></td></tr>";
                $('#permission-list tbody').append(html);
            });
        });
    };
    permissionManager.removePermissionFromRole = function (roleId, permissionId) {
        var url = appContext + "/security/role/" + roleId + "/removePermission/" + permissionId;
        $.ajax({
            url: url,
            type: 'post'
        });
    };
    permissionManager.addPermissionToRole = function (roleId, operationId, scope) {
        var url = appContext + "/security/role/" + roleId + "/addPermission";
        var data = {'operationId': operationId,
                    'scope': scope};
        $.post(url, data).done(function(data){
            $('#domain').triggerHandler('change');
        });
    };

    permissionManager.dialog.init = function (roleId, domainId, domainName, operationId, operationName) {
        $('#pDialogRoleId').val(roleId);
        $('#pDialogDomainId').val(domainId);
        $('#pDialogDomainName').val(domainName);
        $('#pDialogOperationId').val(operationId);
        $('#pDialogOperationName').val(operationName);
        $('#pDialogOperationScope').val('self');
        $("div[name='pDialogOrgTree']").hide();
        $('#pDialogOperationScope').change(function() {
            if ($(this).children('option[selected]').attr('id')== 'CUSTOM') {
                $.getJSON(appContext + "/admin/org/structure/sale/org", function (data) {
                    var treeSetting = {
                        check: {
                            enable : true,
                            chkStyle: 'checkbox',
                            chkboxType : { "Y" : "s", "N" : "s" }
                        },
                        view: {
                            dblClickExpand: false,
                            showLine: true,
                            selectedMulti: false,
                            expandSpeed: ($.browser.msie && parseInt($.browser.version) <= 6) ? "" : "fast"
                        }};
                    var tree = $.fn.zTree.init($('#pDialogOrgTree'), treeSetting, data);
                    tree.expandAll(tree);
                });
                $("div[name='pDialogOrgTree']").show();
            } else {
                $("div[name='pDialogOrgTree']").hide();
            }
        });
    };

    permissionManager.dialog.OK = function(){
        var roleId = $('#pDialogRoleId').val();
        var operationId = $('#pDialogOperationId').val();
        var scope = $('#pDialogOperationScope').children('option[selected]').attr('id');
        if(scope.slice(0, 6) == 'custom'){
            var treeObj = $.fn.zTree.getZTreeObj("pDialogOrgTree");
            var nodes = treeObj.getCheckedNodes(true);
            scope = $.map(nodes, function(val, i){
                return val.id;
            }).join(';');
            scope = 'custom:' + scope;
        }
        var rt = permissionManager.addPermissionToRole(roleId, operationId, scope);
        $('#pDialog').modal('hide');
    };

    return permissionManager;
});
