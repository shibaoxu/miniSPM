/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-12-12
 * Time: 上午9:52
 * To change this template use File | Settings | File Templates.
 */
define(['jquery', 'ztree'], function ($) {
    var controller = {};

    controller.refreshStructure = function () {
        var orgTypeId = $('#org_type').val();
        console.log(orgTypeId);
        controller.refreshTree(orgTypeId);
        controller.refreshUnassignedDepartments(orgTypeId);
        controller.refreshUnassignedStaffs(orgTypeId);
    };

    controller.refreshTree = function (orgTypeId) {
        var setting = {
            view: {
                dblClickExpand: false,
                showLine: true,
                selectedMulti: false,
                expandSpeed: ($.browser.msie && parseInt($.browser.version) <= 6) ? "" : "fast"
            }
        };
        $.getJSON(appContext + "/admin/org/structure/" + orgTypeId, function (data) {
            var t = $("#org_tree");
            $.fn.zTree.init(t, setting, data);
        });
    };

    controller.refreshUnassignedDepartments = function (orgTypeId) {
        $.getJSON(appContext + "/admin/org/department/unassigned/" + orgTypeId, function (data) {
            $('#unAssignedDept').html('');
            $.each(data, function (index, item) {
                $("<option  value = '" + item.id + "'>" + item.name + "</option>").appendTo($('#unAssignedDept'));
            })

        });
    };

    controller.refreshUnassignedStaffs = function (orgTypeId) {
        $('#unAssignedStaff').html('');
        $.getJSON(appContext + "/admin/org/staff/unassigned/" + orgTypeId, function (data) {
            $.each(data, function (index, item) {
                $("<option value = '" + item.id + "'>" + item.name + "</option>").appendTo($('#unAssignedStaff'));
            })

        });
    };
    controller.getTree = function () {
        return   $.fn.zTree.getZTreeObj('org_tree');
    };
    controller.getSelectedOrg = function () {
        var treeObj = controller.getTree();
        var nodes = treeObj.getSelectedNodes();
        return nodes[0];
    };

    controller.addNode = function (parent, childId, childName) {
        var node = {'id': childId, 'name': childName };
        controller.getTree().addNodes(parent, node, false);
    };

    controller.removeNodeFromTree = function (node) {
        var treeObj = controller.getTree();
        treeObj.removeNode(node);
    };
    controller.removeOrg = function () {
        var node = controller.getSelectedOrg();
        if (node == undefined) {
            alert('请首选选择要操作的对象');
            return;
        }
        if (node.isParent) {
            alert('只能删除末级对象');
            return;
        }

        var orgTypeId = $('#org_type').val();
        var orgId = node.id;
        var url = appContext + "/admin/org/structure/" + orgTypeId + "/removeUnit/" + orgId;

        $.post(url).done(function (data) {
            if (data == 'success') {
                controller.removeNodeFromTree(node);
                controller.refreshUnassignedDepartments(orgTypeId);
                controller.refreshUnassignedStaffs(orgTypeId);
            }
            ;
        });
    };

    controller.addDept = function () {
        var deptId, orgId, orgTypeId, deptName;
        if ($('#unAssignedDept option:selected').size() == 0) {
            alert('请选择一个部门');
            return;
        } else {
            deptId = $('#unAssignedDept option:selected').val();
            deptName = $('#unAssignedDept option:selected').text();
        }
        var selectedNode = controller.getSelectedOrg();
        if (selectedNode == undefined) {
            alert('请在组织树中选择一个组织单元');
            return;
        } else {
            orgId = selectedNode.id;
        }

        orgTypeId = $('#org_type').val();
        var url = appContext + "/admin/org/structure/" + orgTypeId + "/addUnit/" + orgId + '/' + deptId;
        $.post(url).done(function (data) {
            if (data == 'success') {
                controller.refreshUnassignedDepartments(orgTypeId);
                controller.addNode(controller.getSelectedOrg(), deptId, deptName);
            }
        });
    };

    controller.addStaff = function () {
        var staffId, staffName, orgId, orgTypeId;
        if ($('#unAssignedStaff option:selected').size() == 0) {
            alert('请选择一名员工');
            return;
        } else {
            staffId = $('#unAssignedStaff option:selected').val();
            staffName = $('#unAssignedStaff option:selected').text();
        }
        var selectedNode = controller.getSelectedOrg();
        if (selectedNode == undefined) {
            alert('请在组织树中选择一个组织单元');
            return;
        } else {
            orgId = selectedNode.id;
        }

        orgTypeId = $('#org_type').val();
        var url = appContext + "/admin/org/structure/" + orgTypeId + "/addUnit/" + orgId + '/' + staffId;
        $.post(url).done(function (data) {
            if (data == 'success') {
                controller.refreshUnassignedStaffs(orgTypeId);
                controller.addNode(controller.getSelectedOrg(), staffId, staffName);
            }
        });
    };
    controller.init = function () {
        $('#org_type').change(controller.refreshStructure);
        $('#removeOrg').on('click', controller.removeOrg);
        $('#addDept').on('click', controller.addDept);
        $('#addStaff').on('click', controller.addStaff);
        controller.refreshStructure();

    };

    return controller;

});
