<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<base href="${deployName}">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="assets/i/favicon.png" />
<link type="text/css" rel="stylesheet" href="easyui/themes/icon.css">
<link type="text/css" rel="stylesheet"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/demo/demo.css">
<link href="css/manage.css" rel="stylesheet" type="text/css">
<title>博客后台管理</title>
</head>

<body class="easyui-layout">
	<div
		data-options="region:'north' ,title:'欢迎【 <span>${loginAdmin.adname}</span>】进入博客管理系统'"
		style="height: 110px; background: #E9F1FF; padding-top: 20px;">
		<div style="width: 60%; text-align: center; float: left;">
			<img
				style="height: 40px; width: 200px; margin: auto auto; float: right"
				class="logo" alt="公司logo" src="images/plot2.png" />
		</div>
		<div
			style="width: 20%; margin: auto auto; color: #082C5A; float: right;">
			<div>
				管理员：[<strong style="font-size: 120%; color: green;">${loginAdmin.adname}</strong>]，欢迎您进入博客管理系统
			</div>
			<div style="margin-top: 8px;">
				<a href="javascript:void(0);" class="easyui-menubutton"
					data-options="menu:'#layout_north_kzmbMenu',iconCls:'icon-help'">信息中心</a>
				<a href="javascript:void(0);" class="easyui-menubutton"
					data-options="menu:'#layout_north_zxMenu',iconCls:'icon-back'">注销</a>
			</div>
		</div>
	</div>

	<div data-options="region:'south'" style="height: 60px;">
		<div class="copyright"
			style="background: #E9F1FF; line-height: 29px; text-align: center;">
			Copyright &copy; 2017-2020 Front Back Template, All Right Reserver <br />
			acosta Blog 博客系统 版权所有
		</div>
	</div>
	<div data-options="region:'east',title:'工具栏'" style="width: 182px;">
		<br> <input id="ss"></input>

		<div class="easyui-calendar"
			style="width: 180px; padding-top: 10px; height: 180px; border: 0px; border-bottom: 1px solid #94BAE7"></div>
	</div>

	<div
		data-options="region:'west',title:'管理中心',split:true,
		collapsible:false"
		style="width: 160px;">
		<div id="sideNav">
			<div title="信息管理" data-options="iconCls:'icon-mini-add'">
				<ul class="treeNav">
					<li><span>用户管理</span></li>
					<li><span>管理员设置</span></li>
				</ul>
			</div>
			<div title="博客管理" data-options="iconCls:'icon-mini-add'">
				<ul class="treeNav">
					<li><span>查询文章</span></li>
					<li><span>类型管理</span></li>
					<li><span>类别管理</span></li>
					<li><span>评论管理</span></li>
					<li><span>板块管理</span></li>
				</ul>
			</div>
			<div title="排行榜" data-options="iconCls:'icon-mini-add'">
				<ul class="treeNav">
					<li><span>文章发表排行</span></li>
					<li><span>文章标签排行</span></li>
				</ul>
			</div>
		</div>
	</div>

	<div
		data-options="region:'center',title:'主界面',tools: [{    
	    iconCls:'icon-full',    
	    handler:function(){full();}    
	  },{    
	    iconCls:'icon-unfull',    
	    handler:function(){unfull();}    
	  }]  ">
		<div id="main" style="width: 500px; height: 250px;">

			<div title="欢迎">
				<h1 style="width: 100%; text-align: center; margin-top: 80px">
					<label> 欢迎【<span style="color: green;">${loginAdmin.adname}</span>】使用博客管理系统
					</label>
				</h1>
			</div>
		</div>
	</div>

	<!-- 下拉信息中心菜单 -->
	<div id="layout_north_kzmbMenu" style="width: 100px; display: none;">
		<div onclick="userInfoFun();">修改密码</div>
		<div class="menu-sep"></div>
		<div onclick="aboutUs();">联系我们</div>
	</div>
	<!-- 下拉信息菜单 -->
	<div id="layout_north_zxMenu" style="width: 100px; display: none;">
		<div onclick="reLogin();">切换用户</div>
		<div class="menu-sep"></div>
		<div onclick="logoutFun();">退出系统</div>
	</div>

	<!-- 修改密码 -->
	<div id="personalInfo" style="width: 310px; direction: center;">
		<form id="modifyPwdForm" method="post">
			<table cellpadding="10">
				<tr align="center">
					<td colspan="2"><input name="adid" type="hidden"
						value="${loginAdmin.adid}" /></td>
				</tr>
				<tr>
					<td align="right">原密码:</td>
					<td><input id="propwd" name="propwd"
						class="easyui-passwordbox" <%-- value="${loginAdmin.adpassword}" --%>
						data-options="prompt:'请输入原密码',required:true" style="width: 150px;" /></td>
				</tr>
				<tr>
					<td align="right">新密码:</td>
					<td><input id="pwd" name="adpassword"
						class="easyui-passwordbox "
						data-options="prompt:'请输入新密码',required:true"
						style="width: 150px;" validType="equals['#propwd']" /></td>
				</tr>
				<tr>
					<td align="right">重复新密码:</td>
					<td><input id="rpwd" name="rpwd" class="easyui-passwordbox "
						data-options="prompt:'请重新输入新密码',required:true"
						style="width: 150px;" validType="equalTo['#pwd']" /></td>
				</tr>
				<tr>
					<td align="center" colspan="2" style="padding-left: 60px;"><a  id="modifyPwdBtn"
						href="javascript:void(0)">修 改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a id="closeBtn"
						href="javascript:void(0)">关 闭</a></td>
				</tr>

			</table>
		</form>
	</div>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<script src="js/validatebox.js" type="text/javascript"></script>
	<script type="text/javascript" src="Highcharts/code/highcharts.js"></script>
	<script type="text/javascript"
		src="Highcharts/code/modules/exporting.js"></script>
	<script type="text/javascript" src="Highcharts/code/modules/data.js"></script>

	<script type="text/javascript" src="js/manage.js"></script>
</body>
</html>