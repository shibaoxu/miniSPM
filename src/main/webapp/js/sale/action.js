/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-11-14
 * Time: 下午7:15
 * To change this template use File | Settings | File Templates.
 */
define(['jquery', 'bootstrap','datePicker', 'validation'],function($){
    var controller = {};
    function validation(){
        $('#action_form').validate({
            invalidHandler: function(event, validator){
                if(validator.numberOfInvalids()){
                    $('div#error').removeClass('hidden');
                    $('div#error').show();
                }else{
                    $('div#error').hide();
                }
            },
            rules:{
                brief: "required",
                customerParticipants: "required",
                detail:"required"
            },
            messages:{
                brief: "简述必须录入",
                customerParticipants: "客户方的参入者必须录入",
                detail:"请尽可能详细录入信息"
            },
            errorLabelContainer: $("div#error"),
            wrapper: "li",
            errorElement: "em"
        });
    };
    function init(){
        validation();
        $('#action_occur_date').datepicker({
            format: 'yyyy-mm-dd'
        });
    };
    init();
    return controller;
});
