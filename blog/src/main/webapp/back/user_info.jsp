<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户列表</title>
</head>
<body>
	<div id="userinfo">
		<input id="uinfo1" class="easyui-combobox" /> <input id="uinfo2"
			class="easyui-combobox" /> <a href="javascript:void(0)"
			class="searchBtn">查询</a> <a class="updBtn" href="javascript:void(0)">刷新</a><a
			href="javascript:void(0);" class="easyui-linkbutton"
			iconCls="icon-print" plain="true" onclick="exportExcel()"
			style="float: right;"> 导出Excel </a>

	</div>
	<table id="userList"></table>

	<div id="detailsUser" style="width: 300px; padding: 10px">

		<p>
			姓名：<label id="dname"></label>
		</p>
		<p>
			邮件：<label id="demail"></label>
		</p>
		<p>
			性别：<label id="dgender"></label>
		</p>
		<p>
			生日：<label id="dbirthday"></label>
		</p>
		<p>
			地址：<label id="daddress"></label>
		</p>
		<p>
			电话：<label id="dmobile"></label>
		</p>
		<p>
			职业：<label id="dprofession"></label>
		</p>
		<p>
			签名：
			<textarea id="dpersondesc" style="width: 200px;"></textarea>
		</p>
		<p>
			图片：<img src="images/not_pic.jpg" id="dpic" width="100" height="100"
				align="top">
		</p>
		<p>
			<a class="closeBtn" href="javascript:void(0)">关闭</a>
		</p>
	</div>
	<script type="text/javascript" src="js/user_info.js"></script>
</body>
</html>