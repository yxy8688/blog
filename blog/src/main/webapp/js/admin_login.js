$("#loginDiv").dialog({
	title : "",
	border : false,
	modal : true,
	width : 300,
	top : 80
});

$('#btnLogin').linkbutton({
	iconCls : 'icon-man',
	onClick : function() {
		$("#loginForm").submit();// 表单提交
	}
});
//键盘事件 ，按enter键表单提交
$(window).keydown(function(event){
	if(event.keyCode==13){
		$("#loginForm").submit();// 表单提交
	}
});
