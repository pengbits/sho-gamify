	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		series
	@file			series/lib/views/cast/index.mobile.jsp
	@type			page
	@author			dpaul	
	@desc			cast page for series / mobile
	@modified		08.23.12
	@todo			# paragraphs need style
	--------------------------------------------------------------------------------
	--%>
	<c:set var="character_fallback_image" 	value="/assets/images/series/lib/Cast_Generic_Silo_1024x512.jpg" />
	<c:set var="character_hero_image" 		value="${!empty data.castInfo.image ? data.castInfo.image.path : character_fallback_image}" />
	
	<c:set var="loan" value="Property Loan" scope="request" />
	<c:set var="character_description"		value="${data.castInfo.character.description}" />
	<c:set var="character_bio"				value="${data.castInfo.talent.biography}" />
	<%-- 'remove artifacts from rich-text-editor, convert <div>...</div> to <p>...</p>' --%>
	<c:set var="character_bio"				value="${fn:replace(fn:replace(character_bio, '<div>' , '<p>'), '</div>', '</p>')}" />
	<c:set var="character_bio"				value="${fn:replace(character_bio, '<p>&nbsp;</p>' , '')}" />
	
	<c:forEach items="${data.navigation.characterNavList}" var="c">
		<c:if test="${c.isCurrent == 'true'}"><c:set var="character_url" value="${c.url}"/></c:if>
	</c:forEach>
	
	<tiles:insertDefinition name="modules.tune_in_block">
		<tiles:putAttribute name="tunein_text" value="${data.tuneIn}" />
	</tiles:insertDefinition>
	
	<div class="carousel-image-area">
		<img src="http://www.sho.com${data.castInfo.image.path}">
        <div class="carousel-text-block font-small">
        	<span class="accent"></span>
        	<span class="title">${data.castInfo.character.name}</span>
        </div>
	</div>
		
	<c:if test="${!empty character_description}">		
		${character_description}
	</c:if>
	
	<tiles:insertDefinition
		name="modules.social_components_urls" />
	<tiles:insertDefinition
		name="modules.social_components.content" >
		<tiles:putAttribute name="url" value="http://www.sho.com${character_url}" />
		<tiles:putAttribute name="twitter_text" value="${data.castInfo.character.name}" /></tiles:insertDefinition>

	<tiles:insertDefinition 
		name="modules.section_header.gradient">
		<tiles:putAttribute name="title" value="${data.castInfo.talent.name}" /></tiles:insertDefinition>	
	
	<c:if test="${!empty character_bio}">
		<c:out value="${character_bio}" escapeXml="false" /></c:if>
        
	<tiles:insertDefinition 
		name="series.related_videos.mobile">
		<tiles:putAttribute name="videos" value="${data.castInfo.relatedVideoList}" /></tiles:insertDefinition>

		