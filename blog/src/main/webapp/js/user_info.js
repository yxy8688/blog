$("#userList")
		.datagrid(
				{
					url : "blog/list",
					pagination : true,
					rownumbers : true,
					fit : true,
					border : false,
					fitColumns : true,
					singleSelect : true,
					remoteSort : false,
					multiSort : true,
					toolbar : '#userinfo',
					pageList : [ 5, 10, 15, 20, 25, 30 ],
					columns : [ [
							{
								field : 'usid',
								title : '编号',
								width : 80,
								align : 'center',
								sortable : true
							},
							{
								field : 'uemail',
								title : '邮箱',
								width : 100,
								align : 'center'
							},
							{
								field : 'uname',
								title : '姓名',
								width : 100,
								align : 'center',
								sortable : true
							},
							{
								field : 'usex',
								title : '性别',
								width : 50,
								align : 'center',
								sortable : true
							},
							{
								field : 'ubirthday',
								title : '生日',
								width : 80,
								align : 'center'
							},
							{
								field : 'uaddress',
								title : '地址',
								width : 100,
								align : 'center',
								sortable : true
							},
							{
								field : 'uphone',
								title : '电话',
								width : 100,
								align : 'center'
							},
							{
								field : 'uprofession',
								title : '职业背景',
								width : 80,
								align : 'center'
							},
							{
								field : 'upersondesc',
								title : '个人描述',
								width : 100,
								align : 'center'
							},
							{
								field : 'upic',
								title : '用户图像',
								width : 100,
								align : 'center',
								formatter : function(value, row, index) {
									if (value == null) {
										return "<img width='100' height='100' src='images/not_pic.jpg'/>"
									} else {
										return "<img width='100' src='" + value
												+ "'/>"
									}
								}
							},
							{
								field : 'opr',
								title : '操作',
								width : 100,
								align : 'center',
								formatter : function(value, row, index) {
									var oprStr = '<a class="detailBtn" href="javascript:void(0)" onclick="openDatail('
											+ index
											+ ')">详情</a>'
											+ '<script>$(".detailBtn").linkbutton({iconCls: "icon-search"})</script>';
									return oprStr;
								}
							} ] ]
				});

// 条件查询
$('#uinfo1')
		.combobox(
				{
					editable : false,
					valueField : 'uinfo1',
					textField : 'infotext',
					data : [ {
						uinfo1 : 'all',
						infotext : '查询全部用户'
					}, {
						uinfo1 : 'uemail',
						infotext : '按邮箱查询'
					}, {
						uinfo1 : 'uname',
						infotext : '按用户名查询'
					} ],
					onSelect : function(record) {
						$
								.get(
										'blog?uinfo1=' + record.uinfo1,
										function(data) {
											if (record.uinfo1.trim() == 'all') {
												$('#uinfo2').combobox({
													disabled : true,
												});
												url = "blog/list"
												// alert("ALL提交前的url:" + url);
												$("#userList").datagrid(
														"reload", url);
											} else {
												_time_out = null;
												// alert(JSON.stringify(data));
												$("#uinfo2")
														.combobox(
																{
																	disabled : false,
																	valueField : record.uinfo1,
																	textField : record.uinfo1,
																	editable : true,
																	mode : 'remote',
																	data : data,
																	required : true,
																	keyHandler : {
																		query : function(
																				q) {
																			if (_time_out) {
																				clearTimeout(_time_out);
																			}
																			_time_out = setTimeout(
																					function() {
																						var opts = $(
																								"#uinfo2")
																								.combobox(
																										'options');
																						var data = $(
																								"#uinfo2")
																								.combobox(
																										'getData');

																						// alert(JSON.stringify(name));
																						var value = $(
																								"#uinfo2")
																								.combobox(
																										'textbox')
																								.val();
																						// alert(",
																						// value:"+
																						// value);
																						$
																								.each(
																										data,
																										function(
																												k,
																												node) {
																											if (node[opts.textField]
																													.indexOf(value) >= 0) {
																												var item = $(
																														"#uinfo2")
																														.combobox(
																																'panel')
																														.panel(
																																'body')
																														.find(
																																'div')
																														.filter(
																																function() {
																																	return $(
																																			this)
																																			.html() == node[opts.textField];
																																});
																												if (item) {
																													clearTimeout(_time_out);
																													_time_out = null;
																													$(
																															"#uinfo2")
																															.combobox(
																																	'panel')
																															.panel(
																																	'body')
																															.scrollTop(
																																	item
																																			.position().top);
																													$(
																															"#uinfo2")
																															.combobox(
																																	'select',
																																	node[opts.valueField]);
																													return false;
																												}
																											}
																										});
																						clearTimeout(_time_out);
																						_time_out = null;
																					},
																					500);
																		}
																	}

																}).combobox(
																'clear');
											}
										}, "json");
					}
				});
$('#uinfo2').combobox({
	disabled : true
});

// 关闭按钮
$(".closeBtn").linkbutton({
	iconCls : "icon-cancel",
	onClick : function() {
		$("#modifyUser").dialog("close");
		$("#detailsUser").dialog("close");
	}
});
// 修改提交按钮
$(".updateBtn").linkbutton({
	iconCls : "icon-ok",
	onClick : function() {
		$("#modifyForm").submit();
	}
});
// 更新按钮
$(".updBtn").linkbutton({
	iconCls : "icon-reload",
	onClick : function() {
		$("#userList").datagrid("reload");
	}
});
// 查询按钮
$(".searchBtn").linkbutton({
	iconCls : "icon-search",
	onClick : function() {
		var name = $("#uinfo1").combobox('getValues');
		// alert(JSON.stringify(name));
		var param = $("#uinfo2").combobox('getValues');
		// alert("参数" + param);
		if (param != null) {
			url = "blog/findByParam?name=" + name + "&param=" + param;
			// alert("条件查询的URL" + url);
			$("#userList").datagrid("reload", url);
		}

	}
});

$("#detailsUser").dialog({
	title : "用户详情",
	closed : true,
	modal : true,
});

function openDatail(index) {
	$("#detailsUser").dialog("open");
	var row = $("#userList").datagrid("getRows")[index];
	$("#dname").html(row.uname);
	$("#demail").html(row.uemail);
	$("#dbirthday").html(row.ubirthday);
	$("#dgender").html(row.usex);
	$("#dprofession").html(row.uprofession);
	$("#dpersondesc").html(row.upersondesc);
	$("#daddress").html(row.uaddress);
	$("#dmobile").html(row.uphone);
	if (row.upic) {
		$("#dpic").attr("src", row.upic);
	} else {
		$("#dpic").attr("src", "images/not_pic.jpg");
	}
}

function chgPic(obj) {
	$("#upic").attr("src", window.URL.createObjectURL(obj.files[0]));
}