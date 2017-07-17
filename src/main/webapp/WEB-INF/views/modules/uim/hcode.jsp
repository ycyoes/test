<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html style="height: 100%;">
<head>
<meta name="decorator" content="default"/>
<title>H码数据可视化展示</title>
	<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/dist/echarts.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/dist/extension/dataTool.min.js"></script>
 	<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/china.js"></script>
 	<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/area.js"></script>
	<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/dist/extension/bmap.min.js"></script>
</head>
<body style="height:100%; margin: 0;">
	<div id="container" style="height: 100%;"></div>
<script type="text/javascript">
	wresize();	//設置初始展示div大小
	//alert(geoCoord["七台河"]);
	
	var dom = document.getElementById("container");
	var charts = echarts.init(dom);
	var option = null;
	
var data = [
    {name: "海门", value: 9},
    {name: "鄂尔多斯", value: 12},
    {name: "招远", value: 12},
    {name: "舟山", value: 12},
    {name: "齐齐哈尔", value: 14},
    {name: "盐城", value: 15},
    {name: "赤峰", value: 16},
    {name: "青岛", value: 18},
    {name: "乳山", value: 18},
    {name: "金昌", value: 19},
    {name: "泉州", value: 21},
    {name: "莱西", value: 21},
    {name: "日照", value: 21},
    {name: "胶南", value: 22},
    {name: "南通", value: 23},
    {name: "拉萨", value: 24},
    {name: "云浮", value: 24},
    {name: "梅州", value: 25},
    {name: "文登", value: 25},
    {name: "上海", value: 25},
    {name: "攀枝花", value: 25},
    {name: "威海", value: 25},
    {name: "承德", value: 25},
    {name: "厦门", value: 26},
    {name: "汕尾", value: 26},
    {name: "潮州", value: 26},
    {name: "丹东", value: 27},
    {name: "太仓", value: 27},
    {name: "曲靖", value: 27},
    {name: "烟台", value: 28},
    {name: "福州", value: 29},
    {name: "瓦房店", value: 30},
    {name: "即墨", value: 30},
    {name: "抚顺", value: 31},
    {name: "玉溪", value: 31},
    {name: "张家口", value: 31},
    {name: "阳泉", value: 31},
    {name: "莱州", value: 32},
    {name: "湖州", value: 32},
    {name: "汕头", value: 32},
    {name: "昆山", value: 33},
    {name: "宁波", value: 33},
    {name: "湛江", value: 33},
    {name: "揭阳", value: 34},
    {name: "荣成", value: 34},
    {name: "连云港", value: 35},
    {name: "葫芦岛", value: 35},
    {name: "常熟", value: 36},
    {name: "东莞", value: 36},
    {name: "河源", value: 36},
    {name: "淮安", value: 36},
    {name: "泰州", value: 36},
    {name: "南宁", value: 37},
    {name: "营口", value: 37},
    {name: "惠州", value: 37},
    {name: "江阴", value: 37},
    {name: "蓬莱", value: 37},
    {name: "韶关", value: 38},
    {name: "嘉峪关", value: 38},
    {name: "广州", value: 38},
    {name: "延安", value: 38},
    {name: "太原", value: 39},
    {name: "清远", value: 39},
    {name: "中山", value: 39},
    {name: "昆明", value: 39},
    {name: "寿光", value: 40},
    {name: "盘锦", value: 40},
    {name: "长治", value: 41},
    {name: "深圳", value: 41},
    {name: "珠海", value: 42},
    {name: "宿迁", value: 43},
    {name: "咸阳", value: 43},
    {name: "铜川", value: 44},
    {name: "平度", value: 44},
    {name: "佛山", value: 44},
    {name: "海口", value: 44},
    {name: "江门", value: 45},
    {name: "章丘", value: 45},
    {name: "肇庆", value: 46},
    {name: "大连", value: 47},
    {name: "临汾", value: 47},
    {name: "吴江", value: 47},
    {name: "石嘴山", value: 49},
    {name: "沈阳", value: 50},
    {name: "苏州", value: 50},
    {name: "茂名", value: 50},
    {name: "嘉兴", value: 51},
    {name: "长春", value: 51},
    {name: "胶州", value: 52},
    {name: "银川", value: 52},
    {name: "张家港", value: 52},
    {name: "三门峡", value: 53},
    {name: "锦州", value: 54},
    {name: "南昌", value: 54},
    {name: "柳州", value: 54},
    {name: "三亚", value: 54},
    {name: "自贡", value: 56},
    {name: "吉林", value: 56},
    {name: "阳江", value: 57},
    {name: "泸州", value: 57},
    {name: "西宁", value: 57},
    {name: "宜宾", value: 58},
    {name: "呼和浩特", value: 58},
    {name: "成都", value: 58},
    {name: "大同", value: 58},
    {name: "镇江", value: 59},
    {name: "桂林", value: 59},
    {name: "张家界", value: 59},
    {name: "宜兴", value: 59},
    {name: "北海", value: 60},
    {name: "西安", value: 61},
    {name: "金坛", value: 62},
    {name: "东营", value: 62},
    {name: "牡丹江", value: 63},
    {name: "遵义", value: 63},
    {name: "绍兴", value: 63},
    {name: "扬州", value: 64},
    {name: "常州", value: 64},
    {name: "潍坊", value: 65},
    {name: "重庆", value: 66},
    {name: "台州", value: 67},
    {name: "南京", value: 67},
    {name: "滨州", value: 70},
    {name: "贵阳", value: 71},
    {name: "无锡", value: 71},
    {name: "本溪", value: 71},
    {name: "克拉玛依", value: 72},
    {name: "渭南", value: 72},
    {name: "马鞍山", value: 72},
    {name: "宝鸡", value: 72},
    {name: "焦作", value: 75},
    {name: "句容", value: 75},
    {name: "北京", value: 79},
    {name: "徐州", value: 79},
    {name: "衡水", value: 80},
    {name: "包头", value: 80},
    {name: "绵阳", value: 80},
    {name: "乌鲁木齐", value: 84},
    {name: "枣庄", value: 84},
    {name: "杭州", value: 84},
    {name: "淄博", value: 85},
    {name: "鞍山", value: 86},
    {name: "溧阳", value: 86},
    {name: "库尔勒", value: 86},
    {name: "安阳", value: 90},
    {name: "开封", value: 90},
    {name: "济南", value: 92},
    {name: "德阳", value: 93},
    {name: "温州", value: 95},
    {name: "九江", value: 96},
    {name: "邯郸", value: 98},
    {name: "临安", value: 99},
    {name: "兰州", value: 99},
    {name: "沧州", value: 100},
    {name: "临沂", value: 103},
    {name: "南充", value: 104},
    {name: "天津", value: 105},
    {name: "富阳", value: 106},
    {name: "泰安", value: 112},
    {name: "诸暨", value: 112},
    {name: "郑州", value: 113},
    {name: "哈尔滨", value: 114},
    {name: "聊城", value: 116},
    {name: "芜湖", value: 117},
    {name: "唐山", value: 119},
    {name: "平顶山", value: 119},
    {name: "邢台", value: 119},
    {name: "德州", value: 120},
    {name: "济宁", value: 120},
    {name: "荆州", value: 127},
    {name: "宜昌", value: 130},
    {name: "义乌", value: 132},
    {name: "丽水", value: 133},
    {name: "洛阳", value: 134},
    {name: "秦皇岛", value: 136},
    {name: "株洲", value: 143},
    {name: "石家庄", value: 147},
    {name: "莱芜", value: 148},
    {name: "常德", value: 152},
    {name: "保定", value: 153},
    {name: "湘潭", value: 154},
    {name: "金华", value: 157},
    {name: "岳阳", value: 169},
    {name: "长沙", value: 175},
    {name: "衢州", value: 177},
    {name: "廊坊", value: 193},
    {name: "菏泽", value: 194},
    {name: "合肥", value: 229},
    {name: "武汉", value: 273},
    {name: "大庆", value: 279}
];

	var convertData = function(data) {
		var res = [];
		for (var i = 0; i < data.length; i++)
		{
			var geoCoord = geoCoords[data[i].name];
			if (geoCoord)
			{
				res.push({
					name: data[i].name,
					value: geoCoord.concat(data[i].value)
				});
			}
		}
		return res;
	};

	var convertedData = [
		convertData(data),
		convertData(data.sort(function(a, b) {
			return b.value - a.value;
		}).slice(0, 6))
	];

	option = {
		backgroundColor: "#404a59",
		animation: true,
		animationDuration: 1000,
		animationEasing: "cubicInOut",
		animationDurationUpdate: 1000,
		animationEasingUpdate: "cubicInOut",
		title: [
			{
				text: "H码数据可视化展示",
				left: "left",
				textStyle: {
					color: "#fff"
				}
			},
			{	
				id: "statistic",
				right: 120,
				top: 40,
				width: 100,
				textStyle: {
					color: "#fff",
					fontSize: 16
				}
			}
		],
		toolbox: {
			iconStyle: {
				normal: {
					borderColor: "#fff"
				},
				emphasis: {
					borderColor: "#b1e4ff"
				}
			}
		},
		brush: {
			outOfBrush: {
				color: "#abc"
			},
			brushStyle: {
				borderWidth: 2,
				color: "rgba(0,0,0,0.2)",
				borderColor: "rgba(0,0,0, 0.5)"
			},
			seriesIndex: [0, 1],
			throttleType: "debounce",
			throttleDelay: 300,
			geoIndex: 0
		},
		geo: {
			map: "china",
			left: "12%",
			right: "25%",
			center: [113.65,34.76],
			zoom: 0.9,
			label: {
				emphasis: {
					show: false
				}
			},
			roam: true,
			itemStyle: {
				normal: {
					areaColor: "#323c48",
					borderColor: "#111"
				},
				emphasis: {
					areaColor: "#2a333d"
				}
			}
		},
		tooltip: {
			trigger: "item"
		},
		grid: {
			right: 40,
			top: 100,
			bottom: 40,
			width: "30%"
		},
		xAxis: {
			type: "value",
			scale: true,
			position: "top",
			boundaryGap: false,
			splitLine: {show: false},
			axisLine: { show: false},
			axisTick: { show: false},
			axisLabel: {margin: 2, textStyle: {color: "#aaa"}},
		},
		yAxis: {
			type: "category",
			name: "TOP 30",
			nameGap: 16,
			axisLine: {show: false, lineStyle: {color: "#ddd"}},
			axisTick: {show: false, lineStyle: {color: "#ddd"}},
			axisLabel: {interval: 0, textStyle: {color: "#ddd"}},
			data: []
		},
		series:[
			{
				name: "H码号段",
				type: "scatter",
				coordinateSystem: "geo",
				data: convertedData[0],
				symbolSize: function(val) {
					return Math.max(val[2]/10, 8);
				},
				label: {
					normal: {
						formatter: "{b}",
						position: "right",
						show:false
					},
					emphasis: {
						show: true
					}
				},
				itemStyle: {
					normal: {
						color: "#ddb926"
					}
				}
			},
			{
				name: "Top 5",
				type: "effectScatter",
				coordinateSystem: "geo",
				data: convertedData[1],
				symbolSize: function(val) {
					return Math.max(val[2]/10, 8);
				},
				showEffectOn: "emphasis",
				rippleEffect: {
					brushType: "stroke"
				},
				hoverAnimation: true,
				label: {
					normal: {
						formatter: "{b}",
						position: "right",
						show: true
					}
				},
				itemStyle: {
					normal: {
						color: "#f4e925",
						shadowBlur: 10,
						shadowColor: "#333"
					}
				},
				zlevel: 1
			},
			{
				id: "bar",
				zlevel: 2, 
				type: "bar",
				symbol: "none",
				itemStyle: {
					normal: {
						color: "#ddb926"
					}
				},
				data: []
			}
		]
	};

	charts.on("brushselected", renderBrushed);

	setTimeout(function() {
		charts.dispatchAction({
			type: "brush",
			areas: [
				{
					geoIndex: 0,
					brushType: "polygon",
					 coordRange: [[119.72,34.85],[119.68,34.85],[119.5,34.84],[119.19,34.77],[118.76,34.63],[118.6,34.6],[118.46,34.6],[118.33,34.57],[118.05,34.56],[117.6,34.56],[117.41,34.56],[117.25,34.56],[117.11,34.56],[117.02,34.56],[117,34.56],[116.94,34.56],[116.94,34.55],[116.9,34.5],[116.88,34.44],[116.88,34.37],[116.88,34.33],[116.88,34.24],[116.92,34.15],[116.98,34.09],[117.05,34.06],[117.19,33.96],[117.29,33.9],[117.43,33.8],[117.49,33.75],[117.54,33.68],[117.6,33.65],[117.62,33.61],[117.64,33.59],[117.68,33.58],[117.7,33.52],[117.74,33.5],[117.74,33.46],[117.8,33.44],[117.82,33.41],[117.86,33.37],[117.9,33.3],[117.9,33.28],[117.9,33.27],[118.09,32.97],[118.21,32.7],[118.29,32.56],[118.31,32.5],[118.35,32.46],[118.35,32.42],[118.35,32.36],[118.35,32.34],[118.37,32.24],[118.37,32.14],[118.37,32.09],[118.44,32.05],[118.46,32.01],[118.54,31.98],[118.6,31.93],[118.68,31.86],[118.72,31.8],[118.74,31.78],[118.76,31.74],[118.78,31.7],[118.82,31.64],[118.82,31.62],[118.86,31.58],[118.86,31.55],[118.88,31.54],[118.88,31.52],[118.9,31.51],[118.91,31.48],[118.93,31.43],[118.95,31.4],[118.97,31.39],[118.97,31.37],[118.97,31.34],[118.97,31.27],[118.97,31.21],[118.97,31.17],[118.97,31.12],[118.97,31.02],[118.97,30.93],[118.97,30.87],[118.97,30.85],[118.95,30.8],[118.95,30.77],[118.95,30.76],[118.93,30.7],[118.91,30.63],[118.91,30.61],[118.91,30.6],[118.9,30.6],[118.88,30.54],[118.88,30.51],[118.86,30.51],[118.86,30.46],[118.72,30.18],[118.68,30.1],[118.66,30.07],[118.62,29.91],[118.56,29.73],[118.52,29.63],[118.48,29.51],[118.44,29.42],[118.44,29.32],[118.43,29.19],[118.43,29.14],[118.43,29.08],[118.44,29.05],[118.46,29.05],[118.6,28.95],[118.64,28.94],[119.07,28.51],[119.25,28.41],[119.36,28.28],[119.46,28.19],[119.54,28.13],[119.66,28.03],[119.78,28],[119.87,27.94],[120.03,27.86],[120.17,27.79],[120.23,27.76],[120.3,27.72],[120.42,27.66],[120.52,27.64],[120.58,27.63],[120.64,27.63],[120.77,27.63],[120.89,27.61],[120.97,27.6],[121.07,27.59],[121.15,27.59],[121.28,27.59],[121.38,27.61],[121.56,27.73],[121.73,27.89],[122.03,28.2],[122.3,28.5],[122.46,28.72],[122.5,28.77],[122.54,28.82],[122.56,28.82],[122.58,28.85],[122.6,28.86],[122.61,28.91],[122.71,29.02],[122.73,29.08],[122.93,29.44],[122.99,29.54],[123.03,29.66],[123.05,29.73],[123.16,29.92],[123.24,30.02],[123.28,30.13],[123.32,30.29],[123.36,30.36],[123.36,30.55],[123.36,30.74],[123.36,31.05],[123.36,31.14],[123.36,31.26],[123.38,31.42],[123.46,31.74],[123.48,31.83],[123.48,31.95],[123.46,32.09],[123.34,32.25],[123.22,32.39],[123.12,32.46],[123.07,32.48],[123.05,32.49],[122.97,32.53],[122.91,32.59],[122.83,32.81],[122.77,32.87],[122.71,32.9],[122.56,32.97],[122.38,33.05],[122.3,33.12],[122.26,33.15],[122.22,33.21],[122.22,33.3],[122.22,33.39],[122.18,33.44],[122.07,33.56],[121.99,33.69],[121.89,33.78],[121.69,34.02],[121.66,34.05],[121.64,34.08]]
				}
			]
		});
	}, 0);

	function renderBrushed(params) {
		var mainSeries = params.batch[0].selected[0];

		var selectedItems = [];
		var categoryData = [];
		var barData = [];
		var maxBar = 30;
		var sum = 0;
		var count = 0;

		for (var i = 0; i < mainSeries.dataIndex.length; i++)
		{
			var rawIndex = mainSeries.dataIndex[i];
			var dataItem = convertedData[0][rawIndex];
			var pmValue = dataItem.value[2];

			sum += pmValue;
			count++;

			selectedItems.push(dataItem);
		}

		selectedItems.sort(function(a, b) {
			return a.value[2] - b.value[2];
		});

		for (var i = 0; i < Math.min(selectedItems.length, maxBar); i++)
		{
			categoryData.push(selectedItems[i].name);
			barData.push(selectedItems[i].value[2]);
		}

		this.setOption({
			yAxis: {
				data: categoryData
			},
			xAxis: {
				axisLabel: {show: !!count}
			},
			title: {
				id: "statistic",
				text: count ? "平均: " + (sum / count).toFixed(4) : ""
			},
			series: {
				id: "bar",
				data: barData
			}
		});
	}

	if (option && typeof option === "object")
	{
		charts.setOption(option, true);
		window.onresize = charts.resize;
	}
</script>
 </body>
</html>