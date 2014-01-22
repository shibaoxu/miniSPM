/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 14-1-9
 * Time: 下午2:32
 * To change this template use File | Settings | File Templates.
 */

define(['jquery','bootstrap'],function($){
    var controller = {};

    controller.bindEvent = function(){
        $('#btnFilterSelf').on('click', function(){
            if($(this).hasClass('active')){
                $(this).removeClass('active');
                $('#chkFilterSelf').val(false);
            }else{
                $(this).addClass('active');
                $('#chkFilterSelf').val(true);
            }
        });
        $('#btnFilterClosed').on('click', function(){
            if($(this).hasClass('active')){
                $(this).removeClass('active');
                $('#chkFilterClosed').val(false);
            }else{
                $(this).addClass('active');
                $('#chkFilterClosed').val(true);
            }
        });
    };
    controller.bindEvent();
    return controller;
});
