<#include "module/macro.ftl">
<@layout title="${sheet.title!} - ${blog_title!}">
    <main>
        <div class="container-fluid nopadding-x">
            <div class="row nomargin-x">
                <div class="side-col d-none d-lg-block col-lg-2"></div>
                <div class="col-lg-8 nopadding-x-md">
                    <div class="container nopadding-x-md" id="board-ctn">
                        <div id="board">
                            <article class="post-content mx-auto">
                                <!-- SEO header -->
                                <h1 style="display: none">${sheet.title!}</h1>
                                <div class="markdown-body">
                                    ${sheet.formatContent!}
                                </div>
                                <hr/>
                                <div>
                                    <div class="post-metas my-3">
                                    </div>
                                    <div class="post-prevnext my-3">
                                        <article class="post-prev col-6">
                                        </article>
                                        <article class="post-next col-6">
                                        </article>
                                    </div>
                                </div>
                                <div id="comment">
                                    <#include "module/comment.ftl">
                                    <@comment target=sheet type="sheet" />
                                </div>
                            </article>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a id="scroll-top-button" aria-label="TOP" href="#" role="button">
            <i class="iconfont icon-arrowup" aria-hidden="true"></i>
        </a>
        <div class="modal fade" id="modalSearch" tabindex="-1" role="dialog" aria-labelledby="ModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <h4 class="modal-title w-100 font-weight-bold">搜索</h4>
                        <button type="button" id="local-search-close" class="close" data-dismiss="modal"
                                aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body mx-3">
                        <div class="md-form mb-5">
                            <input type="text" id="local-search-input" class="form-control validate">
                            <label data-error="x" data-success="v" for="local-search-input">关键词</label>
                        </div>
                        <div class="list-group" id="local-search-result"></div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</@layout>
