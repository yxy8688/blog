$("#adminList")
		.datagrid(
				{
					url : "admin/list",
					pagination : true,
					rownumbers:true,
					fit : true,
					border : false,
					fitColumns : true,
					singleSelect : true,
					remoteSort:false,
					multiSort:true,
					pageList : [ 5, 10, 15, 20, 25, 30 ],
					toolbar : '#admin',
					idField : 'adid',
					columns : [ [
							{
								field : 'adid',
								title : '编号',
								width : 100,
								align : 'center',
								sortable : true
							},
							{
								field : 'adname',
								title : '用户名',
								width : 100,
								align : 'center',
								sortable : true
							},
							{
								field : 'adpassword',
								title : '密码',
								width : 100,
								align : 'center'
							},
							{
								field : 'admail',
								title : '邮箱',
								width : 100,
								align : 'center'
							},
							{
								field : 'opr',
								title : '操作',
								width : 100,
								align : 'center',
								formatter : function(value, row, index) {
									var oprStr = '<a class="modifyBtn" href="javascript:void(0)" onclick="openUpdate('
											+ index
											+ ')">修改</a>'
											+ '<a class="removeBtn" href="javascript:void(0)"onclick="deleteDate('
											+ index
											+ ')">删除</a>'
											+ '<script>$(".removeBtn").linkbutton({iconCls: "icon-remove"});'
											+ '$(".modifyBtn").linkbutton({iconCls: "icon-edit"});</script>';
									return oprStr;
								}
							} ] ]
				});

$("#modifyAdmin").dialog({
	title : "管理员修改",
	closed : true,
	modal : true,
});
$("#addAdmin").dialog({
	title : "管理员添加",
	closed : true,
	modal : true,
	
});

function deleteDate(index) {

	// 删除时先获取选择行
	var row = $("#adminList").datagrid("getRows")[index];
	var adid = row.adid;
	// 选择要删除的行
	$.messager.confirm("提示", "你确定要删除吗?", function(r) {
		if (r) {
			$.post("admin/delete", {
				adid : adid
			}, function(data) {
				if (data > 0) {
					$("#adminList").datagrid("reload"); // 刷新修改数据
				} else {
					$.messager.show({
						msg : '删除失败！！！',
						showType : 'show',
						style : {
							top : document.body.scrollTop
									+ document.documentElement.scrollTop,
						}
					});
				}
			});
			// 将选择到的行存入数组并用,分隔转换成字符串，
			// 本例只是前台操作没有与数据库进行交互所以此处只是弹出要传入后台的id
		}
	});
}

$("#modifyAdminForm").form(
		{
			url : "admin/modify",
			success : function(data) {
				if (data.trim()) {
					$("#modifyAdmin").dialog("close"); // 关闭修改框
					$("#adminList").datagrid("reload"); // 刷新修改数据
				} else {
					$.messager.show({
						title : '修改信息',
						msg : '修改失败！！！',
						showType : 'show',
						style : {
							top : document.body.scrollTop
									+ document.documentElement.scrollTop,
						}
					});
				}
			}
		});
$("#addAdminForm").form(
		{
			url : "admin/add",
			success : function(data) {
				if (data.trim() > 0) {
					$("#addAdmin").dialog("close"); // 关闭添加框
					$("#adminList").datagrid("reload"); // 刷新添加数据
				} else {
					$.messager.show({
						title : '添加信息',
						msg : '添加信息失败！！！',
						showType : 'show',
						style : {
							top : document.body.scrollTop
									+ document.documentElement.scrollTop,
						}
					});
				}
			}
		});
$(".closeBtn").linkbutton({
	iconCls : "icon-cancel",
	onClick : function() {
		$("#modifyAdmin").dialog("close");
		$("#addAdmin").dialog("close");

	}
});
$(".addBtn").linkbutton({
	iconCls : "icon-add",
	onClick : function() {
		$("#addAdmin").dialog("open");

	}
});
$(".updBtn").linkbutton({
	iconCls : "icon-reload",
	onClick : function() {
		$("#adminList").datagrid("reload");
	}
});

$(".submitBtn").linkbutton({
	iconCls : "icon-ok",
	onClick : function() {
		$("#addAdminForm").submit();
	}
});
$(".updateBtn").linkbutton({
	iconCls : "icon-ok",
	onClick : function() {
		$("#modifyAdminForm").submit();
	}
});

function openUpdate(index) {
	$("#modifyAdmin").dialog("open");
	var row = $("#adminList").datagrid("getRows")[index];
	$("#aid").val(row.adid);
	$("#aname").val(row.adname);
	$("#apassword").textbox('setValue',row.adpassword);
	$("#amail").val(row.admail);
}
