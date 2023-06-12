<#include "module/macro.ftl">
<@layout title="友情链接 - ${blog_title!}">
    <main>
        <div class="container nopadding-x-md">
            <div id="board" style="margin-top: 0">
                <div class="container">
                    <div class="row">
                        <div class="col-12 col-md-10 m-auto">
                            <div class="row links">
                            <@linkTag method="list">
                                    <#if links?? && links?size gt 0>
                                        <#list links as link>
                                            <div class="card col-lg-4 col-md-6 col-sm-12">
                                                <a href="${link.url}" class="card-body hover-with-bg" target="_blank" rel="noopener external nofollow noreferrer">
                                                    <div class="card-content">
                                                        <div class="link-avatar my-auto">
                                                            <img src="${link.logo}" alt="Install Fluid" onerror="this.onerror=null; this.src=this.srcset='${link.logo}'" srcset="${link.logo}">
                                                        </div>
                                                        <div class="link-text">
                                                            <div class="link-title">${link.name}</div>
                                                            <div class="link-intro">${link.description}</div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </#list>
                                    </#if>
                                </@linkTag>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</@layout>