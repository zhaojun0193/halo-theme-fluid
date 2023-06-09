<@menuTag method="list">
    <#--
        ?sort_by('priority')：根据菜单的排序编号排序
    -->
    <#list menus?sort_by('priority') as menu>
        <li class="nav-item">
            <a class="nav-link" href="${menu.url}" target="${menu.target!}">
            <i class="iconfont ${menu.icon}"></i>
            <span>${menu.name}</span>
            </a>
        </li>
    </#list>
</@menuTag>