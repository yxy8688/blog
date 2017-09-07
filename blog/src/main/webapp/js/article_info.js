$("#articleList")
		.datagrid(
				{
					url : "article/list",
					pagination : true,
					rownumbers : true,
					fit : true,
					border : false,
					fitColumns : true,
					singleSelect : true,
					pageList : [ 5, 10, 15, 20, 25, 30 ],
					toolbar : '#article',
					columns : [ [
							{
								field : 'atitle',
								title : '文章标题',
								width : 100,
								align : 'center'
							},
							{
								field : 'tname',
								title : '文章类型',
								width : 60,
								align : 'center'
							},
							{
								field : 'tagname',
								title : '文章标签',
								width : 60,
								align : 'center'
							},
							{
								field : 'uname',
								title : '文章作者',
								width : 100,
								align : 'center'
							},
							{
								field : 'atime',
								title : '创作时间',
								width : 110,
								align : 'center'
							},
							{
								field : 'aviewnum',
								title : '浏览量',
								width : 50,
								align : 'center'
							},
							{
								field : 'commentnum',
								title : '评论数',
								width : 50,
								align : 'center'
							},
							{
								field : 'apic',
								title : '文章图片',
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
											+ ')">详情</a>&nbsp;&nbsp;'
											+ '<a class="removeBtn" href="javascript:void(0)" onclick="deleteDate('
											+ index
											+ ')">删除</a>'
											+ '<script>$(".detailBtn").linkbutton({iconCls: "icon-search"});'
											+ '$(".removeBtn").linkbutton({iconCls: "icon-remove"});</script>';
									return oprStr;
								}
							} ] ]
				});
$('#mkid')
		.combobox(
				{
					editable : false,
					valueField : 'mkid',
					textField : 'mkmch',
					data : [ {
						mkid : 'all',
						mkmch : '查询全部'
					}, {
						mkid : 'tname',
						mkmch : '按文章类型查询'
					}, {
						mkid : 'uname',
						mkmch : '按用户名查询'
					}, {
						mkid : 'tagname',
						mkmch : '按文章标签查询'
					} , {
						mkid : 'cotitle',
						mkmch : '按板块标题查询'
					}],
					onSelect : function(record) {
						$
								.get(
										'article?mkid=' + record.mkid,
										function(data) {
											if (record.mkid.trim() == 'all') {
												$('#zhbid').combobox({
													disabled : true,
												});
												url = "article/list"
												// alert("ALL提交前的url:" + url);
												$("#articleList").datagrid(
														"reload", url);
											} else {
												_time_out = null;
												//alert(JSON.stringify(data));
												$("#zhbid")
														.combobox(
																{
																	disabled : false,
																	valueField : record.mkid,
																	textField : record.mkid,
																	editable : true,
																	mode : 'remote',
																	data : data,
																	keyHandler : {
																		query : function(
																				q) {
																			if (_time_out) {
																				clearTimeout(_time_out);
																			}
																			_time_out = setTimeout(
																					function() {
																						var opts = $(
																								"#zhbid")
																								.combobox(
																										'options');
																						var data = $(
																								"#zhbid")
																								.combobox(
																										'getData');

																						// alert(JSON.stringify(name));
																						var value = $(
																								"#zhbid")
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
																														"#zhbid")
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
																															"#zhbid")
																															.combobox(
																																	'panel')
																															.panel(
																																	'body')
																															.scrollTop(
																																	item
																																			.position().top);
																													$(
																															"#zhbid")
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
$('#zhbid').combobox({
	disabled : true
});

$(".closeBtn").linkbutton({
	iconCls : "icon-cancel",
	onClick : function() {
		$("#detailsArticle").dialog("close");
	}
});
$(".searchBtn").linkbutton({
	iconCls : "icon-search",
	onClick : function() {
		var name = $("#mkid").combobox('getValues');
		// alert(JSON.stringify(name));
		var param = $("#zhbid").combobox('getValues');
		// alert("参数" + param);
		url = "article/findByParam?name=" + name + "&param=" + param;
		// alert("条件查询的URL" + url);
		$("#articleList").datagrid("reload", url);
	}
});

function deleteDate(index) {
	// 删除时先获取选择行
	var row = $("#articleList").datagrid("getRows")[index];

	var aid = row.aid;
	// 选择要删除的行
	$.messager.confirm("提示", "你确定要删除吗?", function(r) {
		if (r) {
			$.post("article/delete", {
				aid : aid
			}, function(data) {
				if (data > 0) {
					$("#articleList").datagrid("reload"); // 刷新修改数据
				} else {
					alert("删除失败失败");
				}
			});
			// 将选择到的行存入数组并用,分隔转换成字符串，
			// 本例只是前台操作没有与数据库进行交互所以此处只是弹出要传入后台的id
		}
	});
}

$("#detailsArticle").dialog({
	title : "文章详情",
	closed : true,
	modal : true,
});

function openDatail(index) {
	$("#detailsArticle").dialog("open");
	var row = $("#articleList").datagrid("getRows")[index];
	$("#Aaid").html(row.aid);
	$("#Atitle").html(row.atitle);
	$("#Atid").html(row.tname);
	$("#Atagid").html(row.tagname);
	$("#Ausid").html(row.uname);
	$("#Aatime").html(row.atime);
	$("#Aaviewnum").html(row.aviewnum);
	$("#Acommentnum").html(row.commentnum);
	$("#Aacontent").html(htmlEncodeJQ(row.acontent));
	if (row.apic) {
		$("#pic").attr("src", row.apic);
	} else {
		$("#pic").attr("src", "images/not_pic.jpg");
	}
}

//导出Excel
function exportExcel() {
    var rows = $("#articleList").datagrid("getRows");
    for (var i = 0; i < rows.length; i++) {    //进行数据处理
        delete rows[i].articleNum;
        delete rows[i].currPage;
        delete rows[i].pageSize;
        delete rows[i].total;
        delete rows[i].totalPage;
    }
    //替换中文标题
    var a = JSON.stringify(rows).replace(/aid/g, "文章编号").replace(/atitle/g, "文章标题").replace(/tid/g, "类型id").replace(/tname/g, "类型名")
   .replace(/tagid/g, "标签id").replace(/tagname/g, "标签名") .replace(/usid/g, "用户id").replace(/uname/g, "用户名").replace(/atime/g, "文章发表时间").replace(/acontent/g, '文章内容')
   .replace(/apic/g, "图片路径").replace(/aviewnum/g, "浏览量")
   .replace(/commentnum/g, "评论数");
    alert(a);
    var postData = {
        data: a
    };
    
    $.ajax({
    	url : "ExportExcel",
		type : "POST",
		dataType : "JSON",
        data: postData,
        success: function (data) {
            if (data == "1") {
                layer.msg("操作成功,文件在桌面！", {
                    icon: 6,
                    time: 2000,
                });
            } else if (data == "-1") {
                layer.msg("操作失败！", { icon: 2 });
            }
        }
    });
}


//防js注入
function htmlEncodeJQ ( str ) {
	return $('<span/>').text( str ).html();
}
	 
function htmlDecodeJQ ( str ) {
	return $('<span/>').html( str ).text();
}
