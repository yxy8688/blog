<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<base href="${deployName}">
<meta charset="utf-8">
<title>新建博客</title>
<link rel="icon" type="image/png" href="assets/i/favicon.png">
<link rel="stylesheet" href="assets/css/amazeui.min.css">
<link rel="stylesheet" href="assets/css/app.css">
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<script type="text/javascript" charset="utf-8"
	src="ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
</head>

<body id="blog">
	<header class="am-g am-g-fixed blog-fixed blog-text-center blog-header">
		<div class="am-u-sm-8 am-u-sm-centered">
			<img width="200" src="assets/i/plot2.png" alt="Amaze UI Logo" />
			<h2 class="am-hide-sm-only"></h2>
		</div>
	</header>
	<hr>
	<nav class="am-g am-g-fixed blog-fixed blog-nav">
		<div class="am-collapse am-topbar-collapse" id="blog-collapse">
			<ul class="am-nav am-nav-pills am-topbar-nav" id="top_ul">
				<li><a href="homePage.jsp">首页</a></li>
				<li><a href="personPage.jsp">我的文章</a></li>
				<li><a href="page/blog_add.jsp" style="color: #10D07A;">写新文章</a></li>
				<li><a href="page/blogManager.jsp">文章管理</a></li>
				<li><a href="page/blog_tag.jsp">类别管理</a></li>
				<li><a href="page/blogComment.jsp">评论管理</a></li>
				<li><a href="page/blogDrafets.jsp">草稿箱</a></li>
				<li><a href="page/personInfo.jsp">个人信息管理</a></li>
			</ul>
			<!-- 菜单栏右部分 -->
			<div id="top_right" class="show_loginUser" style="float: right;">
				<img src="${loginUser.getUpic()}" id="top_img"
					style="float: left; width: 50px; height: 50px; border-radius: 50%; margin-right: 10px;">
				<div style="float: left; height: 100%; line-height: 50px;">
					欢迎 : <input type="text" id="loginUname" readonly="readonly"
						value="${loginUser.getUname()}" /> <select id="user_select"
						style="border: none;">
						<option disabled="disabled" selected="selected">&nbsp;&nbsp;更多</option>
						<option onclick="switch_user()">切换用户</option>
						<option onclick="login_out()">退出</option>
					</select>
				</div>
			</div>
		</div>
	</nav>
	<hr>
	<!-- nav end -->
	<!-- content srart -->
	<div class="am-g am-g-fixed blog-fixed">
		<div class="am-u-md-8 am-u-sm-12">
			<!-- 新建博客 -->

			<form class="am-form am-g" id="add_form" method="post"
				enctype="multipart/form-data">
				<h2 class="blog-comment" align="center">新建博客</h2>
				<fieldset>
					<div class="am-form-group am-u-sm-4 blog-clear-left">
						<label>标题</label><span id="span1" style="margin-left:10px;color:red;"></span><input type="text" id="atitle" name="atitle"
							placeholder="标题" onBlur="show1(this)">
					</div>
					<div class="am-form-group am-u-sm-4">
						<label>标签 </label> <select name="tagid" id="tag">
							<option disabled="disabled" selected="selected">--请选择类别--</option>
						</select>
					</div>

					<div class="am-form-group am-u-sm-4 blog-clear-right">
						<label>文章类型 </label> <select name="tid" id="type">
							<option disabled="disabled" selected="selected">--请选择文章类型--</option>
						</select>
					</div>

					<div class="am-form-group">
						<label>内容 </label>
						<textarea name="acontent" id="acontent" rows="15"
							style="height: 150px;" placeholder="一字千金"></textarea>
					</div>
					<div id="show_img"></div>
					<p>
						<label> 上传图片 </label><input type="file" id="upicDate"
							name="upicDate" placeholder="选择文件" onchange="chgPic(this)">
					</p>
				</fieldset>
				<p id="controlNav"></p>
			</form>
				
		</div>
		<div class="am-u-md-4 am-u-sm-12 blog-sidebar">
			<div class="blog-sidebar-widget blog-bor">
				<h2 class="blog-text-center blog-title">
					<span>About ME</span>
				</h2>
				<div id="userPersonInfo"></div>

			</div>
			<div class="blog-sidebar-widget blog-bor">
				<h2 class="blog-text-center blog-title">
					<span>Contact ME</span>
				</h2>
				<p>
					<a href=""><span
						class="am-icon-qq am-icon-fw am-primary blog-icon"></span></a> <a
						href=""><span class="am-icon-github am-icon-fw blog-icon"></span></a>
					<a href=""><span class="am-icon-weibo am-icon-fw blog-icon"></span></a>
					<a href=""><span class="am-icon-reddit am-icon-fw blog-icon"></span></a>
					<a href=""><span class="am-icon-weixin am-icon-fw blog-icon"></span></a>
				</p>
			</div>
			<div class="blog-clear-margin blog-sidebar-widget blog-bor am-g ">
				<h2 class="blog-title">
					<span>TAG cloud</span>
				</h2>
				<div class="am-u-sm-12 blog-clear-padding">
					<a href="" class="blog-tag">amaze</a> <a href="" class="blog-tag">妹纸
						UI</a> <a href="" class="blog-tag">HTML5</a> <a href=""
						class="blog-tag">这是标签</a> <a href="" class="blog-tag">Impossible</a>
					<a href="" class="blog-tag">开源前端框架</a>
				</div>
			</div>
			<div class="blog-sidebar-widget blog-bor">
				<h2 class="blog-title">
					<span>么么哒</span>
				</h2>
				<ul class="am-list">
					<li><a href="#">每个人都有一个死角， 自己走不出来，别人也闯不进去。</a></li>
					<li><a href="#">我把最深沉的秘密放在那里。</a></li>
					<li><a href="#">你不懂我，我不怪你。</a></li>
					<li><a href="#">每个人都有一道伤口， 或深或浅，盖上布，以为不存在。</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- content end -->
	<footer class="blog-footer">

		<div class="blog-text-center">© 2015 AllMobilize, Inc. Licensed
			under MIT license. Made with love By LWXYFER</div>
	</footer>

	<script src="assets/js/amazeui.min.js"></script>

	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="ueditor/ueditor.all.min.js"></script>
	<script type="text/javascript" src="js/commonUserInfo.js"></script>
	<script type="text/javascript" src="js/moreOperation.js"></script>

	<script type="text/javascript">
	
		var result = $("#top_img").attr("src");
		
		
		if(result == ""){
			$("#top_img").attr("src","images/not_pic.jpg");
		}
		 $.post("blog/professor",function(data){
			 var curr = "${loginUser.getUsid()}";
			 for(var i=0;i<data.length;i++){
				 if(data[i].usid == curr){
					 var ulStr ='<li><a href="page/blog_column.jsp">专栏管理</a></li>';
					 $("#top_ul").append(ulStr);
				 }
			 }
		 });
	
		UE.getEditor('acontent');// 使用副文本编辑工具
		
		var aid = "<%=request.getParameter("aid")%>";
		var drid ="<%=request.getParameter("drid")%>";

		if (aid != "null") {
			var navStr = "";
			findArticleByAid();
			navStr += "<button type='submit' style='margin-right:20px;' class='am-btn am-btn-default' onclick='update_article()'>更改文章</button>";
			navStr += "<button type='button' class='am-btn am-btn-default' onclick='backFirst()'>取消</button>";
			navStr += "<input type='text' name='aid' style='width:100px;display:none;' value='"+aid+"'/> ";
			$("#controlNav").html(navStr);
		} else {
			var navStr = "";
			navStr += "<button type='submit' style='margin-right:20px;' class='am-btn am-btn-default' onclick='add_article()'>发表文章</button>";
			if (drid != "null") {
				navStr += "<button type='submit' style='margin-right:20px;' class='am-btn am-btn-default' onclick='updateDrafets()'>立即保存</button>";
				navStr += "<input type='text' name='drid' style='width:100px;display:none;' value='"+drid+"'/> ";
			} else {
				navStr += "<button type='submit' style='margin-right:20px;' class='am-btn am-btn-default' onclick='saveArticle()'>立即保存</button>";
			}
			navStr += "<button type='reset' class='am-btn am-btn-default' onclick='reset_img()'>重置</button>";

			$("#controlNav").html(navStr);
		}

		/* 如果drid 不为空 */
		if (drid != "null") {
			findDrafetsByDrid();
		}

		/* 获取类别标签的请求 */
		$.get("tag/findAll", function(data) {
			for (var i = 0; i < data.length; i++) {
				var option = "<option value='" + data[i].tagid + "'>"
						+ data[i].tagname + "</option>";
				$("#tag").append(option);
			}
		});
		/* 获取类型标签的请求 */
		$.get("type/findAll", function(data) {
			for (var i = 0; i < data.length; i++) {
				var option = "<option value='" + data[i].tid + "'>"
						+ data[i].tname + "</option>";
				$("#type").append(option);
			}
		});
		/* 图片更改 */
		function chgPic(obj) {
			var picStr = "<img src='"
					+ window.URL.createObjectURL(obj.files[0])
					+ "' style='width: 400px; height: 200px;'>";
			$("#show_img").html(picStr);
		}
		/* 添加文章的请求 */
		function add_article(){
			var str = $("#atitle").val();
			var getBLen;
			getBLen = str.replace(/[^\x00-\xff]/g,"ab").length;
			if(getBLen >30){
				  $.messager.alert("操作提示","标题过长，应在30个字符以内...","error"); 
			/* 	alert("标题过长，应在30个字符以内..."); */
			}else{
				$("#add_form").form({
					url : "article/addArticle",
					success : function(data) {
						if (data.trim() == "true") {
							$.messager.alert("操作提示", "添加成功...", "info", function() {
								if (aid != "null") {
									location.href = "page/blogManager.jsp";
								} else if (drid != "null") {
									$.post("drafets/deleteDrafets", {
										drid : drid
									}, function(data) {
										location.href = "page/blogDrafets.jsp";
									});
								} else {
									location.reload();
								}
							});
						} else {
							$.messager.alert("操作提示", "添加失败！！", "error");
						}
					}
				});
			}
			
		}
		/* 清空图片 */
		function reset_img(){
			$("#show_img").html("");
		}
		/* 更改文章的请求 */
		function update_article() {
			var str = $("#atitle").val();
			var getBLen;
			getBLen = str.replace(/[^\x00-\xff]/g,"ab").length;
			if(getBLen >30){
				  $.messager.alert("操作提示","标题过长，应在30个字符以内...","error"); 
			/* 	alert("标题过长，应在30个字符以内..."); */
			}else{
				var str = $("#atitle").val();
				var getBLen;
				getBLen = str.replace(/[^\x00-\xff]/g,"ab").length;
				if(getBLen >30){
					$.messager.alert("操作提示","标题过长，应在30个字符以内...","error");
				}else{
					$("#add_form").form({
						url : "article/updateArticle",
						success : function(data) {
							if (data.trim() > 0) {
								$.messager.alert("操作提示", "更改成功...", "info", function() {
									location.href = "page/blogManager.jsp";
								});
							} else {
								$.messager.alert("操作提示", "更改失败！！", "error", function() {
									location.reload();
								});
							}
						}
					});
				}
			}
		}
		/* 保存到草稿箱 */
		function saveArticle() {
			var str = $("#atitle").val();
			var getBLen;
			getBLen = str.replace(/[^\x00-\xff]/g,"ab").length;
			if(getBLen >30){
				  $.messager.alert("操作提示","标题过长，应在30个字符以内...","error"); 
			/* 	alert("标题过长，应在30个字符以内..."); */
			}else{
				$("#add_form").form({
					url : "drafets/addDrafet",
					success : function(data) {
						if (data.trim() == "true") {
							$.messager.alert("操作提示", "保存成功...", "info", function() {
								location.reload();
							});
						} else {
							$.messager.alert("操作提示", "保存失败！！", "error");
						}
					}
				});
			}
		}
		/* 更改草稿箱 */
		function updateDrafets() {
			var str = $("#atitle").val();
			var getBLen;
			getBLen = str.replace(/[^\x00-\xff]/g,"ab").length;
			if(getBLen >30){
				  $.messager.alert("操作提示","标题过长，应在30个字符以内...","error"); 
			/* 	alert("标题过长，应在30个字符以内..."); */
			}else{
				$("#add_form").form({
					url : "drafets/updateDrafets",
					success : function(data) {
						if (data.trim() == "true") {
							$.messager.alert("操作提示", "保存成功...", "info", function() {
								location.reload();
							});
						} else {
							$.messager.alert("操作提示", "保存失败！！", "error");
						}
					}
				});
			}
		}

		// 如果url 拼接有aid 
		function findArticleByAid() {
			$.post(
					"article/findArticleByAid",
					{aid : aid},
							function(data) {
								$("#atitle").val(data.atitle);
								$("#tag").val(data.tagname);
								$("#type").val(data.tname);
								$("#acontent").val(data.acontent);
								if (data.apic != null) {
									var picStr = "<img src='"+data.apic+"' style='width: 400px; height: 200px;'>";
									$("#show_img").html(picStr);
								} else {
									var picStr = "<img src='images/not_pic.jpg'>";
									$("#show_img").html(picStr);
								}
							});
		}
		// 如果url 拼接有drid
		function findDrafetsByDrid() {
			$.post(
					"drafets/findDrafetByDrid",
					{
						drid : drid
					},
				function(data) {
					$("#atitle").val(data.drtitle);
					$("#tag").val(data.drtagid);
					$("#type").val(data.drtypeid);
					$("#acontent").val(data.drcontent.trim());
					if (data.drpic != null) {
					var picStr = "<img src='"+data.drpic+"' style='width: 400px; height: 200px;'>";
					} else {
				var picStr = "<img src='images/not_pic.jpg'>";
						}
					$("#show_img").html(picStr);
			});
		}
		//点击取消，返回
		function backFirst() {
			location.href = "page/blogManager.jsp";
		}
		
		//验证
		 function show1(obj){
			 var str = $("#atitle").val();
				var getBLen= str.replace(/[^\x00-\xff]/g,"ab").length;
				if(getBLen >30){
					$("#span1").html("标题过长，只允许30个字符..");
				}else{
					$("#span1").html("");
				}
	    } 
	</script>
</body>

</html>