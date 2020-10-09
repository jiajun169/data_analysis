// 柱状图模块
(function () {
    // 实例化对象
    var myChart = echarts.init(document.querySelector(".bar .chart"));
    // 指定配置和数据
    var option = {
        color: ["#2f89cf"],
        tooltip: {
            trigger: "axis",
            axisPointer: {
                // 坐标轴指示器，坐标轴触发有效
                type: "shadow" // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        grid: {
            left: "0%",
            top: "20%",
            right: "0%",
            bottom: "0%",
            containLabel: true
        },
        xAxis: [
            {
                type: "category",
                data: [
                    "旅游行业",
                    "教育培训",
                    "游戏行业",
                    "医疗行业",
                    "电商行业",
                    "社交行业",
                    "金融行业"
                ],
                axisTick: {
                    alignWithLabel: true
                },
                axisLabel: {
                    textStyle: {
                        color: "rgba(255,255,255,.6)",
                        fontSize: "12"
                    }
                },
                axisLine: {
                    show: false
                }
            }
        ],
        yAxis: [
            {
                type: "value",
                axisLabel: {
                    textStyle: {
                        color: "rgba(255,255,255,.6)",
                        fontSize: "12"
                    }
                },
                axisLine: {
                    lineStyle: {
                        color: "rgba(255,255,255,.1)"
                        // width: 1,
                        // type: "solid"
                    }
                },
                splitLine: {
                    lineStyle: {
                        color: "rgba(255,255,255,.1)"
                    }
                }
            }
        ],
        series: [
            {
                name: "直接访问",
                type: "bar",
                barWidth: "35%",
                data: [200, 300, 300, 900, 1500, 1200, 600],
                itemStyle: {
                    barBorderRadius: 5
                }
            }
        ]
    };

    // 把配置给实例对象
    myChart.setOption(option);
    window.addEventListener("resize", function () {
        myChart.resize();
    });
})();

// 饼形图定制
(function () {
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.querySelector(".pie .chart"));

    var option = {
        tooltip: {
            trigger: "item",
            formatter: "{a} <br/>{b}: {c} ({d}%)",
            position: function (p) {
                //其中p为当前鼠标的位置
                return [p[0] + 10, p[1] - 10];
            }
        },
        legend: {
            top: "90%",
            itemWidth: 10,
            itemHeight: 10,
            textStyle: {
                color: "rgba(255,255,255,.5)",
                fontSize: "12"
            }
        },
        series: [
            {
                name: "性别分布",
                type: "pie",
                center: ["50%", "42%"],
                radius: ["40%", "60%"],
                color: [
                    "#066eab",
                    "#06dcab"
                ],
                label: {show: true},
                labelLine: {show: true},
                data: [
                    {value: 50, name: "男"},
                    {value: 30, name: "女"}
                ]
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
    window.addEventListener("resize", function () {
        myChart.resize();
    });
})();
(function () {
    var myChart = echarts.init(document.querySelector(".map .chart"));
    var outname = ["南海诸岛", '北京', '天津', '上海', '重庆', '河北', '河南', '云南', '辽宁', '黑龙江', '湖南', '安徽', '山东', '新疆', '江苏', '浙江', '江西', '湖北', '广西', '甘肃', '山西', '内蒙古', '陕西', '吉林', '福建', '贵州', '广东', '青海', '西藏', '四川', '宁夏', '海南', '台湾', '香港', '澳门'];
    var outvalue = [0, 524, 13, 140, 75, 13, 83, 11, 19, 15, 69, 260, 39, 4, 31, 104, 36, 1052, 33, 347, 9, 157, 22, 4, 18, 5, 6398, 41, 0, 484, 404, 22, 3, 5, 225];
    var outdata = [];
    for (var i = 0; i < outname.length; i++) {
        outdata.push({
            name: outname[i],
            value: outvalue[i]
        })
    }

    var option = {
        tooltip: {
            show: true,
            formatter: function (params) {
                return '&nbsp;&nbsp;' + params.name + '&nbsp;&nbsp;&nbsp;' + params.value + '人&nbsp;&nbsp;';
            }
        },
        visualMap: {
            type: 'piecewise',
            left: '15',
            bottom: '15',
            itemWidth: 27,
            itemHeight: 15,
            textStyle: {
                color: '#333333',
                fontSize: 14,
            },
            pieces: [{
                min: 500,
                label: '>500',
            }, {
                max: 500,
                min: 200,
                label: '200-500',
            }, {
                max: 200,
                min: 0,
                label: '<200',
            }, {
                value: 0,
                label: '无数据',
            },],
            inRange: {
                color: ['#B2CAE0', '#D2EAFF', '#8AC6FD', '#45A5F8']
            },
            outOfRange: {
                color: ['#999999']
            }
        },
        geo: {
            map: 'china',
            show: true,
            roam: false,
            label: {
                emphasis: {
                    show: false
                }
            },
            itemStyle: {
                normal: {
                    borderColor: 'rgba(0,63,140,0.2)',
                    shadowColor: 'rgba(0,63,140,0.2)',
                    shadowOffsetY: 20,
                    shadowBlur: 30
                }
            }
        },
        series: [{
            type: 'map',
            map: 'china',
            aspectScale: 0.75,
            //zoom:1.1,
            label: {
                normal: {
                    show: false,
                },
                emphasis: {
                    show: false,
                }
            },
            itemStyle: {
                normal: {
                    areaColor: '#B2CAE0',
                    borderColor: '#fff',
                    borderWidth: 1,
                },
                emphasis: {
                    areaColor: '#FFAE00',
                }
            },
            data: outdata
        }]
    };
    myChart.setOption(option);
    window.addEventListener("resize", function () {
        myChart.resize();
    });
})();