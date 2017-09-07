/**
 * 在页面上显示个人信息
 */
$.get("blog/showUserInfo",function(data){
	var userInfoStr = "";
	if(data.upic == null){
		userInfoStr +='<img src="images/not_pic.jpg" class="blog-entry-img">';
	}else{
		userInfoStr +='<img src="'+data.upic+'" alt="about me" class="blog-entry-img">';
	}
	if(data.uname == null){
		userInfoStr +='<p>昵称 ：暂无</p>';
	}else{
		userInfoStr +='<p>昵称 ：'+data.uname+'</p>';
	}
	if(data.uprofession == null){
		userInfoStr +='<p>个人职业 ：暂无</p>';
	}else{
		userInfoStr +='<p>个人职业 ：'+data.uprofession+'</p>';
	}
	if(data.upersondesc == null){
		userInfoStr +='<p>个性签名 ：暂无</p>';
	}else{
		userInfoStr +='<p>个性签名 ：'+data.upersondesc+'</p>';
	}
	
	
	$("#userPersonInfo").html(userInfoStr);
},'json');
