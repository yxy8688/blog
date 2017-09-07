<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>类型管理</title>
</head>
<body>
	<table id="typeList"></table>
	<div id="type">
		<br/>
	</div>
	<div id="modifyType" style="width: 300px; direction: center;">
		<form id="modifyTypeForm" method="post" enctype="multipart/form-data"
			style="margin-left: 20px;">
			<p>
				<span>编号：</span> <input id="id" name="tid" class="inputclass" />
			</p>
			<p>
				<span>类型名：</span> <input id="name" name="tname" class="inputclass" />
			</p>
			<p>
				<a class="closeBtn" href="javascript:void(0)">关闭</a>&nbsp;&nbsp; <a
					class="updateBtn" href="javascript:void(0)">修改</a>
			</p>
		</form>
	</div>
	<div id="addType" style="width: 300px; direction: center;">
		<form id="addTypeForm" method="post" enctype="multipart/form-data"
			style="margin-left: 20px;">
			<p>
				<span>类型名：</span> <input id="tname" name="tname" class="inputclass" />
			</p>
			<p>
				<a class="closeBtn" href="javascript:void(0)">关闭</a>&nbsp;&nbsp; <a
					class="submitBtn" href="javascript:void(0)">确定</a>
			</p>
		</form>
	</div>
	<script type="text/javascript" src="js/type_edit.js"></script>
</body>
</html>