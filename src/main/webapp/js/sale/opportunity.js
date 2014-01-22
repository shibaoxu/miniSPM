/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-11-15
 * Time: 上午9:41
 * To change this template use File | Settings | File Templates.
 */
define(['jquery', 'bootstrap','admin/customerDialog', 'datePicker', 'validation'], function ($, bootstrp, cDialog) {
    $('#planDealDate').datepicker({
        format: 'yyyy-mm-dd'
    });
});
