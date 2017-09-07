<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>	
<link rel="stylesheet" type="text/css" href="jquerySelect/css/jquery.multiselect.css"/>
<link rel="stylesheet" type="text/css" href="jquerySelect/css/jquery-ui.css" />
<script type="text/javascript" src="jquerySelect/js/jquery.1.7.2.min.js"></script>
<script type="text/javascript" src="jquerySelect/js/jquery-ui.min.js"></script>
<script type="text/JavaScript" src="jquerySelect/js/jquery.multiselect.js"></script>
</head>

<body>

<select id="example" name="example" multiple="multiple" style="width:400px" onchange="showValues()">
<option value="1">Option 1</option>
<option value="2">Option 2</option>
<option value="3">Option 3</option>
<option value="4">Option 4</option>
<option value="5">Option 5</option>
<option value="6">Option 6</option>
<option value="7">Option 7</option>
</select>
<input type="text" id="hfexample" />
<input type="button" value="ok" id="btnok">

<script type="text/javascript">
$(function(){
	$("#example").multiselect({
 		height: 200,
		minWidth: 200,
		noneSelectedText: "==请选择==",
		checkAllText: "全选",
	uncheckAllText: '全不选',
	selectedList: 10,
	});
});
//获取选中下拉项的值
function showValues() {
var array_of_checked_values = $("select").multiselect("getChecked").map(function(){
return this.value;
}).get();
$("#hfexample").val(array_of_checked_values);
4 }

	
    //获取选中项	
	$("#btnok").click(function(){
		var ids=[];
		$("#example :checked").each(function(i,item){
			ids.push($(item).attr("value"));
		});	
		alert(ids.join(","))
	});
</script>
</body>
</html>