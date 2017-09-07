<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<base href="${deployName}">
<meta charset="UTF-8">
<title>管理员列表</title>
</head>
<body>
	<table id="adminList"></table>
	<div id="admin">
		<a class="addBtn" href="javascript:void(0)">添加</a> <a class="updBtn"
			href="javascript:void(0)">刷新</a>
	</div>

	<div id="modifyAdmin" style="width: 310px; direction: center;">
		<form id="modifyAdminForm" method="post" enctype="multipart/form-data">
			<table cellpadding="10">
				<tr>
					<td>编号：</td>
					<td><input id="aid" name="adid" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>用户名：</td>
					<td><input id="aname" name="adname" class="easyui-validatebox"
						data-options="required:true,validType:'length[2,10]'" /></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input id="apassword" name="adpassword"
						class="easyui-passwordbox " data-options="required:true" /></td>
				</tr>
				<tr>
					<td>邮箱：</td>
					<td><input id="amail" name="admail"
						class="easyui-validatebox "
						data-options="required:true,validType:'email'"></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><a class="closeBtn"
						href="javascript:void(0)">关闭</a>&nbsp;&nbsp; <a class="updateBtn"
						href="javascript:void(0)">修改</a></td>
				</tr>
			</table>
		</form>
	</div>

	<div id="addAdmin" style="width: 300px; direction: center;">
		<form id="addAdminForm" method="post" enctype="multipart/form-data"
			style="margin-left: 20px;">

			<table cellpadding="10">
				<tr>
					<td align="right">用户名：</td>
					<td><input id="aname" name="adname"
						class="easyui-validatebox " data-options="required:true" /></td>
				</tr>
				<tr>
					<td align="right">密码：</td>
					<td><input id="apassword" name="adpassword"
						class="easyui-passwordbox " data-options="required:true" /></td>
				</tr>
				<tr>
					<td align="right">邮箱：</td>
					<td><input id="amail" name="admail"
						class="easyui-validatebox "
						data-options="required:true,validType:'email'" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><a class="closeBtn"
						href="javascript:void(0)">关闭</a>&nbsp;&nbsp; <a class="submitBtn"
						href="javascript:void(0)">确定</a></td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script src="js/validatebox.js" type="text/javascript"></script>

	<script src="js/admin_edit.js" type="text/javascript"></script>
</body>
</html>