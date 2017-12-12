/**
 * Created by slm on 2017/11/28.
 */

var pageindex;
var pageCount;
$(function(){
    //自适应屏幕宽度
    window.onresize=function(){ location=location };

    var main_h = $(window).height();
    $('.hy_list').css('height',main_h-45+'px');

    var search_w = $(window).width()-40;
    $('.search').css('width',search_w+'px');
    //$('.list_hy').css('width',search_w+'px');
});
$(function () {

    $("#tjjs").click(function () {
        $(".sy").val("");
        $("#jiaoshigl").css('display','block')
        $.ajax({
            type: "get",
            url: "saveTeachersByTnumber",
            success: function(msg){
                var obj = $.parseJSON(msg);
                $("#zh").val(obj.tnumber);
                $("#id").val(obj.tid);
            }
        });


    });
    $("#quxiao").click(function () {

        $("#jiaoshigl").css('display','none')
    });


    function ajaxshow() {
        /*查询出所有教师信息*/
        $.ajax({
            type: "get",
            url: "selecrTeachersAll",
            success: function(msg){

                var str="";
                var obj = eval(msg);

                for(var i = 0;i<obj.length;i++){
                    if(obj[i].tjob==0){
                        str= str+"<tr><td class='zt'>"+obj[i].tid+"</td> <td>"+obj[i].tnumber+"</td> <td >"+obj[i].tname+"</td> <td>"+obj[i].tsex+"</td> <td>"+obj[i].tbirthday+"</td> <td>"+obj[i].tphone+"</td> <td> "+obj[i].ttel+"</td> <td>班主任</td> <td><a onclick='a("+obj[i].tid+");'  >编辑</a> 重置密码  <a onclick='deletexx("+obj[i].tid+");'>删除</a></td></tr>";
                    }else {
                        str= str+"<tr><td class='zt'>"+obj[i].tid+"</td> <td>"+obj[i].tnumber+"</td> <td >"+obj[i].tname+"</td> <td>"+obj[i].tsex+"</td> <td>"+obj[i].tbirthday+"</td> <td>"+obj[i].tphone+"</td> <td> "+obj[i].ttel+"</td> <td>讲师</td> <td><a onclick='a("+obj[i].tid+");'  >编辑</a> 重置密码  <a onclick='deletexx("+obj[i].tid+");'>删除</a></td></tr>";

                    }

                }
                $("#students").append(str);

            }
        });

        $.ajax({
            type: "get",
            url: "getpage",
            success: function(msg){
                var rest = $.parseJSON(msg);

                pageindex= rest.pageIndex;
                pageCount = rest.pageCount;

                $("#dangqian").val(pageindex);
                var str ="<a class='prev' id='kaishi'><img src='images/icon7.png' /></a><a>第"+pageindex+"页</a><a onclick='sout("+pageindex+");'>上一页</a><a onclick='htik("+pageindex+");'>下一页</a><a>总"+pageCount+"页</a><a  class='next' id='end'><img src='images/icon8.png'/></a>"
                $("#page").html(str);
            }
        });
    }
    ajaxshow();


    $("#select").click(function () {
        var tnumber = $("#tnumber").val();
        var tname = $("#tnames").val();
        var Byid = $("#tjob").val();
        $.ajax({
            type: "post",
            url: "selectBytnumberOrtname?tnumber="+tnumber+"&tname="+tname+"&Byid="+Byid,
            success: function(msg) {

                var str = "";
                var bt = "<tr ><th scope='col' class='text_sun'>序号</th><th class='zt' scope='col' class='text_sun'>账号</th><th scope='col' class='text_sun'>姓名</th><th scope='col' class='text_sun'>性别</th><th scope='col' class='text_sun'>生日</th><th scope='col' class='text_sun'>学历</th><th scope='col' class='text_sun'>联系电话</th><th scope='col' class='text_sun'>岗位</th><th scope='col' class='text_sun'>操作</th></tr>";
                var obj = eval(msg);
                for (var i = 0; i < obj.length; i++) {
                    if (obj[i].tjob == 0) {
                        str = str + " <tr><td class='zt'>" + obj[i].tid + "</td> <td>" + obj[i].tnumber + "</td> <td >" + obj[i].tname + "</td> <td>" + obj[i].tsex + "</td> <td>" + obj[i].tbirthday + "</td> <td>" + obj[i].tphone + "</td> <td> " + obj[i].ttel + "</td> <td>班主任</td> <td><a onclick='a(" + obj[i].tid + ");'  >编辑</a> 重置密码 <a onclick='deletexx("+obj[i].tid+");'>删除</a></td></tr>";
                    } else {
                        str = str + "<tr><td class='zt'>" + obj[i].tid + "</td> <td>" + obj[i].tnumber + "</td> <td >" + obj[i].tname + "</td> <td>" + obj[i].tsex + "</td> <td>" + obj[i].tbirthday + "</td> <td>" + obj[i].tphone + "</td> <td> " + obj[i].ttel + "</td> <td>讲师</td> <td><a onclick='a(" + obj[i].tid + ");'  >编辑</a> 重置密码  <a onclick='deletexx("+obj[i].tid+");'>删除</a></td></tr>";

                    }

                }
                $("#students").html(bt);
                $("#students").append(str);
            }
        });
    });

    /**/
});
/*上一页*/
function sout(a) {


    if(pageindex<=0){
        return ;
    }else {
    pageindex--;
    $.ajax({
        type: "get",
        url: "selecrTeachersAll?pageIndex="+pageindex,
        success: function(msg){

            var str="";
            var obj = eval(msg);
            var bt = "<tr ><th scope='col' class='text_sun'>序号</th><th class='zt' scope='col' class='text_sun'>账号</th><th scope='col' class='text_sun'>姓名</th><th scope='col' class='text_sun'>性别</th><th scope='col' class='text_sun'>生日</th><th scope='col' class='text_sun'>学历</th><th scope='col' class='text_sun'>联系电话</th><th scope='col' class='text_sun'>岗位</th><th scope='col' class='text_sun'>操作</th></tr>";
            for(var i = 0;i<obj.length;i++){
                if(obj[i].tjob==0){
                    str= str+"<tr><td class='zt'>"+obj[i].tid+"</td> <td>"+obj[i].tnumber+"</td> <td >"+obj[i].tname+"</td> <td>"+obj[i].tsex+"</td> <td>"+obj[i].tbirthday+"</td> <td>"+obj[i].tphone+"</td> <td> "+obj[i].ttel+"</td> <td>班主任</td> <td><a onclick='a("+obj[i].tid+");'  >编辑</a> 重置密码  <a onclick='deletexx("+obj[i].tid+");'>删除</a></td></tr>";
                }else {
                    str= str+"<tr><td class='zt'>"+obj[i].tid+"</td> <td>"+obj[i].tnumber+"</td> <td >"+obj[i].tname+"</td> <td>"+obj[i].tsex+"</td> <td>"+obj[i].tbirthday+"</td> <td>"+obj[i].tphone+"</td> <td> "+obj[i].ttel+"</td> <td>讲师</td> <td><a onclick='a("+obj[i].tid+");'  >编辑</a> 重置密码  <a onclick='deletexx("+obj[i].tid+");'>删除</a></td></tr>";

                }

            }
            $("#students").html(bt);
            $("#students").append(str);

        }
    });
    }

}
/*下一页*/
function htik(a) {
    pageindex++;
    if(pageindex <= pageCount){
        $.ajax({
            type: "get",
            url: "selecrTeachersAll?pageIndex="+pageindex,
            success: function(msg){

                var str="";
                var obj = eval(msg);
                var bt = "<tr ><th scope='col' class='text_sun'>序号</th><th class='zt' scope='col' class='text_sun'>账号</th><th scope='col' class='text_sun'>姓名</th><th scope='col' class='text_sun'>性别</th><th scope='col' class='text_sun'>生日</th><th scope='col' class='text_sun'>学历</th><th scope='col' class='text_sun'>联系电话</th><th scope='col' class='text_sun'>岗位</th><th scope='col' class='text_sun'>操作</th></tr>";
                for(var i = 0;i<obj.length;i++){
                    if(obj[i].tjob==0){
                        str= str+"<tr><td class='zt'>"+obj[i].tid+"</td> <td>"+obj[i].tnumber+"</td> <td >"+obj[i].tname+"</td> <td>"+obj[i].tsex+"</td> <td>"+obj[i].tbirthday+"</td> <td>"+obj[i].tphone+"</td> <td> "+obj[i].ttel+"</td> <td>班主任</td> <td><a onclick='a("+obj[i].tid+");'  >编辑</a> 重置密码  <a onclick='deletexx("+obj[i].tid+");'>删除</a></td></tr>";
                    }else {
                        str= str+"<tr><td class='zt'>"+obj[i].tid+"</td> <td>"+obj[i].tnumber+"</td> <td >"+obj[i].tname+"</td> <td>"+obj[i].tsex+"</td> <td>"+obj[i].tbirthday+"</td> <td>"+obj[i].tphone+"</td> <td> "+obj[i].ttel+"</td> <td>讲师</td> <td><a onclick='a("+obj[i].tid+");'  >编辑</a> 重置密码  <a onclick='deletexx("+obj[i].tid+");'>删除</a></td></tr>";

                    }

                }
                $("#students").html(bt);
                $("#students").append(str);

            }
        });
    }else {
        return ;


    }

}
function a(ec) {
    var  bsid= ec;

    $.ajax({
        type: "get",
        url: "selectByid?Byid="+bsid,
        success: function(msg){
            var obj = $.parseJSON(msg);
            var zh = obj.teachers1.tnumber;
            $("#zh").val(zh);
            $("#id").val(bsid);
            var tname = obj.teachers1.tname;
            $("#tname").val(tname);
            var tsex = obj.teachers1.tsex;
            $("#tsex").val(tsex);
            var tage = obj.teachers1.tbirthday;
            $("#tage").val(tage);
            var xl = obj.teachers1.tphone;
            $("#xl").val(xl);
            var ttel = obj.teachers1.ttel;
            $("#ttel").val(ttel);
            var gw = obj.teachers1.tjob;
            $("#gw").val(gw);
            var bz = obj.teachers1.tremark;
            $("#bz").val(bz);
            bsid= obj.teachers1.tid;

        }
    });
    $("#jiaoshigl").css('display','block')

}
function deletexx(a) {
    $.ajax({
        type: "get",
        url: "deleteteachers?tid="+a,
        success: function(msg){
            var rest = $.parseJSON(msg);

            $.ajax({
                type: "get",
                url: "selecrTeachersAll",
                success: function(msg){

                    var str="";
                    var bt = "<tr ><th scope='col' class='text_sun'>序号</th><th class='zt' scope='col' class='text_sun'>账号</th><th scope='col' class='text_sun'>姓名</th><th scope='col' class='text_sun'>性别</th><th scope='col' class='text_sun'>生日</th><th scope='col' class='text_sun'>学历</th><th scope='col' class='text_sun'>联系电话</th><th scope='col' class='text_sun'>岗位</th><th scope='col' class='text_sun'>操作</th></tr>";

                    var obj = eval(msg);
                    for(var i = 0;i<obj.length;i++){
                        if(obj[i].tjob==0){
                            str= str+"<tr><td class='zt'>"+obj[i].tid+"</td> <td>"+obj[i].tnumber+"</td> <td >"+obj[i].tname+"</td> <td>"+obj[i].tsex+"</td> <td>"+obj[i].tbirthday+"</td> <td>"+obj[i].tphone+"</td> <td> "+obj[i].ttel+"</td> <td>班主任</td> <td><a onclick='a("+obj[i].tid+");'  >编辑</a> 重置密码  <a onclick='deletexx("+obj[i].tid+");'>删除</a></td></tr>";
                        }else {
                            str= str+"<tr><td class='zt'>"+obj[i].tid+"</td> <td>"+obj[i].tnumber+"</td> <td >"+obj[i].tname+"</td> <td>"+obj[i].tsex+"</td> <td>"+obj[i].tbirthday+"</td> <td>"+obj[i].tphone+"</td> <td> "+obj[i].ttel+"</td> <td>讲师</td> <td><a onclick='a("+obj[i].tid+");'  >编辑</a> 重置密码  <a onclick='deletexx("+obj[i].tid+");'>删除</a></td></tr>";

                        }

                    }
                    $("#students").html(bt);
                    $("#students").append(str);

                }
            });
        }

    });
}
function save() {
    var tnumber =  $("#zh").val();
    var name= $("#tname").val();
    var id = $("#id").val();
    alert(id);
    var sex = $("#tsex").val();

    var shengri =  $("#tage").val();
    var xueli = $("#xl").val();
    var tel = $("#ttel").val();
    var gangwei =  $("#gw").val();
    var beizhu =  $("#bz").val();
    $.ajax({
        type: "post",
        url: "saveTeachers?tnumber="+tnumber+"&tname="+name+
        "&tsex="+sex+"&tbirthday="+shengri+
        "&tphone="+xueli+"&ttel="+tel+
        "&tjob="+gangwei+"&tremark="+beizhu+"&tid="+id,
        success: function(msg){
            var rest = $.parseJSON(msg);
            if(rest.info=="1"){
                alert("添加成功");
                $.ajax({
                    type: "get",
                    url: "selecrTeachersAll",
                    success: function(msg){

                        var str="";
                        var bt = "<tr ><th scope='col' class='text_sun'>序号</th><th class='zt' scope='col' class='text_sun'>账号</th><th scope='col' class='text_sun'>姓名</th><th scope='col' class='text_sun'>性别</th><th scope='col' class='text_sun'>生日</th><th scope='col' class='text_sun'>学历</th><th scope='col' class='text_sun'>联系电话</th><th scope='col' class='text_sun'>岗位</th><th scope='col' class='text_sun'>操作</th></tr>";

                        var obj = eval(msg);
                        for(var i = 0;i<obj.length;i++){
                            if(obj[i].tjob==0){
                                str= str+"<tr><td class='zt'>"+obj[i].tid+"</td> <td>"+obj[i].tnumber+"</td> <td >"+obj[i].tname+"</td> <td>"+obj[i].tsex+"</td> <td>"+obj[i].tbirthday+"</td> <td>"+obj[i].tphone+"</td> <td> "+obj[i].ttel+"</td> <td>班主任</td> <td><a onclick='a("+obj[i].tid+");'  >编辑</a> 重置密码  <a onclick='deletexx("+obj[i].tid+");'>删除</a></td></tr>";
                            }else {
                                str= str+"<tr><td class='zt'>"+obj[i].tid+"</td> <td>"+obj[i].tnumber+"</td> <td >"+obj[i].tname+"</td> <td>"+obj[i].tsex+"</td> <td>"+obj[i].tbirthday+"</td> <td>"+obj[i].tphone+"</td> <td> "+obj[i].ttel+"</td> <td>讲师</td> <td><a onclick='a("+obj[i].tid+");'  >编辑</a> 重置密码  <a onclick='deletexx("+obj[i].tid+");'>删除</a></td></tr>";

                            }

                        }
                        $("#students").html(bt);
                        $("#students").append(str);

                    }
                });
            }
        }
    });

    $("#jiaoshigl").css('display','none');

}

function deleteTeachers() {
    var id =  $("#id").val();

    $.ajax({
        type: "get",
        url: "deleteteachers?tid="+id,
        success: function(msg){
            var rest = $.parseJSON(msg);

        }

    });
}
$(function () {

});
