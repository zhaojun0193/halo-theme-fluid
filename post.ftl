<#include "module/macro.ftl">
<@layout title="${post.title!} - ${blog_title!}" post="${post}">
    <main>
        <div class="container-fluid nopadding-x">
            <div class="row nomargin-x">
                <div class="side-col d-none d-lg-block col-lg-2">
                    <#if settings.google_adsense_client?? && settings.google_adsense_slot_post??>
                        <!-- 广告位-->
                        <aside class="sidebar d-none d-xl-block" style="margin-right:-1rem;z-index:-1">
                            <!-- post-left -->
                            <ins class="adsbygoogle"
                                 style="display:block"
                                 data-ad-client="${settings.google_adsense_client!}"
                                 data-ad-slot="${settings.google_adsense_slot_post!}"
                                 data-ad-format="auto"
                                 data-full-width-responsive="true"></ins>
                            <script>
                                (adsbygoogle = window.adsbygoogle || []).push({});
                            </script>
                        </aside>
                    </#if>
                </div>
                <div class="col-lg-8 nopadding-x-md">
                    <div class="container nopadding-x-md" id="board-ctn">
                        <div id="board">
                            <article class="post-content mx-auto">
                                <!-- SEO header -->
                                <h1 style="display: none">${post.title!}</h1>
                                <div class="markdown-body">
                                    ${post.formatContent!}
                                </div>
                                <hr/>
                                <div>
                                    <div class="post-metas my-3">
                                    </div>
                                    <div class="license-box my-3">
                                        <div class="license-title">
                                            <div>${post.title!}</div>
                                            <div>${blog_url!}${post.fullPath!}</div>
                                        </div>
                                        <div class="license-meta">
                                            <div class="license-meta-item">
                                                <div>作者</div>
                                                <div>${user.nickname!}</div>
                                            </div>
                                            <div class="license-meta-item license-meta-date">
                                                <div>发布于</div>
                                                <div>${post.createTime?string("YYYY-MM-dd")}</div>
                                            </div>
                                            <div class="license-meta-item">
                                                <div>许可协议</div>
                                                <div>
                                                    <a target="_blank"
                                                       href="https://creativecommons.org/licenses/by/4.0/">
                                                      <span class="hint--top hint--rounded" aria-label="BY - 署名">
                                                        <i class="iconfont icon-by"></i>
                                                      </span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="license-icon iconfont"></div>
                                    </div>
                                    <!-- 广告位-->
                                   <#if settings.google_adsense_client?? && settings.google_adsense_slot_bottom??>
                                    <div style="width:100%;margin-bottom:1.5rem">
                                    <!-- post-bottom -->
                                    <ins class="adsbygoogle"
                                         style="display:block"
                                         data-ad-client="${settings.google_adsense_client!}"
                                         data-ad-slot="${settings.google_adsense_slot_bottom!}"
                                         data-ad-format="auto"
                                         data-full-width-responsive="true"></ins>
                                    <script>
                                        (adsbygoogle = window.adsbygoogle || []).push({});
                                    </script>
                                    </div>
                                   </#if>
                                    <div class="post-prevnext my-3">
                                        <article class="post-prev col-6">
                                        </article>
                                        <article class="post-next col-6">
                                        </article>
                                    </div>
                                </div>
                                <div id="comment">
                                    <#include "module/comment.ftl">
                                    <@comment target=post type="post" />
                                </div>
                            </article>
                        </div>
                    </div>
                </div>
                <div class="side-col d-none d-lg-block col-lg-2">
                    <aside class="sidebar" style="margin-left: -1rem">
                        <div id="toc">
                            <p class="toc-header">
                                <i class="iconfont icon-list"></i>
                                <span>目录</span>
                            </p>
                            <div class="toc-body" id="toc-body"></div>
                        </div>
                    </aside>
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
