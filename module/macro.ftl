<#macro layout title post="">
    <@head title="${title!}"/>
    <body>
    <#if is_index??>
        <div class="header-inner" style="height: 100vh;">
    <#else>
        <div class="header-inner" style="height: 70vh;">
    </#if>
            <@nav/>
            <@banner/>
        </div>
    <#nested >
    <@footer/>
    </body>
    </html>
</#macro>

<#macro head title>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="${meta_keywords!}"/>
    <meta name="description" content="${meta_description!}"/>

    <#--
        公共 head 代码，详情请参考：https://docs.halo.run/zh/developer-guide/theme/public-template-tag
        包含：Favicon，自定义 head 等
    -->
    <meta charset="UTF-8">
    <link rel="apple-touch-icon" sizes="76x76" href="${blog_logo!}">
    <link rel="icon" href="${blog_logo!}">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <meta name="theme-color" content="#2f4154">
    <meta name="author" content="zhaojun">

    <meta property="og:type" content="website">
    <meta property="og:title" content="卑微幻想家">
    <meta property="og:url" content="https://www.zhaojun.ink/">
    <meta property="og:site_name" content="卑微幻想家">
    <meta property="og:locale" content="zh_CN">
    <meta property="article:author" content="zhaojun">
    <meta name="twitter:card" content="summary_large_image">
    <@global.head />

    <title>${title}</title>
    <link rel="stylesheet" href="https://lib.baomitu.com/twitter-bootstrap/4.6.1/css/bootstrap.min.css"/>

    <#if is_post??>
        <link rel="stylesheet" href="https://lib.baomitu.com/github-markdown-css/4.0.0/github-markdown.min.css"/>
        <link href="https://lf26-cdn-tos.bytecdntp.com/cdn/expire-1-M/KaTeX/0.12.0/katex.min.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="https://lib.baomitu.com/hint.css/2.7.0/hint.min.css"/>
        <link rel="stylesheet" href="https://lib.baomitu.com/fancybox/3.5.7/jquery.fancybox.min.css"/>
    </#if>

    <link rel="stylesheet" href="//at.alicdn.com/t/font_1749284_hj8rtnfg7um.css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1736178_lbnruvf0jn.css">
    <link rel="stylesheet" href="${theme_base!}/source/css/main.css"/>
    <link id="highlight-css" rel="stylesheet" href="${theme_base!}/source/css/highlight.css"/>
    <link id="highlight-css-dark" rel="stylesheet" href="${theme_base!}/source/css/highlight-dark.css"/>
    <script id="fluid-configs">
        var Fluid = window.Fluid || {};
        Fluid.ctx = Object.assign({}, Fluid.ctx)
        var CONFIG = {
            "hostname": "zhaojun.ink",
            "root": "/",
            "version": "1.9.4",
            "typing": {"enable": true, "typeSpeed": 70, "cursorChar": "_", "loop": false, "scope": []},
            "anchorjs": {
                "enable": true,
                "element": "h1,h2,h3,h4,h5,h6",
                "placement": "left",
                "visible": "hover",
                "icon": ""
            },
            "progressbar": {
                "enable": true,
                "height_px": 3,
                "color": "#29d",
                "options": {"showSpinner": false, "trickleSpeed": 100}
            },
            "code_language": {"enable": true, "default": "TEXT"},
            "copy_btn": true,
            "image_caption": {"enable": true},
            "image_zoom": {"enable": true, "img_url_replace": ["", ""]},
            "toc": {"enable": true, "placement": "right", "headingSelector": "h1,h2,h3,h4,h5,h6", "collapseDepth": 0},
            "lazyload": {"enable": true, "loading_img": "/img/loading.gif", "onlypost": false, "offset_factor": 2},
            "web_analytics": {
                "enable": false,
                "follow_dnt": true,
                "baidu": null,
                "google": null,
                "gtag": null,
                "tencent": {"sid": null, "cid": null},
                "woyaola": null,
                "cnzz": null,
                "leancloud": {
                    "app_id": null,
                    "app_key": null,
                    "server_url": null,
                    "path": "window.location.pathname",
                    "ignore_local": false
                }
            },
            "search_path": "/local-search.xml"
        };

        if (CONFIG.web_analytics.follow_dnt) {
            var dntVal = navigator.doNotTrack || window.doNotTrack || navigator.msDoNotTrack;
            Fluid.ctx.dnt = dntVal && (dntVal.startsWith('1') || dntVal.startsWith('yes') || dntVal.startsWith('on'));
        }
    </script>
    <script src="${theme_base!}/source/js/utils.js"></script>
    <script src="${theme_base!}/source/js/color-schema.js"></script>

    <#if is_categories?? || is_tags??>
        <script src="https://lib.baomitu.com/echarts/5.1.2/echarts.min.js"></script>
    </#if>
