	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		series carousel
	@file			series/lib/views/_carousel.jsp
	@type			partial
	@author			ncavanagh	
	@desc			<c : out value='${callToAction.subType}'/> for custom tracking
	--------------------------------------------------------------------------------
	--%>
	<c:set var="carousel" value="${data.carousel}"/>
	<div class="carousel series-carousel">
		<div class="carousel-content">
				<div class="flash-panel"></div>
				<c:forEach items="${carousel.carouselPromotionList}" var="carouselPromotion">
				<div class="panel">
					<img src="<c:out value='${carouselPromotion.imageUrl}'/>" />
					<div class="text-block align-vert">
						<span class="options tunein"><c:out value="${carouselPromotion.tuneIn}" escapeXml="false" /> <span class="accent"></span></span>
						<span class="title"><c:out value="${carouselPromotion.title}" escapeXml="false" /></span>
						<c:if test="${!empty carouselPromotion.subTitle}">
						<span class="sub-title"><c:out value="${carouselPromotion.subTitle}" /></span>
						</c:if>
						<c:if test="${!empty carouselPromotion.callToActionList}">
						<span class="options more-info">
							<c:forEach items="${carouselPromotion.callToActionList}" var="callToAction">
							<c:choose>
								<c:when test="${callToAction.type == 'link'}">
								<a href="<c:out value='${callToAction.url}'/>" class="more"><c:out value="${callToAction.text}" /></a>
								</c:when>
								<c:when test="${callToAction.type == 'video'}">
								<a href="#vams:<c:out value='${callToAction.video.id}'/>" class="video"><c:out value="${callToAction.text}" /></a>
								</c:when>
							</c:choose>
							</c:forEach>
						</span>
						</c:if>
					</div>
				</div>
				</c:forEach>
			<div class="docked carousel-filmstrip-bounds"></div> 
			<div class="docked carousel-filmstrip"></div>			
		</div><!-- END carousel-content -->
	</div><!-- END carousel -->