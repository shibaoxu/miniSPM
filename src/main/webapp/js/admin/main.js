/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-9-25
 * Time: PM3:20
 * To change this template use File | Settings | File Templates.
 */
define(['jquery'], function ($) {
    var homepageController = {};

    homepageController.activeBar = function(url){
        activeNavBar(url);
        activeSideBar(url);
    };

    function activeNavBar(url) {
        if (url.indexOf('/admin/user') >= 0) {
            $('#sidebar_user').addClass('active');
        } else if (url.indexOf('/security/role') >= 0) {
            $('#sidebar_role').addClass('active');
        }
        else if (url.indexOf('/admin/org/company') >= 0) {
            $('#sidebar_org_company').addClass('active');
        }
        else if (url.indexOf('/admin/org/department') >= 0) {
            $('#sidebar_org_department').addClass('active');
        }
        else if (url.indexOf('/admin/org/staff') >= 0) {
            $('#sidebar_org_staff').addClass('active');
        }
        else if (url.indexOf('/admin/org/structure') >= 0) {
            $('#sidebar_org_structure').addClass('active');
        }
        else if (url.indexOf('/sale/opportunity') >= 0) {
            $('#sidebar_opportunity').addClass('active');
        }
        else if (url.indexOf('/sale/leads') >= 0) {
            $('#sidebar_leads').addClass('active');
        }
        else if (url.indexOf('/sale/market_action') >= 0) {
            $('#sidebar_market_action').addClass('active');
        }
        else if (url.indexOf('/sale/customer') >= 0) {
            $('#sidebar_customer').addClass('active');
        }
        else {
        }
    };

    function activeSideBar(url) {
        if(url.indexOf('/admin') >= 0 || url.indexOf('/security') >= 0){
            $('#navbar_admin').addClass('active');
        }
        else if(url.indexOf('/sale') >= 0){
            $('#navbar_sale').addClass('active');
        }else{
            $('#navbar_homepage').addClass('active');
        }
    };

    return homepageController;
});
