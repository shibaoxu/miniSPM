/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 14-1-7
 * Time: 下午3:24
 * To change this template use File | Settings | File Templates.
 */
define(['jquery'], function($){
    var controller = {};

    controller.init = function(){
        console.log('init exec');
        $('.lockUser').on('click', function(){
            var userId = $(this).attr('userId');
            var url = appContext + "/security/user/" + userId + "/lock";
            $.post(url).done(function(data){
                if(data == 'success'){
                    location.reload();
                }
            });
        });

        $('.unlockUser').on('click', function(){
            var userId = $(this).attr('userId');
            var url = appContext + "/security/user/" + userId + "/unlock";
            $.post(url).done(function(data){
                if(data == 'success'){
                    location.reload();
                }
            });
        });

        $('.activeUser').on('click', function(){
            var userId = $(this).attr('userId');
            var url = appContext + "/security/user/" + userId + "/active";
            $.post(url).done(function(data){
                if(data == 'success'){
                    location.reload();
                }
            });
        });
    };
    return controller;
});
