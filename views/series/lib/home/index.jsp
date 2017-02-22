	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		series
	@file			series/lib/views/home/index.jsp
	@type			page
	@author			ncavanagh	
	@desc			series home page
	--------------------------------------------------------------------------------
	--%>
		
	<c:set var="characterNavList" value="${data.navigation.characterNavList}"/>	
	<c:set var="carouselList" value="${data.carousel}"/>
	<c:set var="vidURLPrefix" value="http://www.sho.com" />
	
	<div itemscope itemtype="http://schema.org/TVSeries">
		<meta itemprop="publisher" content="SHOWTIME" />
		<c:forEach items="${characterNavList}" var="character">
			<meta itemprop="actor" content="${character.name}" />
		</c:forEach>
		
		<c:forEach items="${carouselList.carouselPromotionList}" var="item">
			<c:forEach items="${item.callToActionList}" var="actionItem">
				<c:if test="${actionItem.type == 'video'}">
				   <meta itemprop="video" content="http://www.sho.com${actionItem.video.url}" />
				</c:if>			
			</c:forEach>
		</c:forEach>

		<tiles:insertDefinition name="series.tune-in.docked" />

		<tiles:insertDefinition name="carousel" />

		<tiles:insertDefinition name="series.secondary">
			<tiles:putAttribute name="email_signup"		value="left" />
		</tiles:insertDefinition>


		<%-- `todo: abstract this into a loop of some kind` --%>
		<c:if test="${!empty customValueMap['googleConversionLabel']}">
			<jsp:include page="/lib/views/pixels/_pixel_google.jsp">
				<jsp:param name='googleConversionLabel' value='${customValueMap["googleConversionLabel"]}' />			
			</jsp:include>
		</c:if>
		<c:if test="${!empty customValueMap['doubleclickTagUrl']}">
			<jsp:include page="/lib/views/pixels/_pixel_doubleclick.jsp">
				<jsp:param name='doubleclickTagUrl' value='${customValueMap["doubleclickTagUrl"]}' />			
			</jsp:include>
		</c:if>
		<c:if test="${!empty customValueMap['pixel33acrossUrl']}">
			<jsp:include page="/lib/views/pixels/_pixel_33across.jsp">
				<jsp:param name='pixel33acrossUrl' value='${customValueMap["pixel33acrossUrl"]}' />			
			</jsp:include>
		</c:if>
	
		<c:if test="${customValueMap['facebookTracking'] == 'default'}">
			<tiles:insertDefinition name="facebook_tracking" />
		</c:if>
		<c:if test="${customValueMap['facebookTracking'] == 'sports'}">
			<tiles:insertDefinition name="facebook_tracking.sports" />
		</c:if>
	
		<%-- # JIRA SITE-6507 Penny Dreadful --%> 
		<c:if test="${data.series.id == 1000323 || data.series.id == 1003223}">  
		<tiles:insertDefinition name="facebook_tracking">
			<tiles:putAttribute name="pixelId" value="1481884938701307" /></tiles:insertDefinition>
		</c:if>
	
	</div><!-- END itemscope -->
