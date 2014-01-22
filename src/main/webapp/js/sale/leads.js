/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-11-13
 * Time: 下午2:13
 * To change this template use File | Settings | File Templates.
 */
define(['jquery', 'bootstrap','admin/customerDialog', 'datePicker', 'validation'], function ($, bootstrp, cDialog) {
    var controller = {};

    function initValidate(){
        $('#leads_form').validate({
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
                name: "required",
                customer_name: "required",
                des: "required"
            },
            messages: {
                name: '销售线索名称必须输入',
                des: "销售线索详细描述必须输入,且需尽可能详细",
                customer_name: "必须选择一个客户，如客户不存在请联系主管增加",
            },
            wrapper: "li",
            errorElement: "em"
        });
    };
    function setCustomerInfo(customerId, customerName){
        $('#customer_id').val(customerId);
        $('#customer_name').val(customerName);
    };

    initValidate();
    cDialog.callback_ok = setCustomerInfo;
    return controller;
});
