// 柱状图模块
(function () {
    // 实例化对象
    var myChart = echarts.init(document.querySelector(".bar .chart"));
    $.post('fans/geo', function (data) {
// 指定配置和数据
        data = JSON.parse(data);
        var xAxisData = [];
        var fansData = [];
        var i = 0;
        for (var city in data) {
            if (++i > 10) break;
            xAxisData.push(city);
            fansData.push(data[city]);
        }
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
                    data: xAxisData,
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
                    name: "粉丝数",
                    type: "bar",
                    barWidth: "35%",
                    data: fansData,
                    itemStyle: {
                        barBorderRadius: 5
                    }
                }
            ]
        };
        // 把配置给实例对象
        myChart.setOption(option);
    });
    window.addEventListener("resize", function () {
        myChart.resize();
    });
})();

// 饼形图定制
(function () {
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.querySelector(".pie .chart"));
    $.post('fans/gender', function (data) {
        data = JSON.parse(data);
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
                        {value: data["男"], name: "男"},
                        {value: data["女"], name: "女"}
                    ]
                }
            ]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    });

    window.addEventListener("resize", function () {
        myChart.resize();
    });
})();
(function () {
    var myChart = echarts.init(document.querySelector(".map .chart"));
    $.post('fans/geo', function (data) {
        data = JSON.parse(data);
        var outdata = [];
        for (var city in data) {
            outdata.push({
                name: city,
                value: data[city]
            })
        }
        var option = {
            tooltip: {
                show: true,
                formatter: function (params) {
                    return '&nbsp;&nbsp;' + params.name + '：' + params.value + '人&nbsp;&nbsp;';
                }
            },
            visualMap: {
                type: 'piecewise',
                left: '15',
                bottom: '15',
                itemWidth: 27,
                itemHeight: 15,
                textStyle: {
                    color: '#fff',
                    fontSize: 14
                },
                pieces: [{
                    min: 100,
                    label: '>100'
                }, {
                    max: 100,
                    min: 50,
                    label: '50-100'
                }, {
                    max: 50,
                    min: 0,
                    label: '<50'
                }, {
                    value: 0,
                    label: '无数据'
                }],
                inRange: {
                    color: ['rgba(210, 234, 255, 0.42)', 'rgba(138, 198, 253, 0.42)', 'rgba(69, 165, 248, 0.42)', 'rgba(6, 90, 171, 0.42)']
                },
                outOfRange: {
                    color: ['rgba(153, 153, 153, 0.42)']
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
                        show: false
                    },
                    emphasis: {
                        show: false
                    }
                },
                itemStyle: {
                    normal: {
                        areaColor: 'rgba(178, 202, 224, 0.42)',
                        borderColor: '#fff',
                        borderWidth: 1
                    },
                    emphasis: {
                        areaColor: 'rgba(255, 174, 0, 0.42)'
                    }
                },
                data: outdata
            }]
        };
        myChart.setOption(option);
    });
    window.addEventListener("resize", function () {
        myChart.resize();
    });
})();