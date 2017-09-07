$("#main").tabs({
	fit : true,
	border : false,
});
$("#sideNav").accordion({
	fit : true,
	border : false,
});

$(".treeNav").tree({
	onClick : function(node) { // node是指树节点， node.text是节点文本内容
		var nodeContent = node.text;
		if ($("#main").tabs('exists', nodeContent)) {
			$("#main").tabs('close', nodeContent)
		}
		if (nodeContent == "用户管理") {
			$("#main").tabs('add', {
				title : nodeContent,
				href : "back/user_info.jsp",
				iconCls : "icon-mini-add",
				closable : true,
			});
		} else if (nodeContent == "管理员设置") {
			$("#main").tabs('add', {
				title : nodeContent,
				href : "back/admin_edit.jsp",
				iconCls : "icon-mini-add",
				closable : true,
			});
		} else if (nodeContent == "查询文章") {
			$("#main").tabs('add', {
				title : nodeContent,
				href : "back/article_info.jsp",
				iconCls : "icon-mini-add",
				closable : true,
			});
		} else if (nodeContent == "类型管理") {
			$("#main").tabs('add', {
				title : nodeContent,
				href : "back/type_edit.jsp",
				iconCls : "icon-mini-add",
				closable : true,
			});
		} else if (nodeContent == "类别管理") {
			$("#main").tabs('add', {
				title : nodeContent,
				href : "back/tag_edit.jsp",
				iconCls : "icon-mini-add",
				closable : true,
			});
		} else if (nodeContent == "评论管理") {
			$("#main").tabs('add', {
				title : nodeContent,
				href : "back/comment_edit.jsp",
				iconCls : "icon-mini-add",
				closable : true,
			});
		} else if (nodeContent == "板块管理") {
			$("#main").tabs('add', {
				title : nodeContent,
				href : "back/column_edit.jsp",
				iconCls : "icon-mini-add",
				closable : true,
			});
		} else if (nodeContent == "文章发表排行") {
			$("#main").tabs('add', {
				title : nodeContent,
				href : "back/article_analytics.jsp",
				iconCls : "icon-mini-add",
				closable : true,
			});
		} else if (nodeContent == "文章标签排行") {
			$("#main").tabs('add', {
				title : nodeContent,
				href : "back/tag_analytics.jsp",
				iconCls : "icon-mini-add",
				closable : true,
			});
		} else {
			$("#main").tabs('add', {
				title : nodeContent,
				content : nodeContent,
				iconCls : "icon-mini-add",
				closable : true,
			});
		}

	}
});

$.extend($.fn.layout.methods, {
	full : function(jq) {
		return jq.each(function() {
			var layout = $(this);
			var center = layout.layout("panel", "center");
			center.panel("maximize");
			center.parent().css("z-index", 10);

			$(window).on("resize.full", function() {
				layout.layout("unFull").layout("resize");
			})
		});
	},
	unfull : function(jq) {
		return jq.each(function() {
			var layout = $(this);
			var center = layout.layout("panel", "center");
			center.parent().css("z-index", "inherit");
			center.panel("restore");
			$(window).off("resize.full");
		});
	}
});

// 验证重复输入的密码是否跟密码相同
$.extend($.fn.validatebox.defaults.rules, {
	equals : {
		validator : function(value, param) {
			return value != $(param[0]).val();
		},
		message : '新密码与原密码相同，请重新输入.'
	},
	equalTo : {
		validator : function(value, param) {
			return value == $(param[0]).val();
		},
		message : '密码不匹配，请重新输入.'
	}
});

$("#personalInfo").dialog({
	title : "密码修改",
	closed : true,
	modal : true,
	border : false,
	closable : false,
});

$('#modifyPwdBtn').linkbutton({
	iconCls : 'icon-ok',
	width : 80,
	onClick : function() {
		$("#modifyPwdForm").submit();
	}
});

$('#closeBtn').linkbutton({
	iconCls : 'icon-cancel',
	width : 80,
	onClick : function() {
		$("#personalInfo").dialog("close");
	}
});

$('#ss').searchbox({
	searcher : function(value, name) {
		alert(value + "," + name)
	},
	prompt : '请输入要查找的内容'
});

$("#modifyPwdForm").form(
		{
			url : "admin/modifyPwd",
			success : function(data) {
				if (data) {
					$("#personalInfo").dialog("close"); // 关闭修改框
					$("#modifyPwdForm").form('clear');
					$.messager.show({
						msg : '修改密码成功！！！',
						showType : 'show',
						style : {
							top : document.body.scrollTop
									+ document.documentElement.scrollTop,
						}
					});
				} else {
					$.messager.show({
						title : '修改密码',
						msg : '修改密码失败！！！',
						showType : 'show',
						style : {
							top : document.body.scrollTop
									+ document.documentElement.scrollTop,
						}
					});
				}
			}
		});
function full() {
	$("body").layout("full");
	$("#center_content").addClass("panel-fit");
}

function unfull() {
	$("body").layout("unfull");
}

function reLogin() {
	// 显示重新登录确认框
	$.messager.confirm('', '您是否确定要切换用户吗？', function(r) {
		if (r) {
			// 切换用户操作;
			location.href = "back/admin_login.jsp";
		}
	});
}

function aboutUs() {
	// 显示关于我们的dialog
	$.messager
			.alert(
					'联系我们',
					'<table cellpadding="5"><tr><th>联系人</th><th>手机</th><th>qq</th></tr><tr><td>姜媚</td><td>18473435230</td><td>2576096522</td></tr><tr><td>黄震</td><td>15573483933</td><td>793623923</td></tr><tr><td>袁湘云</td><td>14568541234</td><td>554236522</td></tr></table>',
					'info');
}

function logoutFun() {
	// 显示退出系统确认框
	$.messager.confirm('', '您确定要退出系统吗？', function(r) {
		if (r) {
			$.get("admin/login_out", function(data) {
				location.href = "back/admin_login.jsp";
			});
			/*
			 * // 退出系统操作; location.replace("back/admin_login.jsp");
			 */
		}
	});
}

function userInfoFun() {
	// 显示修改密码框
	$('#personalInfo').dialog('open');
}
