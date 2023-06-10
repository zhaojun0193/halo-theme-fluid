<#include "module/macro.ftl">
<@layout title="${blog_title!}">
    <main>
        <div class="container nopadding-x-md">
            <div id="board" style="margin-top: 0">
                <div class="container">
                    <div class="row">
                        <div class="col-12 col-md-10 m-auto">
                            <#list posts.content as post>
                                <div class="row mx-auto index-card">
                                    <div class="col-12 col-md-4 m-auto index-img">
                                        <a href="/posts/hello-fluid/" target="_self">
                                            <img src="${post.thumbnail}" alt="Hello Fluid">
                                        </a>
                                    </div>
                                    <article class="col-12 col-md-8 mx-auto index-info">
                                        <h1 class="index-header">
                                            <#if post.topped>
                                                <i class="index-pin iconfont icon-top" title="Pin on top"></i>
                                            </#if>
                                            <a href="${post.fullPath!}" target="_self">
                                                ${post.title}
                                            </a>
                                        </h1>
                                        <a class="index-excerpt index-excerpt__noimg" href="/2023/06/09/hello-world/"
                                           target="_self">
                                            <div>
                                                ${post.summary}
                                            </div>
                                        </a>
                                        <div class="index-btm post-metas">
                                            <div class="post-meta mr-3">
                                                <i class="iconfont icon-date"></i>
                                                <time datetime="${post.createTime}" pubdate>
                                                    ${post.createTime?string("yyyy-MM-dd")}
                                                </time>
                                            </div>
                                            <#if post.categories?? && post.categories?size gt 0>
                                                <div class="post-meta mr-3">
                                                    <i class="iconfont icon-category"></i>
                                                    <a href="${post.categories[0].fullPath}" target="_self">
                                                        ${post.categories[0].name}
                                                    </a>
                                                </div>
                                            </#if>
                                            <#if post.tags?? && post.tags?size gt 0>
                                                <div class="post-meta">
                                                    <i class="iconfont icon-tags"></i>
                                                    <#list post.tags as tag>
                                                        <a href="${tag.fullPath}" target="_self">
                                                            #${tag.name}
                                                        </a>
                                                    </#list>
                                                </div>
                                            </#if>
                                        </div>
                                    </article>
                                </div>
                            </#list>
                            <@pagination/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</@layout>
