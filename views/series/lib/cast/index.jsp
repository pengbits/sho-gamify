	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
	<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		series
	@file			series/lib/views/cast/index.jsp
	@type			page
	@author			ncavanagh	
	@desc			cast page			
	@note			if related videos < 1, actor bio shifts over
	--------------------------------------------------------------------------------
	--%>
	<c:set var="castInfo" value="${data.castInfo}"/>
	<c:set var="characterNavList" value="${data.navigation.characterNavList}"/>
	<c:set var="charFirstName" value="${fn:split(data.castInfo.talent.name, ' ')[0]}"/>
	<c:set var="charLastName" value="${fn:split(data.castInfo.talent.name, ' ')[1]}"/>
	
	<c:forEach items="${characterNavList}" var="characterNav">
		<c:if test="${characterNav.isCurrent == 'true'}">
			<c:set var="characterUrl" value="${characterNav.url}"/>
		</c:if>
	</c:forEach>
		
	<tiles:insertDefinition name="series.tune-in.docked" />
	<div class="faux-carousel carousel">
		<div class="carousel-content">
			<div class="flash-panel"></div>
			<div class="panel">
				<c:choose>
					<c:when test="${!empty castInfo.image }" >
						<img src="http://www.sho.com${castInfo.image.path}" alt="${castInfo.character.name}" />
					</c:when>
					<c:otherwise>
						<img src="/assets/images/series/lib/Cast_Generic_Silo_1024x512.jpg" />		
					</c:otherwise>
				</c:choose>
				<div class="text-block align-vert" itemscope itemtype="http://schema.org/Person">
					<span class="options tunein">
						<span class="accent"></span>
					</span>
					<span class="title" itemprop="name"><c:out value='${castInfo.character.name}'/></span>
					<c:if test="${castInfo.character.description != null}" >
						<span class="description" itemprop="description"><c:out value="${castInfo.character.description}" escapeXml="false"/></span>
					</c:if>				
					<tiles:insertDefinition name="modules.social.sharing_inline">
						<tiles:putAttribute name="shareUrl" value="${characterUrl}" />
						<tiles:putAttribute name="headline" value="${castInfo.character.name}" /></tiles:insertDefinition>
				</div>
			</div>
			<div class="docked carousel-filmstrip custom-width clearfix">
				<div id="carousel-thumb-0" class="thumb">
					<div class="thumb-inner">
						<div class="thumb-indicator"></div>
						<a href="${data.series.baseUrl}/about" class="title"><b>about the series</b></a>
					</div>
				</div>
				<div class="carousel-filmstrip-inner">
				<div class="docked carousel-filmstrip-bounds"></div> 
					 <c:forEach items="${characterNavList}" var="characterNav">
					 <c:choose>
						<c:when test="${characterNav.isCurrent != 'true'}">						
							<a href="<c:out value='${characterNav.url}'/>">
							<div id="carousel-thumb" class="thumb character-thumb">
							<c:choose>
								<c:when test="${!empty characterNav.image }" >
								<div class="thumb-inner" style="background-image: url(http://www.sho.com<c:out value='${characterNav.image.path}'/>);">
								</c:when>
								<c:otherwise>
									<div class="thumb-inner" style="background-image: url(/assets/images/series/lib/Cast_Generic_Silo_160x80.jpg);">	
								</c:otherwise>
							</c:choose>
									<div class="thumb-indicator"></div>
									<div class="title"><b><c:out value="${characterNav.name}"/></b></div>
								</div>
							</div>
							</a>
						</c:when>
						<c:otherwise>
					      	<div id="carousel-thumb" class="thumb aktiv character-thumb">
							<c:choose>
								<c:when test="${!empty characterNav.image }" >
								<div class="thumb-inner" style="background-image: url(http://www.sho.com<c:out value='${characterNav.image.path}'/>);">
								<meta itemprop="image" content="http://www.sho.com<c:out value='${characterNav.image.path}'/>" />
								
								</c:when>
								<c:otherwise>
									<div class="thumb-inner" style="background-image: url(/assets/images/series/lib/Cast_Generic_Silo_160x80.jpg);">	
								</c:otherwise>
							</c:choose>
									<div class="thumb-indicator"></div>
									<div class="title"><b><c:out value="${characterNav.name}"/></b></div>
								</div>
							</div>
					     </c:otherwise>
					</c:choose>	
					</c:forEach>
				</div>
			</div>			
		</div><!-- END carousel-content -->
	</div><!-- END carousel -->
	<div class="secondary ">
		<div class="row table" itemscope itemtype="http://schema.org/Person">
			<div class="mod">
				<div class="mod-body">
					<tiles:insertDefinition name="modules.social_components_with_overlay" />
					<tiles:insertDefinition name="series.ways-to-watch" />
				</div>
			</div>		
			<c:choose>	
				<c:when test="${!empty charFirstName || !empty charLastName}" >
					<meta itemprop="givenName" content="${charFirstName}" />
					<meta itemprop="familyName" content="${charLastName}" />
				</c:when>							
			</c:choose>	
					
			<c:choose>	
				<c:when test="${!empty castInfo.relatedVideoList}" > 
					<tiles:insertDefinition name="series.related-videos">
						<tiles:putAttribute name="videos" value="${castInfo.relatedVideoList}" />
					</tiles:insertDefinition>
					<div class="actor-bio mod mod50">
						<div class="mod-body" itemprop="description">
							<h2 itemprop="name"><c:out value="${castInfo.talent.name}"/></h2>
							<p><c:out value="${castInfo.talent.biography}" escapeXml="false"/></p>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="actor-bio mod mod50">
						<div class="mod-body" itemprop="description">
							<h2 itemprop="name"><c:out value="${castInfo.talent.name}"/></h2>
							<p><c:out value="${castInfo.talent.biography}" escapeXml="false"/></p>
						</div>
					</div>
					<div class="mod"></div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>