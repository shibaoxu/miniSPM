/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-11-11
 * Time: 下午10:20
 * To change this template use File | Settings | File Templates.
 */
define(['jquery'], function($){
    var controller = {};
    controller.callback_ok = null;
    controller.callback_close = null;
    controller.show = function(){
        $('#customer_list option').each(function () {
            $(this).remove();
        });
        $('#customer_dialog_condition').val('');
        $.getJSON(appContext + '/sale/customer/index', function (data) {
            $.each(data, function (index, item) {
                $("<option value = '" + item.id + "'>" + item.name + "</option>").appendTo($('#customer_list'));
            })
        });
    };
    controller.close = function(){
        $('#cDialog').modal('toggle');
    };

    $('#cDialog').on('show.bs.modal', controller.show );

    $('#customer_dialog_search').click(function () {
        $.getJSON(appContext + '/sale/customer/index?search_LIKE_name=' + $('#customer_dialog_condition').val(), function (data) {
            $('#customer_list option').each(function () {
                $(this).remove();
            });
            $.each(data, function (index, item) {
                $("<option value = '" + item.id + "'>" + item.name + "</option>").appendTo($('#customer_list'));
            })
        });
    });

    $('#customer_dialog_ok').click(function () {
        if ($('#customer_list option:selected').size() == 0) {
            alert('请选择一个客户');
        } else {
            var customerId = $('#customer_list option:selected').val();
            var customerName = $('#customer_list option:selected').text();
            if(controller.callback_ok != null && typeof(controller.callback_ok) == 'function'){
                controller.callback_ok(customerId, customerName);
            }
            controller.close();
        }
    });

    $('#customer_dialog_close').click(function () {
        if(controller.callback_close != null && typeof(controller.callback_close) == 'function'){
            controller.callback_close();
        }
        controller.close();
    });

    return controller;
});
