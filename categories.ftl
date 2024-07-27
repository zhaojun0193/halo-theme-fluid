<#include "module/macro.ftl">
<@layout title="分类列表 - ${blog_title!}">
    <main>

        <div class="container nopadding-x-md">
            <div id="board" style="margin-top: 0">
                <div class="container">
                    <div id="categoryChart" style="width: 100%;height: 600px;margin: 0;"></div>
                    <ul class="category-item-wrap">
                        <@categoryTag method="list">
                            <#if categories?? && categories?size gt 0>
                                <#list categories as category>
                                    <li><a href="${category.fullPath}"><span>${category.name}</span></a></li>
                                </#list>
                            </#if>
                        </@categoryTag>
                    </ul>
                </div>
            </div>
        </div>
    </main>

    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('categoryChart'));

        // 指定图表的配置项和数据
        var option = {
            backgroundColor: 'transparent',
            title: {
                text: '文章分类统计图',
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
                        <@categoryTag method="list">
                        <#if categories?? && categories?size gt 0>
                        <#list categories as category>
                        {value: ${category.postCount}, name: '${category.name}'},
                        </#list>
                        </#if>
                        </@categoryTag>
                    ]
                }
            ]
        };

        document.addEventListener('themeEvent',function (e){
            // 释放资源
            myChart.dispose();
            // 重新渲染图表
            myChart = echarts.init(document.getElementById('categoryChart'),e.detail.theme);
            myChart.setOption(option);
        })

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
        window.onresize = myChart.resize

    </script>
</@layout>
