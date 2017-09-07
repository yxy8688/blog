<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>标签排行</title>
</head>
<body>
<div id="container11" style="min-width:400px;height:400px"></div>
<div class="message"></div>

<script type="text/javascript">
var jsonXData = [];
var jsonyD1 = [];
show11();
function show11() {
    // 获取 CSV 数据并初始化图表
    $.ajax({ 
		url:"tag/analytics",
		type:"POST",
		dataType:"JSON",
		success: function (data) {
			for(var i=0;i<data.length;i++){
				var tagname=data[i].tagname;
				var Num = data[i].articlenum;
				jsonXData.push(tagname); //赋值
				jsonyD1.push(Num);
			}
        $('#container11').highcharts({
            title: {
                text: '标签数量排行'
            },
            xAxis: {
            	categories: jsonXData,
				lineWidth: 2,
                gridLineWidth: 1,
                title: {
                    text: "标签名称"
                },
                labels: {
                    align: 'left',
                    x: 3,
                    y: -3
                }
            },
            yAxis: [{ // 第一个 Y 轴，放置在左边（默认在坐标）
                title: {
                    text: "文章数/篇"
                },
                labels: {
                    align: 'left',
                    x: 3,
                    y: 16,
                },
                showFirstLabel: false
            }, {    // 第二个坐标轴，放置在右边
                linkedTo: 0,
                gridLineWidth: 0,
                opposite: true,  // 通过此参数设置坐标轴显示在对立面
                title: {
                	text: "文章数/篇"
                },
                labels: {
                    align: 'right',
                    x: -3,
                    y: 16,
                },
                showFirstLabel: false
            }],
            legend: {
                align: 'left',
                verticalAlign: 'top',
                y: 20,
                floating: true,
                borderWidth: 0
            },
            tooltip: {
                shared: true,
                crosshairs: true,
                formatter: function () {
					return '标签名:' + this.x + '</b><br/>文章数: ' + this.y;
				}
            },
            plotOptions: {
                series: {
                    cursor: 'pointer',
                    point: {
                        events: {
                            // 数据点点击事件
                            // 其中 e 变量为事件对象，this 为当前数据点对象
                            click: function (e) {
                            	alert(JSON.stringify(e));
                                $('.message').html( '标签名:' + this.x + '</b><br/>文章数: ' + this.y);
                            }
                        }
                    },
                    marker: {
                        lineWidth: 1
                    }
                }
            },
            series: [{
				name: '文章数',
				data: jsonyD1
			}]
        });
    }});
}

</script>

</body>
</html>