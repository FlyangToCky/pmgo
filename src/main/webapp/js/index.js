$(function(){
    //菜单点击J_iframe
    $(".J_menuItem").on('click',function(){
        var url = "/html/"+$(this).attr('href');
        $("#J_iframe").attr('src',url);
        return false;
    });
});