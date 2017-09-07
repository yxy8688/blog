<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html>
<head>
<base href="${deployName}">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>忘记密码</title>
<link type="text/css" rel="stylesheet" href="easyui/themes/icon.css">
<link type="text/css" rel="stylesheet"
	href="easyui/themes/default/easyui.css">
</head>
<body>
	<div id="forgetDiv">
		<form id="forgetForm" action="admin/forgetPassword" method="post">
			<table cellpadding="5" style="width: 300px; padding-left: 15px;">
				<tr align="center">
					<td colspan="2"><label style="color: red;">${errorMsg}&nbsp;</label></td>
				</tr>
				<tr>
					<td align="right" width="60px">管理员名称</td>
					<td align="left"><input id="adname" name="adname"
						class="easyui-validatebox " placeholder="请输入管理员名称"
						data-options="required:true" /></td>
				</tr>

				<tr>
					<td align="right">邮箱</td>
					<td align="left"><input name="admail" id="admail"
						class="easyui-validatebox " placeholder="请输入忘记密码邮箱"
						data-options="required:true,validType:'email'" /></td>
				</tr>


				<tr>
					<td align="right">验证码</td>
					<td align="left"><input type="text" id="yzm" name="yzm"
						class="easyui-validatebox yzm" style="float: left; width: 45%;"
						placeholder="请输入验证码" data-options="required:true" /> <a
						class="easyui-linkbutton yzmbutton" id="yzmbutton"
						onClick="getYZM()">发送验证码</a>
				</tr>

				<tr>
					<td colspan="2" align="center"><a id="btnLogin"
						class="easyui-linkbutton"
						style="width: 170px; margin-bottom: 20px"
						onClick="forgetPassword()">忘记密码登录</a></td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
	//键盘事件 ，按enter键表单提交
	$(window).keydown(function(event){
		if(event.keyCode==13){
			$("#forgetForm").submit();// 表单提交
		}
	});
		function forgetPassword() {
			$("#forgetForm").submit();
		}
		$("#forgetDiv").dialog({
			title : "",
			border : false,
			modal : true,
			width : 300,
			top : 80
		});
		var countdown = 0;
		function getYZM() {
			countdown = 60;
			var admail = $.trim($("#admail").val());
			var random;
			if (admail == null || admail == "") {
				alert("请输入邮箱号");
			} else {
				$.ajax({
					url : 'sendEmail/admin',
					type : 'GET',
					data : {
						admail : admail
					},
					contentType : 'application/json;charset=UTF-8',
					success : function(data) {
						random = data;
						settime();
					}
				});
			}

			$("#yzm").focusout(function() {
				var yzmvalue = $.trim($("#yzm").val());
				if (yzmvalue != null && yzmvalue != random) {
					alert("验证码错误,请重新输入");
					$("#yzm").val("");
				}
			});
		}
		function settime() {
			if (countdown == 0) {
				$("#yzmbutton").removeAttr("disabled");
				$("#yzmbutton").text("点击获取验证码");
			} else {
				$("#yzmbutton").attr("disabled", "disabled");
				$("#yzmbutton").text("重新发送(" + countdown + ")s");
				countdown--;
			}
			setTimeout(function() {
				settime()
			}, 1000);
		}
	</script>

</body>
</html>