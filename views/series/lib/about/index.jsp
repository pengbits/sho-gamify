	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		series
	@file			series/lib/views/about/index.jsp
	@type			page
	@author			ncavanagh	
	@desc			about page 
	@note			this page now leverages on a series-specific PCE "headers" 
	@note           section for the top panel content
	--------------------------------------------------------------------------------
	--%>
	<c:set var="series" value="${data.series}"/>
	<c:set var="characterNavList" value="${data.navigation.characterNavList}"/>
	
	<tiles:insertDefinition name="series.tune-in.docked" />
	<tiles:insertDefinition name="series.about-header" />

	<div class="secondary table">
		<div class="tr">
			
			<div class="mod">
				<div class="mod-body">
					<tiles:insertDefinition name="modules.social_components_with_overlay" />
					<tiles:insertDefinition name="series.ways-to-watch" />
				</div>
			</div>
			
			<%--
			#	<c:choose>      
			#		<c:when test="${data.socializePromoFields.deliciousTag != null}">
			#		<tiles:insertDefinition name="series.news" />
			#		<tiles:insertDefinition name="series.about-season" />
			#	</c:when>
			#	<c:otherwise>
			#		<tiles:insertDefinition name="series.about-season" />
			#		<div class="mod"></div>
			#	</c:otherwise>
			#	</c:choose>
			--%>
			<div class="mod mod50 about-season">
				<c:if test="${data.aboutSeasonNumber != null}">
					<div class="mod-body">
						<tiles:insertDefinition name="series.about-season" />
					</div>
				</c:if>
			</div>
			
		</div>
	</div>