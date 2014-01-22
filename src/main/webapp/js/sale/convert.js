/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-11-14
 * Time: 下午8:56
 * To change this template use File | Settings | File Templates.
 */

define(['jquery', 'bootstrap','datePicker', 'validation'],function($){
    $('#planDealDate').datepicker({
        format: 'yyyy-mm-dd'
    });

    $('#convertToOpportunityForm').validate({
        errorLabelContainer: $("div#error"),
        rules: {
            planDealDate: "required"
        },
        messages: {
            planDealDate: '必须指定预计签约时间'
        },
        wrapper: "li",
        errorElement: "em"
    });
});