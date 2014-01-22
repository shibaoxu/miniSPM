/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-11-11
 * Time: 下午9:48
 * To change this template use File | Settings | File Templates.
 */
define(['jquery', 'bootstrap','admin/customerDialog', 'datePicker', 'validation'], function ($, bootstrp, cDialog) {
    var controller = {};
    controller.setCustomerInfo = function(customerId, customerName){
        $('#customer_id').val(customerId);
        $('#customer_name').val(customerName);
    }
    controller.init = function () {
        initDatePicker();
        initValidation();
        cDialog.callback_ok = controller.setCustomerInfo;
    }

    function initDatePicker(){
        $('#datepicker').datepicker({
            format: 'yyyy-mm-dd'
        });
    }
    function initValidation(){
        $('#action_form').validate({
            invalidHandler: function (event, validator) {
                if (validator.numberOfInvalids()) {
                    $('div#error').removeClass('hidden');
                    $('div#error').show();
                } else {
                    $('div#error').hide();
                }
            },
            errorLabelContainer: $("div#error"),
            rules: {
                brief: "required",
                eventDate: "required",
                detail: "required",
                customer_name: "required"
            },
            messages: {
                brief: {required: "活动简述必须输入"},
                detail: "活动详情必须输入",
                customer_name: "必须选择一个客户，如客户不存在请联系主管增加"
            },
            wrapper: "li",
            errorElement: "em"
        });
    }

    controller.init();
    return controller;
});
