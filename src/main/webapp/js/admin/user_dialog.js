/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-10-17
 * Time: 上午11:49
 * To change this template use File | Settings | File Templates.
 */
define(['jquery', ''], function ($) {
    var uDialogManager = {};
    uDialogManager.callback = null;
    uDialogManager.show = function () {
        $('#userList tbody').html('');
        $.getJSON(appContext + '/security/user/index', function (users) {
            $.each(users, function (index, item) {
                $("<tr><td><input type='checkbox' userId=" + item.id + "></td><td>" + item.jobNumber + "</td><td>" + item.name + "</td></tr>").appendTo($('#userList tbody'));
            })
        });
        $('#uDialog').modal('show');
    };

    uDialogManager.search = function (condition) {
        $('#userList tbody').html('');
        $.getJSON(appContext + '/security/user/index?condition=' + condition, function (data) {
            $.each(data, function (index, item) {
                $("<tr><td><input type='checkbox' userId=" + item.id + "></td><td>" + item.jobNumber + "</td><td>" + item.name + "</td></tr>").appendTo($('#userList tbody'));
            })
        });
    };
    uDialogManager.ok = function(){
        var userIds= $("table#userList input:checkbox:checked").map(function(){
            return $(this).attr('userId');
        }).get();

        if(userIds.length == 0){
            return;
        }
        uDialogManager.callback(userIds);
    };

    uDialogManager.close = function () {
        $('#uDialog').modal('hide');
    };
    return uDialogManager;
});
