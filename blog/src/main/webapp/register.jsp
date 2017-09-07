<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="viewport"  content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <title>注册界面</title>

  <!-- Set render engine for 360 browser -->
  <meta name="renderer" content="webkit">

  <!-- No Baidu Siteapp-->
  <meta http-equiv="Cache-Control" content="no-siteapp"/>

  <link rel="icon" type="image/png" href="{{assets}}i/favicon.png">

  <!-- Add to homescreen for Chrome on Android -->
  <meta name="mobile-web-app-capable" content="yes">
  <link rel="icon" sizes="192x192" href="{{assets}}i/app-icon72x72@2x.png">

  <!-- Add to homescreen for Safari on iOS -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">

  <!-- Tile icon for Win8 (144x144 + tile color) -->
  <meta name="msapplication-TileImage" content="assets/i/app-icon72x72@2x.png">
  <meta name="msapplication-TileColor" content="#0e90d2">

  <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
  <!--
  <link rel="canonical" href="http://www.example.com/">
  -->

  <link rel="stylesheet" href="assets/css/amazeui.min.css">
  <link rel="stylesheet" href="assets/css/app.css">
</head>
<body>
<header>
  <div class="log-header">
      <h1><a href="/">Acosta Blog</a> </h1>
  </div>    
  <div class="log-re">
    <button type="button" class="am-btn am-btn-default am-radius log-button" onClick="login()">登 录</button>
  </div> 
</header>

<div class="log"> 
  <div class="am-g">
  <div class="am-u-lg-3 am-u-md-6 am-u-sm-8 am-u-sm-centered log-content">
    <h1 class="log-title am-animation-slide-top">Acosta Blog</h1>
    <br>
    <form class="am-form" id="log-form" onsubmit="return false">
      <div class="am-input-group am-radius am-animation-slide-left"> 
    
        <input type="email" id="doc-vld-email-2-1" name="uemail" class="am-radius" data-validation-message="请输入正确邮箱地址" placeholder="邮箱" required/>
        <span class="am-input-group-label log-icon am-radius"><i class="am-icon-user am-icon-sm am-icon-fw"></i></span>
      </div>
      <br>
      <div class="am-input-group am-animation-slide-left log-animation-delay">       
        <input type="password" id="log-password" name="upassword" class="am-form-field am-radius log-input" placeholder="密码" minlength="1" required>
        <span class="am-input-group-label log-icon am-radius"><i class="am-icon-lock am-icon-sm am-icon-fw"></i></span>
      </div>
      <br>   
      <div class="am-input-group am-animation-slide-left log-animation-delay-a">       
        <input type="password" data-equal-to="#log-password" class="am-form-field am-radius log-input" placeholder="确认密码" data-validation-message="请确认密码一致" required>
        <span class="am-input-group-label log-icon am-radius"><i class="am-icon-lock am-icon-sm am-icon-fw"></i></span>
      </div>
      <br>
      <div class="am-input-group am-animation-slide-left log-animation-delay-c">
        <input type="text" id="yzm" name="yzm" class="yzm" style="float:left;width:50%;" data-validation-message="请输入验证码" placeholder="验证码" required/>
    	<button type="button" id="yzmbutton" class="yzmbutton" onClick="getYZM()">点击获取验证码</button>
      </div>

      <br>
      <button type="button" class="am-btn am-btn-primary am-btn-block am-btn-lg am-radius am-animation-slide-bottom log-animation-delay-b" onClick="register()">注 册</button>
      <br>
    </form>
  </div>
  </div>
  <footer class="log-footer">   
    © 2014 AllMobilize, Inc. Licensed under MIT license.
  </footer>
</div>



<!--[if (gte IE 9)|!(IE)]><!-->
<script src="assets/js/jquery.min.js"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>

<script type="text/javascript">

	function login(){
		window.location.href='login.jsp';
	}
	
	var countdown=0; 
	function getYZM(){
		countdown = 60;
		var uemail=$.trim($("#doc-vld-email-2-1").val());
		var random ;
		if(uemail == null || uemail==""){
			alert("请输入邮箱号");
		}else{
			$.ajax({
				url:'sendEmail/user',
				type:'GET',
				data:{uemail:uemail},
				contentType:'application/json;charset=UTF-8',
				success:function(data){
					random = data;
					settime();
				}
			});
		}

		$("#yzm").focusout(function(){
			var yzmvalue = $.trim($("#yzm").val());
			if(yzmvalue !=null && yzmvalue != random){
				alert("验证码错误,请重新输入");
				$("#yzm").val("");
			}
		});
	}
/* 	$("#yzm").focusout(function(){
		$("#yzmbutton").attr("disabled", "disabled"); 
	}); */
	function settime(){
		
		  if(countdown == 0){
			$("#yzmbutton").removeAttr("disabled");
			$("#yzmbutton").text("点击获取验证码"); 
		}else { 
			$("#yzmbutton").attr("disabled", "disabled"); 
			$("#yzmbutton").text("重新发送(" + countdown + ")s"); 
			countdown--; 
			} 
			setTimeout(function() { 
			settime() 
			},1000); 
	}
	
	function register(){
	
		var uemail=$.trim($("#doc-vld-email-2-1").val());
		var upassword=$.trim($("#log-password").val());
		if(uemail==""){
			return false;
		}
		if(upassword==""){
			return false;
		}
		$.post("blog/register",{uemail:uemail,upassword:upassword},function(data){
			if(data > 0){
				alert("注册成功,请登录...");
				location.href="login.jsp"; 
			}else{
				alert("注册失败，请重新注册");
				location.href="register.jsp";
			}
		});
		return false;
	}
	
	
	
</script>
</body>
</html>