/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-10-17
 * Time: 下午12:04
 * To change this template use File | Settings | File Templates.
 */
define(['jquery', 'admin/user_dialog', 'bootstrap'], function ($, userDialog) {
    var roleUserManager = {};
    roleUserManager.addUsers = function(userIds){
        var url = appContext + "/security/role/" + roleUserManager.roleId + "/addUsers";
        $.post(url,{'userIds': userIds}).done(function(){
            userDialog.close();
            location.reload();
        });
    };
    roleUserManager.removeUser = function(userId){
        var url = appContext + "/security/role/" + roleUserManager.roleId + "/removeUser/" + userId;
        $.post(url);
    };
    roleUserManager.init = function(roleId){
        roleUserManager.roleId = roleId;
        userDialog.callback = roleUserManager.addUsers;
        $('#add-user').click(function(){
            userDialog.show(roleId);
        });
        $('span.icon-remove-circle').click()
        $('#users-of-role').on('click', 'span.icon-remove-circle', function(){
            var user = $(this).closest('tr');
            var userId = $($(user).children()[0]).attr('user-id');
            roleUserManager.removeUser(userId);
            $(user).remove();
        });
    };
    return roleUserManager;
});
