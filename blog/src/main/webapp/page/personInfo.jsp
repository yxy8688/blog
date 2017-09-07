<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<base href="${deployName}">
<meta charset="utf-8">
<title>个人信息</title>
<link rel="icon" type="image/png" href="assets/i/favicon.png">
<link rel="stylesheet" href="assets/css/amazeui.min.css">
<link rel="stylesheet" href="assets/css/app.css">
<link rel="stylesheet" href="css/personInfo.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
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
				<li><a href="page/blog_add.jsp">写新文章</a></li>
				<li><a href="page/blogManager.jsp">文章管理</a></li>
				<li><a href="page/blog_tag.jsp">类别管理</a></li>
				<li><a href="page/blogComment.jsp">评论管理</a></li>
				<li><a href="page/blogDrafets.jsp">草稿箱</a></li>
				<li><a href="page/personInfo.jsp" style="color: #10D07A;">个人信息管理</a></li>
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
	<div class="am-g am-g-fixed blog-fixed" style="margin-top:1%;">
		<div class="easyui-layout" style="width: 100%; height:800px; margin: 0px auto">
			<div data-options="region:'west',collapsible:false, border:false"
				title="个人信息" style="width: 180px;">
				<div id="tag_userinfo" style="height: 100%; border-right: 20px solid #EAF2FF; padding-left: 20px;">
					<ul>
						<li>
							<a href="page/personInfo.jsp">基本信息</a>
						</li>
						<li>
							<a href="page/personInfo_pwd.jsp">密码修改</a>
						</li>
					</ul>
						
				</div>
			</div>
			
			<div data-options="region:'center', fit:true, border:false">
			 	<div id="contentBox">
					<form id="form_img" name="form_img" method="post" enctype="multipart/form-data">
						<ul>
							<li>
								<label>头 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;像：</label> 
								<img src="images/not_pic.jpg" id="upic" width="150" height="150" > <!--圆形样式 style=" border-radius:50%;" -->
								<input id="upicPath" type="file" name="upicDate" onchange="chgPic(this)"/>
								 <button type="button" id="camera" onclick="open_camera()">摄像头</button> 
								<button type="submit" style="margin-top:10px;" id="pic_submit" onclick="upload_img()">上传图片</button>
							</li>
						</ul>
					</form>
					<form id="myform" name="myform">	
						<ul>	
							<li>
								<label>昵 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</label> 
								<input id="uname" type="text" name="uname" placeholder="请输入你的个人昵称" onBlur="show1(this)"/>
								<span id="span1" style="margin-left:30px;color:red;padding-left:30px;"></span>
							</li>
							<li>
								<label>性 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label> 
								<input type="radio" id="usex1" name="usex" class="rad1" value="男" onClick="ck()"/>男 
								<input type="radio" id="usex2" name="usex" class="rad2" value="女" onClick="ck2()"/>女
							</li>
							<li>
								<label>出生日期：</label> 
								 <input class="easyui-datebox" name="ubirthday" id="ubirthday" data-options="formatter:myformatter,parser:myparser"></input>
							</li>
							
							<li>
								<label>联系方式：</label> 
								<input class="easyui-textbox"  name="uphone" id="uphone" data-options="prompt:'请输入正确的手机号码。',validType:'phoneNum'"/>
							</li>
							<li>
								<label>所 &nbsp;在 &nbsp;地：</label> 
								<select id="selProvince">
									<option value="0" id="selProvince_op">--请选择省份--</option>
								</select> 
								<select id="selCity">
									<option value="0" id="selCity_op">--请选择城市--</option>
								</select> 
								<select id="selDistrict">
									<option value="0" id="selDistrict_op">--请选择区/县--</option>
								</select>
							</li>
							<li>
								<label>擅长职业：</label> 
								<input id="uprofession" name="uprofession" onBlur="show2(this)">
								<span id="span2" style="margin-left:30px;color:red;padding-left:30px;"></span>
							</li>
							<li>
								<label>个性签名：</label> 
								<textarea id="upersondesc" rows="4" cols="45" style="resize:none; overflow: scroll;" onBlur="show3(this)"></textarea>
								<span id="span3" style="margin-left:30px;color:red;padding-left:30px;"></span>
							</li>
						</ul>
							<button class="button_reset" type="reset">取消</button>
							<button class="button_submit" type="button" onclick="updata_userInfo()">保存</button>
					</form>
				</div> 
			</div>
		</div>
	</div>
	<!-- content end -->
	<footer class="blog-footer">
		<div class="blog-text-center">© 2015 AllMobilize, Inc. Licensed
			under MIT license. Made with love By LWXYFER</div>
	</footer>

	<script src="js/CityJson.js" type="text/javascript"></script>
	<script src="js/ProJson.js" type="text/javascript"></script>
	<script src="js/DistrictJson.js" type="text/javascript"></script>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/personInfo.js"></script>
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
	
	function open_camera(){
		location.href="page/camera.jsp";
	}
	
	function upload_img(){
		$("#form_img").form({
			url:"blog/update_img",    
		    success:function(data){ 
		    	if(data.trim() == "true"){
		    		 location.reload();
		    	}else{
		    		$.messager.show({
		    			title:'修改信息',
		    			msg:'上传失败！！！',
		    			timeout:1000,  
		    			showType:'slide',
		    			style:{
		    				top:document.body.scrollTop+document.documentElement.scrollTop,
		    			}
		    		});
		    	}
		    } 
		});
	}
	
	/* 验证 */
	function show1(obj){
			 	var str = $("#uname").val();
				var getBLen= str.replace(/[^\x00-\xff]/g,"ab").length;
				if(getBLen >30){
					$("#span1").html("昵称超出限制，在此不允许超过30个字符...");
					$("#span1").css("background","url(images/onError.gif) no-repeat left center");
				}else{
					$("#span1").html("");
					$("#span1").css("background","");
				}
	    } 
	function show2(obj){
	 	var str = $("#uprofession").val();
		var getBLen= str.replace(/[^\x00-\xff]/g,"ab").length;
		if(getBLen >40){
			$("#span2").html("内容不得超过40个字符...");
			$("#span2").css("background","url(images/onError.gif) no-repeat left center");
		}else{
			$("#span2").html("");
			$("#span2").css("background","");
		}
	} 
	function show3(obj){
	 	var str = $("#upersondesc").val();
		var getBLen= str.replace(/[^\x00-\xff]/g,"ab").length;
		if(getBLen >200){
			$("#span3").html("内容不得超过200个字符...");
			$("#span3").css("background","url(images/onError.gif) no-repeat left center");
		}else{
			$("#span3").html("");
			$("#span3").css("background","");
		}
	} 
	</script>
</body>
</html>