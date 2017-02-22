<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%-- 

JSP
--------------------------------------------------------------------------------
@site			sho.com <rebuild>
@project		series tune-in
@file			series/lib/views/cast/_related_videos.jsp
@type			partial
@author			ncavanagh
--------------------------------------------------------------------------------
--%>
<tiles:importAttribute name="videos" />
<c:if test="${!empty videos}">
	<div class="mod thumb related-videos mod-videos">
		<div class="mod-body">
			<h2>Related Videos</h2>
			<ul>
				<c:forEach items="${videos}" var="video">
					<%-- PCE-generated video lists are returned with nested objects, due to PCE position property--%>
					<c:catch var ="catchException">
					   <c:set var="video" value="${video.video}" />
					</c:catch>
					<c:if test = "${catchException == null}">
					    <c:set var="video" value="${video}" />
					</c:if>
					<li class="clearfix">
						<div class="promo-img"><a data-behavior="play-video" data-video-id="${video.id}" href="<c:out value = '${video.url}'/>">
							<c:choose>
								<c:when test="${!empty video.image.path}">
									<img alt="<c:out value = '${video.title}'/>" src="http://www.sho.com${video.image.path}"/>
								</c:when>
								<c:otherwise>
									<img src="http://www.sho.com/site/image-bin/images/0_0_0/0_0_0_00_160x90.jpg"/>
								</c:otherwise>
							</c:choose>
							<img class="play-icon"  src="/assets/images/series/lib/icons/play-video_160x90.png"></a></div>
						<p><b><c:out value = '${video.title}'/></b><c:out value = '${video.description}'/></p>
					</li>
			     </c:forEach>
			</ul>
		</div>
	</div>
</c:if>