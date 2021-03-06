<#include "macro-notifications.ftl">
<@notifications "at">
<#if atNotifications?size != 0>
<ul class="notification">
    <#list atNotifications as notification>
    <li class="comment-list-item fn-flex<#if notification.hasRead> read</#if>">
        <#if notification.isAt>
            <#if "someone" != notification.authorName>
            <a target="_blank" rel="nofollow" href="${servePath}/member/${notification.authorName}">
            </#if>
                <div class="avatar tooltipped tooltipped-se" aria-label="${notification.authorName}" style="background-image:url('${notification.thumbnailURL}')"></div>
            <#if "someone" != notification.authorName></a></#if>
            <#if !notification.atInArticle>
            <div class="fn-flex-1">
                <div class="fn-flex">
                    <h2 class="fn-flex-1">
                        <#if 1 == notification.articlePerfect>
                        <span class="tooltipped tooltipped-w" aria-label="${perfectLabel}"><svg height="20" viewBox="3 3 11 12" width="14">${perfectIcon}</svg></span>
                        </#if>
                        <#if 1 == notification.articleType>
                        <span class="tooltipped tooltipped-w" aria-label="${discussionLabel}"><span class="icon-locked"></span></span>
                        <#elseif 2 == notification.articleType>
                        <span class="tooltipped tooltipped-w" aria-label="${cityBroadcastLabel}"><span class="icon-feed"></span></span>
                        <#elseif 3 == notification.articleType>
                        <span class="tooltipped tooltipped-w" aria-label="${thoughtLabel}"><span class="icon-video"></span></span>
                        </#if>
                        <a rel="bookmark" href="${servePath}${notification.url}"> ${notification.articleTitle}</a>
                    </h2>
                    <span class="ft-gray">
                        ${notification.createTime?string('yyyy-MM-dd HH:mm')}
                    </span>
                </div>
                <div class="content-reset comment">
                    ${notification.content}
                </div>
            </div>
            <#else>
            <div class="fn-flex-1 has-view">
                <h2>
                    <#if 1 == notification.articlePerfect>
                    <span class="tooltipped tooltipped-w" aria-label="${perfectLabel}"><svg height="20" viewBox="3 3 11 12" width="14">${perfectIcon}</svg></span>
                    </#if>
                    <#if 1 == notification.articleType>
                    <span class="tooltipped tooltipped-w" aria-label="${discussionLabel}"><span class="icon-locked"></span></span>
                    <#elseif 2 == notification.articleType>
                    <span class="tooltipped tooltipped-w" aria-label="${cityBroadcastLabel}"><span class="icon-feed"></span></span>
                    <#elseif 3 == notification.articleType>
                    <span class="tooltipped tooltipped-w" aria-label="${thoughtLabel}"><span class="icon-video"></span></span>
                    </#if>
                    <a rel="bookmark" href="${servePath}${notification.url}"> ${notification.articleTitle}</a>
                </h2>
                <div class="ft-gray ft-fade">
                    <#list notification.articleTagObjs as articleTag>
                    <a rel="tag" class="tag" href="${servePath}/tag/${articleTag.tagURI}">
                        ${articleTag.tagTitle}</a>
                    </#list>
                    •
                    ${notification.createTime?string('yyyy-MM-dd HH:mm')}
                </div>
                <#if notification.articleCommentCount != 0>
                <div class="cmts tooltipped tooltipped-w" aria-label="${cmtLabel}${quantityLabel}">
                    <a class="count ft-gray" href="${servePath}${notification.url}">${notification.articleCommentCount}</a>
                </div>
                </#if>
            </div>
            </#if>
        <#else>
            <div class="fn-flex-1">
                <div class="fn-flex">
                    <h2 class="fn-flex-1">
                    ${notification.description}
                    </h2>
                    <span class="ft-gray">
                        ${notification.createTime?string('yyyy-MM-dd HH:mm')}
                    </span>
                </div>
            </div>
        </#if>
    </li>
    </#list>
</ul>
<#else>
<div class="no-list">${noMessageLabel}</div>
</#if>

<@pagination url="${servePath}/notifications/at"/>
</@notifications>