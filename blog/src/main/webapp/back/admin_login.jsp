<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<base href="${deployName}">
<meta charset="UTF-8">
<title>管理员登录</title>
<link rel="shortcut icon" href="assets/i/favicon.png" />
<link type="text/css" rel="stylesheet" href="easyui/themes/icon.css">
<link type="text/css" rel="stylesheet"
	href="easyui/themes/default/easyui.css">
<link type="text/css" rel="stylesheet" href="css/admin_login.css">
</head>
<body>
	<div id="loginDiv">
		<form id="loginForm" method="post" action="admin/login">
			<table cellpadding="5" width=200px align="center">
				<tr align="center">
					<td colspan="2"><label style="color: red;">${errorMsg}&nbsp;</label></td>
				</tr>
				<tr align="center">
					<td colspan="2"><input name="adname" placeholder="输入管理员名称"
						class="easyui-validatebox " width="200px"
						data-options="required:true" /></td>
				</tr>
				<tr align="center">
					<td colspan="2"><input name="adpassword" prompt="请输入密码"
						class="easyui-passwordbox " data-options="required:true" /></td>
				</tr>
				<tr align="center">
					<td align="right" width="70px"><img src="vcode.jpg"
						title="看不清，换一张" /></td>
					<td align="left"><input name="vcode" placeholder="请输入验证码"
						id="vcode" class="easyui-validatebox "
						data-options="required:true" /></td>
				</tr>
				<tr align="center">
					<td colspan="2">&nbsp;&nbsp;<a href="back/admin_login.jsp"
						class="easyui-linkbutton" iconCls="icon-reload">重置</a> <a
						id="btnLogin" href="javascript:void(0)">登录</a> <a
						href="back/forgetPassword.jsp" class="easyui-linkbutton"
						plain="true">忘记密码</a></td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<script src="js/validatebox.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/admin_login.js"></script>
</body>
</html>