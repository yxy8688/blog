<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<base href="${deployName}">
<meta charset="UTF-8">
<title>板块列表</title>
</head>
<body>
	<table id="columnList"></table>

	<div id="column">
		<a class="addBtn" href="javascript:void(0)">添加</a> <a class="updBtn"
			href="javascript:void(0)">刷新</a>
	</div>

	<div id="detailsColumn" style="width: 300px; padding: 10px">
		<p>
			板块id：<label id="dcoid"></label>
		</p>
		<p>
			板块标题：<label id="dcotitle"></label>
		</p>
		<p>
			文章id：<label id="daid"></label>
		</p>
		<p>
			板主昵称：<label id="duname"></label>
		</p>
		<p>
			板主邮箱：<label id="duemail"></label>
		</p>
		<p>
			板块创建时间：<label id="dcotime"></label>
		</p>
		<p>
			板块文章数：<label id="darticlenum"></label>
		</p>
		<p>
			板块浏览量：<label id="dcoviewnum"></label>
		</p>
		<p>
			板块描述内容：
			<textarea id="dcocontent" style="width: 250px;"></textarea>
		</p>
		<p>
			板块图片：<img src="images/not_pic.jpg" id="dcopic" width="100"
				height="100" align="top">
		</p>
		<p>
			<a class="closeBtn" href="javascript:void(0)">关闭</a>
		</p>
	</div>

	<div id="addColumn" style="width: 400px;">
		<form id="addColumnForm" method="post" enctype="multipart/form-data">
			<table cellpadding="10">
				<tr>
					<td>板块标题：</td>
					<td><input id="ccotitle" name="cotitle" style="width: 147px"
						class="easyui-validatebox textbox"
						data-options="prompt:'请输入板块标题.',required:true,validType:'length[1,20]'" /></td>
				</tr>
				<tr>
					<td>板主邮箱：</td>
					<td><input id="cuemail" name="uemail" style="width: 147px"
						class="easyui-combobox validatebox "
						data-options="prompt:'请输入正确的邮箱.',required:true,validType:'email'" /></td>
				</tr>
				<tr>
					<td>板块文章：</td>
					<td><input id="caid" class="easyui-combobox" name="coaid"
						style="width: 147px" /></td>
				</tr>
				<tr>
					<td>板块说明：</td>
					<td><textarea id="ccocontent" name="cocontent"
							class="inputclass" style="width: 250px;"></textarea></td>
				</tr>
				<tr>
					<td>板块图片：</td>
					<td><input id="copic" type="file" name="picData"
						onchange="chgPic(this)" /><br> <img src="images/not_pic.jpg"
						id="pic" width="100" height="100"></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><a class="closeBtn"
						href="javascript:void(0)">关闭</a>&nbsp;&nbsp; <a class="addColumBtn"
						href="javascript:void(0)">添加</a></td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script src="js/validatebox.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/column_edit.js"></script>

</body>
</html>