</head>
</#macro>

<#macro banner>
    <#if is_index??>
        <#if settings.home_bg_image?? && settings.home_bg_image != ''>
            <div id="banner" class="banner" parallax=true style="background: url('${settings.home_bg_image!}') no-repeat center center; background-size: cover;">
        <#else>
            <div id="banner" class="banner" parallax=true style="background: url('${theme_base!}/source/images/default.png') no-repeat center center; background-size: cover;">
        </#if>
    <#elseif is_category?? || is_categories??>
        <#if settings.category_bg_image?? && settings.category_bg_image != ''>
            <div id="banner" class="banner" parallax=true style="background: url('${settings.category_bg_image!}') no-repeat center center; background-size: cover;">
        <#else>
            <div id="banner" class="banner" parallax=true style="background: url('${theme_base!}/source/images/default.png') no-repeat center center; background-size: cover;">
        </#if>
    <#elseif is_tag?? || is_tags??>
        <#if settings.tag_bg_image?? && settings.tag_bg_image != ''>
            <div id="banner" class="banner" parallax=true style="background: url('${settings.tag_bg_image!}') no-repeat center center; background-size: cover;">
        <#else>
            <div id="banner" class="banner" parallax=true style="background: url('${theme_base!}/source/images/default.png') no-repeat center center; background-size: cover;">
        </#if>
    <#elseif is_links??>
        <#if settings.links_bg_image?? && settings.links_bg_image != ''>
            <div id="banner" class="banner" parallax=true style="background: url('${settings.links_bg_image!}') no-repeat center center; background-size: cover;">
        <#else>
            <div id="banner" class="banner" parallax=true style="background: url('${theme_base!}/source/images/default.png') no-repeat center center; background-size: cover;">
        </#if>
    <#elseif is_archives??>
        <#if settings.archives_bg_image?? && settings.archives_bg_image != ''>
            <div id="banner" class="banner" parallax=true style="background: url('${settings.archives_bg_image!}') no-repeat center center; background-size: cover;">
        <#else>
            <div id="banner" class="banner" parallax=true style="background: url('${theme_base!}/source/images/default.png') no-repeat center center; background-size: cover;">
        </#if>
    <#elseif is_sheet??>
        <#if settings.sheet_bg_image?? && settings.sheet_bg_image != ''>
            <div id="banner" class="banner" parallax=true style="background: url('${settings.sheet_bg_image!}') no-repeat center center; background-size: cover;">
        <#else>
            <div id="banner" class="banner" parallax=true style="background: url('${theme_base!}/source/images/default.png') no-repeat center center; background-size: cover;">
        </#if>
    <#elseif is_post??>
        <#if settings.post_cover_image_to_bg?? && settings.post_cover_image_to_bg>
            <div id="banner" class="banner" parallax=true style="background: url('${post.thumbnail!}') no-repeat center center; background-size: cover;">
        <#else>
            <#if settings.post_bg_image?? && settings.post_bg_image != ''>
            <div id="banner" class="banner" parallax=true
                 style="background: url('${settings.post_bg_image!}') no-repeat center center; background-size: cover;">
            <#else>
                <div id="banner" class="banner" parallax=true
                     style="background: url('${theme_base!}/source/images/default.png') no-repeat center center; background-size: cover;">
            </#if>
        </#if>
    </#if>
        <div class="full-bg-img">
            <div class="mask flex-center" style="background-color: rgba(0, 0, 0, 0.3)">
                <div class="banner-text text-center fade-in-up">
                    <div class="h2">
                        <#if is_index??>
                            <#if settings.sub_title?? && settings.sub_title != ''>
                                <span id="subtitle" data-typed-text="${settings.sub_title!}"></span>
                            </#if>
                        <#elseif is_post?? && post??>
                            <span id="post-title" >${post.title!}</span>
                        <#elseif is_category?? && category??>
                            <span id="category-title" >${category.name!}</span>
                        <#elseif is_categories??>
                            <span id="categories-title" >分类</span>
                        <#elseif is_tag?? && tag??>
                            <span id="tag-title" >${tag.name!}</span>
                        <#elseif is_tags??>
                            <span id="tags-title" >标签</span>
                        <#elseif is_links??>
                            <span id="links-title">友链</span>
                        </#if>
                    </div>
                    <#if is_post??>
                    <div class="mt-3">
                      <span class="post-meta">
                        <i class="iconfont icon-date-fill" aria-hidden="true"></i>
                        <time datetime="2020-03-09 00:38" pubdate>
                          ${post.createTime?string("yyyy-MM-dd HH:mm")}
                        </time>
                      </span>
                    </div>
                    <div class="mt-1">
                       <span class="post-meta mr-2">
                         <i class="iconfont icon-chart"></i>
                           ${(post.wordCount)!} 字
                       </span>
                        <span class="post-meta mr-2"><i class="iconfont icon-clock-fill"></i>
                            ${(((post.wordCount)!0)/300)?round} 分钟
                        </span>
                        <span id="leancloud-page-views-container" class="post-meta" style="display: inline;">
                            <i class="iconfont icon-eye" aria-hidden="true"></i>
                            <span id="leancloud-page-views">${(post.visits)!}</span> 次
                        </span>
                    </div>
                    </#if>
                </div>
                <#if is_index??>
                    <div class="scroll-down-bar">
                        <i class="iconfont icon-arrowdown"></i>
                    </div>
                </#if>
            </div>
        </div>
    </div>
