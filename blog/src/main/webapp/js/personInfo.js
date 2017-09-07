/**
 * 个人用户信息显示页面
 */

$("#contentBox").panel({
	fit : true,
	title : " ",
	border : false,
});

function myformatter(date) {
	var y = date.getFullYear();
	var m = date.getMonth() + 1;
	var d = date.getDate();
	return y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d);
}
function myparser(s) {
	if (!s)
		return new Date();
	var ss = (s.split('-'));
	var y = parseInt(ss[0], 10);
	var m = parseInt(ss[1], 10);
	var d = parseInt(ss[2], 10);
	if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
		return new Date(y, m - 1, d);
	} else {
		return new Date();
	}
}
// 从数据库中获取值
$.get("blog/showUserInfo", function(data) {
	if (data.upic) {
		$("#upic").attr("src", data.upic);
		$("#loginPic").attr("src", data.upic);
	} else {
		$("#upic").attr("scr", "images/not_pic.jpg");
	}
	if (data.usex == '男') {
		$("#usex1")[0].checked = true;
	} else {
		$("#usex2")[0].checked = true;
	}
	$("#uname").val(data.uname);
	$("#loginUname").val(data.uname);
	$("#ubirthday").datebox('setValue', data.ubirthday);
	
	$("#uphone").textbox('setValue',data.uphone);
	$("#uprofession").val(data.uprofession);
	$("#upersondesc").val(data.upersondesc);
	var strs = new Array();
	strs = data.uaddress.split("-");
	$("#selProvince_op").html(strs[0]);
	$("#selCity_op").html(strs[1])
	$("#selDistrict_op").html(strs[2]);

});
// 焦点事件
$("#selProvince").focus(function() {
	$("#selProvince_op").html("--请选择省份--");
	$("#selCity_op").html("--请选择城市--");
	$("#selDistrict_op").html("--请选择区/县--");
});
$("#selCity").focus(function() {
	$("#selProvince_op").html("--请选择省份--");
	$("#selCity_op").html("--请选择城市--");
	$("#selDistrict_op").html("--请选择区/县--");
});
$("#selDistrict").focus(function() {
	$("#selProvince_op").html("--请选择省份--");
	$("#selCity_op").html("--请选择城市--");
	$("#selDistrict_op").html("--请选择区/县--");
});

// 更改操作
function updata_userInfo() {
	var uname = $("#uname").val();
	var ubirthday = $('#ubirthday').datebox('getValue');
	var uphone = $("#uphone").val();
	var uprofession = $("#uprofession").val();
	var upersondesc = $("#upersondesc").val();
	getUddress();
	
	var getBLen1= uname.replace(/[^\x00-\xff]/g,"ab").length;
	var getBLen2= uprofession.replace(/[^\x00-\xff]/g,"ab").length;
	var getBLen3= upersondesc.replace(/[^\x00-\xff]/g,"ab").length;
	
	if(getBLen1 > 30 || getBLen2>40 || getBLen3>200){
		alert("昵称/职业/个性签名不符合限制条件...");
	}else{
		$.post("blog/update_userInfo",{uname:uname,ubirthday:ubirthday,uphone:uphone,uprofession:uprofession,upersondesc:upersondesc,usex:usex,uaddress:uaddress},
				function(data){
			  $.messager.alert("操作提示", "操作成功！","info",function(){
				  location.reload();
			  });
		},"json");
	}
}

var uaddress; // 获得地址 变量
var usex; // 获得性别 变量
$(function() {
	$.each(province, function(k, p) {
		var option = "<option value='" + p.ProID + "'>" + p.ProName
				+ "</option>";
		$("#selProvince").append(option);
	});
	$("#selProvince").change(
			function() {
				var selValue = $(this).val();
				$("#selCity option:gt(0)").remove();
				$.each(city, function(k, p) {
					if (p.ProID == selValue) {
						var option = "<option value='" + p.CityID + "'>"
								+ p.CityName + "</option>";
						$("#selCity").append(option);
					}
				});
			});
	$("#selCity").change(
			function() {
				var selValue = $(this).val();
				$("#selDistrict option:gt(0)").remove();

				$.each(District, function(k, p) {
					if (p.CityID == selValue) {
						var option = "<option value='" + p.Id + "'>"
								+ p.DisName + "</option>";
						$("#selDistrict").append(option);
					}
				});
			});
});
function ck() {
	var clc = document.getElementsByClassName("rad1");
	console.info(clc.item(0).checked);
	clc[0].checked = true;
	usex = $("#usex1").val();
	var cl2 = document.getElementsByClassName("rad2");
	if (cl2.item(0).checked == true) {
		cl2[0].checked = false;
	}
}
function ck2() {
	var cl2 = document.getElementsByClassName("rad2");
	console.info(cl2.item(0).checked);
	cl2[0].checked = true;
	usex = $("#usex2").val();
	var clc = document.getElementsByClassName("rad1");
	if (clc.item(0).checked == true) {
		clc[0].checked = false;
	}
}
function chgPic(obj) {
	$("#upic").attr("src", window.URL.createObjectURL(obj.files[0]));
}

function getUddress() {
	var myselect = document.getElementById("selProvince");
	var index = myselect.selectedIndex;
	var pro;
	var city;
	var district;
	if (index == 0) {
		pro = "";
	} else {
		pro = myselect.options[index].text
	}
	var myselect2 = document.getElementById("selCity");
	var index2 = myselect2.selectedIndex;
	if (index2 == 0) {
		city = "";
	} else {
		city = myselect2.options[index2].text
	}
	var myselect3 = document.getElementById("selDistrict");
	var index3 = myselect3.selectedIndex;
	if (index3 == 0) {
		district = "";
	} else {
		district = myselect3.options[index3].text
	}
	if (pro == "" && city == "" && district == "") {
		uddress = "";
	} else {
		uaddress = pro + '-' + city + '-' + district;
	}

}

$.extend($.fn.validatebox.defaults.rules, {
	phoneNum : { // 验证手机号
		validator : function(value) {
			var rex = /^1[3-8]+\d{9}$/;
			// var rex=/^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
			// 区号：前面一个0，后面跟2-3位数字 ： 0\d{2,3}
			// 电话号码：7-8位数字： \d{7,8
			// 分机号：一般都是3位数字： \d{3,}
			// 这样连接起来就是验证电话的正则表达式了：/^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/
			var rex2 = /^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
			if (rex.test(value) || rex2.test(value)) {
				// alert('t'+value);
				return true;
			} else {
				// alert('false '+value);
				return false;
			}

		},
		message : '请输入正确的电话号码'
	}
});
