	<%@ page session="false"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		series
	@file			/series/lib/views/_header_promotion.jsp
	@type			partial
	@modified		06.08.12
	@author			ncavanagh	
	@desc			carousel-like header/image promotion
	@note			carousel videos not supported due to referenced tile having 
	@note			different variable names
	--------------------------------------------------------------------------------
	--%>
	<c:set var="promo" value="${data.headerPromotion}"/>
	<div class="carousel" id="header-promotion">
		<div class="carousel-content">
			<div class="flash-panel"></div>
			<c:choose>
				<c:when test="${!empty promo.mainCallToAction}">
					<c:set value="${promo.mainCallToAction}" var="mainCta" />
					<c:set value="${promo.mainCallToAction.type}" var="mainCtaType" />
					<c:set value="${mainCtaType == 'link' ? mainCta.url : mainCta.video.url}" var="mainCtaUrl" />
				</c:when>
				<c:otherwise>
					<c:set value="" var="mainCtaUrl" />
					<c:set value="" var="mainCtaType" />
				</c:otherwise>
			</c:choose>
			<div 
				<c:if test="${!empty mainCtaUrl}"> class="panel defaultCta" 
				data-default-cta-url="${mainCtaUrl}"</c:if><c:if test="${!empty mainCtaType}"> 
				data-default-cta-type="${mainCtaType}" 
				data-behavior="track-click" data-click-id="carousel:1:${fn:toLowerCase(promo.title)}"</c:if> 
				<c:if test="${empty mainCtaUrl}">  class="panel" </c:if>
				data-panel-index="1" 
				data-panel-duration="${promo.delay}" 
				data-promotion-id="${promo.id}">
				<img src="<c:out value='${promo.imageUrl}'/>" />
				<div class="text-block align-vert">
					<span class="options tunein"><c:out value="${promo.tuneIn}" escapeXml="false" /> <span class="accent"></span></span>
					<span class="title"><c:out value="${promo.title}" escapeXml="false" /></span>
				
				<c:if test="${!empty promo.subTitle}">
					<span class="sub-title"><c:out value="${promo.subTitle}" /></span>
				</c:if>
				
				<c:if test="${!empty promo.callToActionList}">
					<span class="options more-info">
						<c:forEach items="${promo.callToActionList}" var="callToAction" varStatus="status">
							<c:if test="${callToAction.type == 'video'}">
							<a href="${callToAction.video.url}" class="video" data-behavior="play-video" data-video-id="${callToAction.video.id}" data-click-id="carousel:1:${fn:toLowerCase(promo.title)}:${status.count}:${fn:toLowerCase(callToAction.subType)}:${fn:toLowerCase(callToAction.text)}">${callToAction.text}</a>
							</c:if>
							<c:if test="${callToAction.type != 'video'}">
							<a href="${callToAction.url}" class="more" data-behavior="track-click" data-click-id="carousel:1:${fn:toLowerCase(promo.title)}:${status.count}:${fn:toLowerCase(callToAction.subType)}:${fn:toLowerCase(callToAction.text)}">${callToAction.text}</a>
							</c:if>
						</c:forEach>
					</span>
				</c:if>
				</div>
			</div>
			
		
			<div class="docked carousel-filmstrip-bounds"></div> 
			<div class="docked carousel-filmstrip"></div>			

		</div><!-- END carousel-content -->
	</div><!-- END carousel -->
