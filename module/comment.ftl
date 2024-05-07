<#macro comment target,type>
    <#if !post.disallowComment!false>
        <script src="https://lf9-cdn-tos.bytecdntp.com/cdn/expire-1-M/vue/2.6.10/vue.min.js"></script>
        <script src="${options.comment_internal_plugin_js!'https://www.unpkg.com/halo-comment-yu@latest/dist/halo-comment.min.js'}"></script>
        <halo-comment id="${post.id?c}" type="${type}" class="halo-comment-part"/>
        <script>
            let htmlStyleElement = document.createElement('style');
            htmlStyleElement.innerHTML = '.halo-comment{background-color:transparent;transition:background-color 0.2s ease-in-out;}.halo-comment input{background-color:var(--board-bg-color) !important;color:var(--text-color) !important;background-color:transparent;transition:background-color 0.2s ease-in-out;}.halo-comment textarea{background-color:var(--board-bg-color) !important;color:var(--text-color) !important;background-color:transparent;transition:background-color 0.2s ease-in-out;}.comment-preview{color:var(--text-color) !important;transition:background-color 0.2s ease-in-out;}.comment-content{color:var(--text-color) !important;transition:background-color 0.2s ease-in-out;}';
            document.querySelector('.halo-comment-part').shadowRoot.appendChild(htmlStyleElement);
        </script>
    </#if>
</#macro>