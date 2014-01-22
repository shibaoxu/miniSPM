/**
 *
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-9-26
 * Time: PM3:19
 * To change this template use File | Settings | File Templates.
 */
var appContext = "/" + document.URL.split("/")[3];
require.config({
    baseUrl : appContext + '/js/',
    paths : {
        'domReady': appContext + '/static/require/domReady',
        'jquery' : appContext +'/static/jquery/jquery-1.8.2',
        'bootstrap' : appContext + '/static/bootstrap/js/bootstrap',
        'ztree' : appContext + '/static/ztree/js/jquery.ztree.all-3.5.min',
        'validation': appContext + '/static/jquery-validation/1.10.0/jquery.validate.min',
        'validationMessage': appContext + '/static/jquery-validation/1.10.0/message_bs_zh',
        'datePicker':  appContext + '/static/datepicker/js/bootstrap-datepicker'
    },
    shim :{
        bootstrap: ['jquery'],
        ztree: ['jquery'],
        validation: ['jquery'],
        validationMessage: ['validation'],
        datePicker: ['bootstrap']
    }
});
