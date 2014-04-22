/**
 * Created with IntelliJ IDEA.
 * User: shibaoxu
 * Date: 13-9-25
 * Time: PM3:20
 * To change this template use File | Settings | File Templates.
 */
define(['jquery'], function ($) {
    var homepageController = {};

    homepageController.initEvent = function(){
        $('.side-nav > li').click(function(){
            $('.side-bar li').removeClass('active');
            $(this).addClass('active');
        });
    }
    homepageController.activeBar = function(url){
        activeNavBar(url);
        activeSideBar(url);
    };

    function activeSideBar(url) {
        if (url.indexOf('/security/user') >= 0) {
            $('#sidebar_user').addClass('active').parents('li').addClass('active');
        } else if (url.indexOf('/security/role') >= 0) {
            $('#sidebar_role').addClass('active').parents('li').addClass('active');
        }
        else if (url.indexOf('/admin/companies') >= 0) {
            $('#sidebar_org_company').addClass('active').parents('li').addClass('active');
        }
        else if (url.indexOf('/admin/departments') >= 0) {
            $('#sidebar_org_department').addClass('active').parents('li').addClass('active');
        }
        else if (url.indexOf('/admin/staffs') >= 0) {
            $('#sidebar_org_staff').addClass('active').parents('li').addClass('active');
        }
        else if (url.indexOf('/admin/org/structure') >= 0) {
            $('#sidebar_org_structure').addClass('active').parents('li').addClass('active');
        }
        else if (url.indexOf('/sale/opportunity') >= 0) {
            $('#sidebar_opportunity').addClass('active').parents('li').addClass('active');
        }
        else if (url.indexOf('/sale/leads') >= 0) {
            $('#sidebar_leads').addClass('active').parents('li').addClass('active');
        }
        else if (url.indexOf('/sale/market_action') >= 0) {
            $('#sidebar_market_action').addClass('active').parents('li').addClass('active');
        }
        else if (url.indexOf('/sale/customer') >= 0) {
            $('#sidebar_customer').addClass('active').parents('li').addClass('active');
        }
        else {
        }
    };

    function activeNavBar(url) {
        if(url.indexOf('/admin') >= 0 || url.indexOf('/security') >= 0){
            $('#navbar_admin').addClass('active');
        }
        else if(url.indexOf('/sale') >= 0){
            $('#navbar_sale').addClass('active');
        }else{
            $('#navbar_homepage').addClass('active');
        }
    };

    homepageController.initEvent();
    return homepageController;
});
