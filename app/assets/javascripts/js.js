/*
 * Created by btnth_000 on 15/11/2015.
 */

function setEverntButton(){
    $('.panel.panel-primary').on('mouseenter', function() {
      var a = $(this);
        $(a).find('.btn-group.btn-group-xs.pull-right.button').removeClass('hide');
     }).on('mouseleave', function() {
       var a = $(this);
       $(a).find('.btn-group.btn-group-xs.pull-right.button').addClass('hide');
    });
 }
function submit(idList, txtNameList)
{
    alert("dd");
}
 $('#btnAddList').submit(function(){
    //alert("dd");
 });
 $('#frmEditList').submit(function(){
    //alert("dd");
 });
