<#include "module/macro.ftl">
<@layout title="归档 - ${blog_title!}">
    <main>
        <div class="container nopadding-x-md">
            <div id="board" style="margin-top: 0">
                <div class="container">
                    <div class="row">
                        <div class="col-12 col-md-10 m-auto">
                            <div class="list-group">
                                <@postTag method="count">
                                    <p class="h4">共计 ${count!0} 篇文章</p>
                                </@postTag>
                                <hr>
                                <#list archives as archive>
                                <p class="h5">${archive.year?c}</p>
                                    <#list archive.posts as post>
                                        <a href="${post.fullPath!}" class="list-group-item list-group-item-action">
                                            <time>${post.createTime?string("MM-dd")}</time>
                                            <div class="list-group-item-title">${post.title!}</div>
                                        </a>
                                    </#list>
                                </#list>
                            </div>
                            <@pagination method="archives"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</@layout>