</#macro>

<#macro nav>
    <nav id="navbar" class="navbar fixed-top  navbar-expand-lg navbar-dark scrolling-navbar">
        <div class="container">
            <a class="navbar-brand" href="/">
                <strong>${blog_title!}</strong>
            </a>
            <button id="navbar-toggler-btn" class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <div class="animated-icon"><span></span><span></span><span></span></div>
            </button>

            <!-- Collapsible content -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto text-center">
                    <#include "menu.ftl">
<#--                    <li class="nav-item" id="search-btn">-->
<#--                        <a class="nav-link" target="_self" href="javascript:;" data-toggle="modal"-->
<#--                           data-target="#modalSearch" aria-label="Search">-->
<#--                            <i class="iconfont icon-search"></i>-->
<#--                        </a>-->
<#--                    </li>-->
                    <li class="nav-item" id="color-toggle-btn">
                        <a class="nav-link" target="_self" href="javascript:;" aria-label="Color Toggle">
                            <i class="iconfont icon-dark" id="color-toggle-icon"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</#macro>

<#macro footer>

<#--
    公共底部代码，详情请参考：https://docs.halo.run/zh/developer-guide/theme/public-template-tag
    包含：统计代码，底部信息
-->

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

    <div class="footer-inner">
        <div class="footer-content">
            <#if settings.icp_number?? && settings.icp_number != ''>
                <div class="icp">
                    <a href="https://beian.miit.gov.cn/" target="_blank" rel="nofollow noopener">
                        <span>${settings.icp_number}</span>
                    </a>
                </div>
            </#if>

           <#if settings.police_number?? && settings.police_number != ''>
            <div class="police">
                <a href="https://beian.miit.gov.cn/" target="_blank" rel="nofollow noopener" style="display: flex;align-items: center;justify-content: center;">
                    <img src="${theme_base!}/source/images/police_beian.png" alt="" style="height: 16px;margin-right: 5px;"> <span>${settings.police_number}</span>
                </a>
            </div>
            </#if>
            <div class="powered">
                Powered by
                <a href="https://halo.run" target="_blank" class="halo" rel="nofollow noopener"><span>Halo</span></a>
                <span> | </span>
                <span class="theme">
                    Theme by
                    <a href="https://github.com/zhaojun0193/halo-theme-fluid" target="_blank" rel="nofollow noopener"><span>卑微幻想家</span></a>
                </span>
            </div>
        </div>
    </div>

    <!-- Scripts -->

    <script src="https://lib.baomitu.com/nprogress/0.2.0/nprogress.min.js"></script>
    <link rel="stylesheet" href="https://lib.baomitu.com/nprogress/0.2.0/nprogress.min.css"/>

    <script>
        NProgress.configure({"showSpinner": false, "trickleSpeed": 100})
        NProgress.start()
        window.addEventListener('load', function () {
            NProgress.done();
        })
    </script>


    <script src="https://lib.baomitu.com/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://lib.baomitu.com/twitter-bootstrap/4.6.1/js/bootstrap.min.js"></script>
    <script src="${theme_base!}/source/js/events.js"></script>
    <script src="${theme_base!}/source/js/plugins.js"></script>


    <script src="https://lib.baomitu.com/typed.js/2.0.12/typed.min.js"></script>
    <script>
        (function (window, document) {
            var typing = Fluid.plugins.typing;
            var subtitle = document.getElementById('subtitle');
            if (!subtitle || !typing) {
                return;
            }
            var text = subtitle.getAttribute('data-typed-text');

            typing(text);

        })(window, document);
    </script>


    <script src="${theme_base!}/source/js/img-lazyload.js"></script>
    <script src="${theme_base!}/source/js/local-search.js"></script>


    <#if is_post??>
    <script>
        Fluid.utils.createScript('https://lib.baomitu.com/tocbot/4.18.2/tocbot.min.js', function() {
            var toc = jQuery('#toc');
            if (toc.length === 0 || !window.tocbot) { return; }
            var boardCtn = jQuery('#board-ctn');
            var boardTop = boardCtn.offset().top;

            window.tocbot.init(Object.assign({
                tocSelector     : '#toc-body',
                contentSelector : '.markdown-body',
                linkClass       : 'tocbot-link',
                activeLinkClass : 'tocbot-active-link',
                listClass       : 'tocbot-list',
                isCollapsedClass: 'tocbot-is-collapsed',
                collapsibleClass: 'tocbot-is-collapsible',
                scrollSmooth    : true,
                includeTitleTags: true,
                headingsOffset  : -boardTop,
            }, CONFIG.toc));
            if (toc.find('.toc-list-item').length > 0) {
                toc.css('visibility', 'visible');
            }

            Fluid.events.registerRefreshCallback(function() {
                if ('tocbot' in window) {
                    tocbot.refresh();
                    var toc = jQuery('#toc');
                    if (toc.length === 0 || !tocbot) {
                        return;
                    }
                    if (toc.find('.toc-list-item').length > 0) {
                        toc.css('visibility', 'visible');
                    }
                }
            });
        });
    </script>

    <script src=https://lib.baomitu.com/clipboard.js/2.0.11/clipboard.min.js></script>

    <script>Fluid.plugins.codeWidget();</script>



    <script>
        Fluid.utils.createScript('https://lib.baomitu.com/anchor-js/4.3.1/anchor.min.js', function() {
            window.anchors.options = {
                placement: CONFIG.anchorjs.placement,
                visible  : CONFIG.anchorjs.visible
            };
            if (CONFIG.anchorjs.icon) {
                window.anchors.options.icon = CONFIG.anchorjs.icon;
            }
            var el = (CONFIG.anchorjs.element || 'h1,h2,h3,h4,h5,h6').split(',');
            var res = [];
            for (var item of el) {
                res.push('.markdown-body > ' + item.trim());
            }
            if (CONFIG.anchorjs.placement === 'left') {
                window.anchors.options.class = 'anchorjs-link-left';
            }
            window.anchors.add(res.join(', '));

            Fluid.events.registerRefreshCallback(function() {
                if ('anchors' in window) {
                    anchors.removeAll();
                    var el = (CONFIG.anchorjs.element || 'h1,h2,h3,h4,h5,h6').split(',');
                    var res = [];
                    for (var item of el) {
                        res.push('.markdown-body > ' + item.trim());
                    }
                    if (CONFIG.anchorjs.placement === 'left') {
                        anchors.options.class = 'anchorjs-link-left';
                    }
                    anchors.add(res.join(', '));
                }
            });
        });
    </script>



    <script>
        Fluid.utils.createScript('https://lib.baomitu.com/fancybox/3.5.7/jquery.fancybox.min.js', function() {
            Fluid.plugins.fancyBox();
        });
    </script>


    <script>Fluid.plugins.imageCaption();</script>

    <script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/11.6.0/highlight.min.js"></script>
    <script>
        hljs.highlightAll();
    </script>
</#if>

    <!-- 主题的启动项，将它保持在最底部 -->
    <!-- the boot of the theme, keep it at the bottom -->
    <script src="${theme_base!}/source/js/boot.js"></script>
    <@global.footer />
</#macro>

<#macro pagination method slug="">
    <nav aria-label="navigation">
        <span class="pagination" id="pagination">
    <@paginationTag method="${method}" slug="${slug}" page="${posts.number}" total="${posts.totalPages}" display="3">
        <#if pagination.hasPrev>
            <a class="extend prev" rel="next" href="${pagination.prevPageFullPath!}">
                <i class="iconfont icon-arrowleft"></i>
            </a>
        </#if>
        <#list pagination.rainbowPages as number>
        <#if number.isCurrent>
            <span class="page-number current">${number.page}</span>
                <#else>
            <a class="page-number" href="${number.fullPath}/#board">${number.page}</a>
        </#if>
    </#list>
        <#if pagination.hasNext>
        <a class="extend next" rel="next" href="${pagination.nextPageFullPath!}/#board">
                <i class="iconfont icon-arrowright"></i>
            </a>
    </#if>
    </@paginationTag>
        </span>
    </nav>
</#macro>

