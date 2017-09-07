<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<base href="${deployName}">
<title>个人主界面</title>
<link rel="icon" type="image/png" href="assets/i/favicon.png">
<link rel="stylesheet" href="assets/css/amazeui.min.css">
<link rel="stylesheet" href="assets/css/app.css">
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
			<ul class="am-nav am-nav-pills am-topbar-nav">
				<li class="am-active"><a href="homePage.jsp" style="color: #10D07A;">首页</a></li>
				<li><a href="blogColumn.jsp">博客专栏</a></li>
				<li><a href="blogProfessor.jsp">博客专家</a></li>
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

		</div>
	</nav>
	<hr>

	<!-- content srart -->
	<div class="am-g am-g-fixed blog-fixed">
		<!-- 文章内容区 -->
		<div class="am-u-md-8 am-u-sm-12">
			<div id="personArticle"></div>
			<ul class="am-pagination"
				style="width: 100%; text-align: center; margin-top: 30px;" id="myUI"></ul>
		</div>

		<div class="am-u-md-4 am-u-sm-12 blog-sidebar">
			<div class="blog-sidebar-widget blog-bor">
				<h2 class="blog-text-center blog-title">
					<span>About He/She</span>
				</h2>
				<div id="userPersonInfo"></div>
			</div>
			<div class="blog-sidebar-widget blog-bor">
				<h2 class="blog-text-center blog-title">
					<span>Contact He/She</span>
				</h2>
				<p>
					<a ><span
						class="am-icon-qq am-icon-fw am-primary blog-icon"></span></a> <a
						><span class="am-icon-github am-icon-fw blog-icon"></span></a>
					<a ><span class="am-icon-weibo am-icon-fw blog-icon"></span></a>
					<a ><span class="am-icon-reddit am-icon-fw blog-icon"></span></a>
					<a ><span class="am-icon-weixin am-icon-fw blog-icon"></span></a>
				</p>
			</div>
			<div class="blog-clear-margin blog-sidebar-widget blog-bor am-g ">
				<h2 class="blog-title">
					<span>TAG cloud</span>
				</h2>
				<div class="am-u-sm-12 blog-clear-padding">
					<a  class="blog-tag">amaze</a> <a  class="blog-tag">妹纸
						UI</a> <a  class="blog-tag">HTML5</a> <a 
						class="blog-tag">这是标签</a> <a  class="blog-tag">Impossible</a>
					<a  class="blog-tag">开源前端框架</a>
				</div>
			</div>
			<div class="blog-sidebar-widget blog-bor">
				<h2 class="blog-title">
					<span>么么哒</span>
				</h2>
				<ul class="am-list">
					<li><a >每个人都有一个死角， 自己走不出来，别人也闯不进去。</a></li>
					<li><a >我把最深沉的秘密放在那里。</a></li>
					<li><a >你不懂我，我不怪你。</a></li>
					<li><a >每个人都有一道伤口， 或深或浅，盖上布，以为不存在。</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- content end -->
	<footer class="blog-footer">
		<div class="blog-text-center">© 2015 AllMobilize, Inc. Licensed
			under MIT license. Made with love By LWXYFER</div>
	</footer>

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/amazeui.min.js"></script>
	<script type="text/javascript" src="js/moreOperation.js"></script>
	
	<script type="text/javascript">
		var result = $("#top_img").attr("src");
		if(result == ""){
			$("#top_img").attr("src","images/not_pic.jpg");
		}
	
		var usid = "<%=request.getParameter("usid")%>";
		var currPage = 1;
		var pageSize = 5;
		var totalPage;
		
		if(usid != "null"){
			$.post("blog/findUserInfoByUsid",{usid:usid},function(data){
				var userInfoStr = "";
				if(data.upic == null){
					userInfoStr +='<img src="images/not_pic.jpg" class="blog-entry-img">';
				}else{
					userInfoStr +='<img src="'+data.upic+'"  class="blog-entry-img">';
				}
				userInfoStr +='<p>昵称 ：'+data.uname+'</p>';
				userInfoStr +='<p>性别 ：'+data.usex+'</p>';
				userInfoStr +='<p>所在地 ：'+data.uaddress+'</p>';
				userInfoStr +='<p>个人职业 ：'+data.uprofession+'</p>';
				userInfoStr +='<p>个性签名 ：'+data.upersondesc+'</p>';
				
				$("#userPersonInfo").html(userInfoStr);
			},'json');
			
			findUserArticleByUsid();
			listNum();
			
		}
		function findUserArticleByUsid(){
			$.post("article/listById",{currPage:currPage,pageSize:pageSize,usid:usid},function(data){
				var articleStr = "";
				for (var i = 0; i < data.length; i++){
					articleStr +='<article class="am-g blog-entry-article">';
					articleStr +='<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-img">';
					if(data[i].apic !=null){
						articleStr +='<img src="'+data[i].apic+'" alt="" style="height:250px;" class="am-u-sm-12"></div>';
					}else{
						articleStr +='<img src="images/not_img1.png" alt="" style="height:250px;" class="am-u-sm-12"></div>';
					}
					articleStr +='<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-text">';
					articleStr +='<span>author:&nbsp;</span>';
					articleStr +='<span>@<a class="blog-color">'+data[i].uname+'&nbsp;</a></span>';
					articleStr +='<span style="float:right;">'+data[i].atime+'</span>';
					articleStr +='<h1><a onclick="articleDetail('+data[i].aid+')">'+data[i].atitle+'</a></h1>';
					articleStr +='<div class="con_text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+data[i].acontent+'</div>';
					articleStr +='<p><a class="blog-continue">continue reading</a></p>';
					articleStr +='<span class="viewnum f_r"><a style="padding-left:20px;" onclick="articleDetail('+data[i].aid+')">浏览（'+data[i].aviewnum+'）</a></span>';
					articleStr +='<span class="pingl f_r"><a style="padding-left:20px;" onclick="articleDetail('+data[i].aid+')">评论（'+data[i].commentnum+'）</a></span></p>';
					articleStr +='</div></article>';
				}
				$("#personArticle").html(articleStr);
			},"json");
		}
		function listNum(){
			$.post("article/listNum",{usid:usid},function(data){
				var ulStr = "";
				ulStr +="<li ><a onclick='prePage()'>&laquo; Prev</a></li>";
				ulStr +="<li ><a onclick='firstPage()'>首页</a></li>";
				ulStr +="<li><a>"+currPage+"/"+data.totalPage+"</a></li>";
				ulStr +="<li><a>共:"+data.total+"条</a></li>";
				ulStr +="<li ><a onclick='lastPage()'>尾页</a></li>";
				ulStr +="<li ><a onclick='nextPage()'>Next &raquo;</a></li>";
				totalPage = data.totalPage;
				$("#myUI").html(ulStr);
			});
		}
		/* 下一页 */
		function nextPage(){
			if(currPage == totalPage){
				currPage = currPage;
			}else{
				currPage += 1;
				findUserArticleByUsid();
				listNum();

			}
		}
		/* 上一页 */
		function prePage(){
			if(currPage == 1){
				currPage = currPage;
			}else{
				currPage -= 1;
				findUserArticleByUsid();
				listNum();
			}
		}
		/* 首页 */
		function firstPage(){
			currPage = 1;
			findUserArticleByUsid();
			listNum();
		}
		/* 尾页 */
		function lastPage(){
			currPage = totalPage;
			findUserArticleByUsid();
			listNum();
		}

		//文章详情
		function articleDetail(index){
			$.post("article/updateAviewNum",{aid:index},function(data){
				location.href="article.jsp?aid="+index;
			});
		}
	
			
	</script>

</body>
</html>