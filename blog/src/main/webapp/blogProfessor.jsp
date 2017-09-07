<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<base href="${deployName}">
<title>博客专家</title>
<link rel="shortcut icon" href="assets/i/favicon.png" />
<link href="css/base.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
<link href="css/blogProfessor.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<script type="text/javascript" src="js/sliders.js"></script>
</head>

<body>
	<header class="blog-header">
		<div class="centered">
			<img width="200" src="images/plot2.png" alt="Amaze UI Logo" />
		</div>
	</header>
	<hr>
	<nav class="blog-nav">
		<ul class="nav_left">
			<li class="am-active"><a href="homePage.jsp" >首页</a></li>
			<li><a href="blogColumn.jsp">博客专栏</a></li>
			<li><a href="blogProfessor.jsp" style="color: #10D07A;">博客专家</a></li>
			<li><a href="personPage.jsp">我的博客</a></li>
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
	</nav>
	<hr>
	<article>
		<hr>
		<span id="con_top">推荐专家</span> <span
			style="font-size: 18px; float: right; margin-right: 90px;"><a
			href="rule.jsp" style="color: red;">rule >></a></span>
		<hr>
		<div style="height: 800px;">
		<!--  内容区-->
			<div id="content"></div>
		</div>

	</article>
	<footer>
		<p class="ft-copyright">© 2015 AllMobilize, Inc. Licensed under
			MIT license. Made with love By LWXYFER1</p>
		<div id="tbox">
			<a id="togbook"></a> <a id="gotop" href="javascript:void(0)"></a>
		</div>
	</footer>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/moreOperation.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript">
		var result = $("#top_img").attr("src");
		if(result == ""){
			$("#top_img").attr("src","images/not_pic.jpg");
		}

	
		 $.post("blog/professor",function(data){
			var proStr ='';
			//alert(JSON.stringify(data));
			for(var i=0;i<data.length;i++){
				proStr += '<dl class="experts_list">';
				if(data[i].upic == null){
					proStr += '<dt><img class="expert_head" src="images/not_pic.jpg"></dt>';
				}else{
					proStr += '<dt><img class="expert_head" src="'+data[i].upic+'"></dt>';
				}
				proStr += '<dd><a class="expert_name" style="font-size:16px;color:#10D07A;" onclick="userDetail('+data[i].usid+')">'+data[i].uname+'</a>';
				proStr += '<div class="address"><div style="width: 45%; float: left; text-align: right;">';
				 var strs = new Array();
				strs = data[i].uaddress.split("-");
				if(strs[0] != ""){
					proStr += '<em>'+strs[0]+'</em>&nbsp;&nbsp;<b>|</b></div>';
				 }else{
					proStr += '<em>暂无</em>&nbsp;&nbsp;<b>|</b></div>';
				} 
				proStr += '<div id="con_pre"><span>'+data[i].uprofession+'</span></div></div>';
				proStr += '<div class="count_1 fl"><b>'+data[i].articlenum+'</b> <span>文章数</span></div>';
				proStr += '<div class="count_1 fr"><b>'+data[i].aviewtotal+'</b> <span>阅读量</span></div>';
				proStr += '</dd></dl>';
			}
			$("#content").html(proStr);
		}); 
		 
		//用户详情
		 function userDetail(index){
		 	location.href="userDetail.jsp?usid="+index;
		 }
	</script>

</body>

</html>
