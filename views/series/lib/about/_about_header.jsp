	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		series about season module
	@file			series/lib/views/_about_season.jsp
	@type			partial
	@author			ncavanagh	
	@desc			
	--------------------------------------------------------------------------------
	--%>
	<c:set var="series" value="${data.series}"/>
	<c:set var="characterNavList" value="${data.navigation.characterNavList}"/>
	
	<div class="faux-carousel carousel">
		<div class="carousel-content">
			<div class="flash-panel"></div>
			<div class="panel">
				<c:choose>
				<c:when test="${!empty data.headerPromotion.imageUrl}">
					<img src="<c:out value='${data.headerPromotion.imageUrl}'/>" />
				</c:when>
				<c:otherwise>
					<img src="http://www.sho.com/assets/images/series/lib/about/panels/Cast_Generic_Silo_1024x512.jpg" />
				</c:otherwise>
				</c:choose>
				<div class="text-block align-vert">
					<span class="options tunein">
						<span class="accent"></span>
					</span>
					<span class="title">
						<c:choose>
							<c:when test="${empty data.headerPromotion.title}">
								about the series
							</c:when>
							<c:otherwise>
								<c:out value="${data.headerPromotion.title}"/>
							</c:otherwise>
						</c:choose>
					</span>
					<span class="description">
						<c:choose>
							<c:when test="${empty data.headerPromotion.subTitle}">
								<c:out value="${series.mediumDescription}"/>
							</c:when>
							<c:otherwise>
								<c:out value="${data.headerPromotion.subTitle}"/>
							</c:otherwise>
						</c:choose>
					</span>
					<c:if test="${!empty data.headerPromotion.callToActionList}">
						<span class="options more-info">
							<c:forEach items="${data.headerPromotion.callToActionList}" var="callToAction" varStatus="status">
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
			<c:if test="${!empty characterNavList}">
				<div class="docked carousel-filmstrip custom-width clearfix">
						<div id="carousel-thumb-0" class="thumb aktiv">
							<div class="thumb-inner">
								<div class="thumb-indicator"></div>
								<div class="title"><b>about the series</b></div>
							</div>
						</div>
					<div class="carousel-filmstrip-inner">
					<div class="docked carousel-filmstrip-bounds"></div> 
						 <c:forEach items="${characterNavList}" var="characterNav">
							<a href="<c:out value='${characterNav.url}'/>">
							<div id="carousel-thumb" class="thumb character-thumb">
								<c:choose>
									<c:when test="${!empty characterNav.image }" >
								<div class="thumb-inner" style="background-image: url(http://www.sho.com<c:out value='${characterNav.image.path}'/>);">
									</c:when>
									<c:otherwise>
								<div class="thumb-inner" style="background-image: url(http://www.sho.com/assets/images/series/lib/about/panels/Cast_Generic_Silo_160x80.jpg);">	
									</c:otherwise>
								</c:choose>
									<div class="thumb-indicator"></div>
									<div class="title"><b><c:out value="${characterNav.name}"/></b></div>
								</div>
							</div>
							</a>
						</c:forEach>
					</div>
				</div>	
			</c:if>		
		</div><!-- END carousel-content -->
	</div><!-- END carousel -->