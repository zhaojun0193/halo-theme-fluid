<#include "module/macro.ftl">
<@layout title="标签列表 - ${blog_title!}">
    <main>
        <div class="container nopadding-x-md">
            <div id="board" style="margin-top: 0">
                <div class="container">
                    <div id="tagChart" style="width: 100%;height: 600px;margin: 0 auto"></div>
                    <ul class="tag-item-wrap">
                        <@tagTag method="list">
                            <#if tags?? && tags?size gt 0>
                                <#list tags as tag>
                                    <li><a href="${tag.fullPath}"><span>#${tag.name}</span></a></li>
                                </#list>
                            </#if>
                        </@tagTag>
                    </ul>
                </div>
            </div>
        </div>
    </main>

    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('tagChart'));

        // 指定图表的配置项和数据
        var option = {
            backgroundColor: 'transparent',
            title: {
                text: '文章标签统计图',
                left: 'center'
            },
            legend: {
                top: 'bottom',
                icon: 'circle'
            },
            toolbox: {
                show: true,
                feature: {
                    mark: {show: true},
                }
            },
            series: [
                {
                    name: 'Categories Chart',
                    type: 'pie',
                    radius: [50, 100],
                    center: ['50%', '50%'],
                    roseType: 'area',
                    itemStyle: {
                        borderRadius: 8
                    },
                    label: {
                        alignTo: 'edge',
                        formatter(param) {
                            return param.name + ':' + param.value + ' (' + param.percent + '%)';
                        },
                        minMargin: 5,
                        edgeDistance: 10,
                        lineHeight: 15,
                    },
                    data: [
                        <@tagTag method="list">
                        <#if tags?? && tags?size gt 0>
                        <#list tags as tag>
                        {value: ${tag.postCount}, name: '${tag.name}'},
                        </#list>
                        </#if>
                        </@tagTag>
                    ]
                }
            ]
        };

        document.addEventListener('themeEvent',function (e){
            // 释放资源
            myChart.dispose();
            // 重新渲染图表
            myChart = echarts.init(document.getElementById('tagChart'),e.detail.theme);
            myChart.setOption(option);
        })

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
        window.onresize = myChart.resize
    </script>
</@layout>