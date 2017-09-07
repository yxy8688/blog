<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文章列表</title>
</head>
<body>
	<div id="article">
		<input id="mkid" class="easyui-combobox" /> <input id="zhbid"
			class="easyui-combobox" /> <a href="javascript:void(0)"
			class="searchBtn">查询</a> 
			<a href="javascript:void(0);"
			class="easyui-linkbutton" iconCls="icon-print" plain="true"
			onclick="exportExcel()" style="float: right;"> 导出Excel </a>

	</div>
	<table id="articleList"></table>

	<div id="detailsArticle" style="width: 300px; padding: 10px">
		<p>
			编号：<label id="Aaid"></label>
		</p>
		<p>
			标题：<label id="Atitle"></label>
		</p>
		<p>
			类型：<label id="Atid"></label>
		</p>
		<p>
			标签：<label id="Atagid"></label>
		</p>
		<p>
			作者：<label id="Ausid"></label>
		</p>
		<p>
			创作时间：<label id="Aatime"></label>
		</p>
		<p>
			浏览量：<label id="Aaviewnum"></label>
		</p>
		<p>
			浏览量：<label id="Acommentnum"></label>
		</p>
		<p>
			内容：
			<textarea id="Aacontent" style="width: 200px;"></textarea>
		</p>
		<p>
			图片：<img src="images/not_pic.jpg" id="pic" width="100" height="100"
				align="top">
		</p>
		<p>
			<a class="closeBtn" href="javascript:void(0)">关闭</a>
		</p>
	</div>
	<script type="text/javascript" src="js/article_info.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
</body>
</html>