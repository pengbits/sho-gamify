	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		generic series
	@file			series/lib/views/socialize/index.jsp
	@type			page
	@author			ncavanagh
	@author			dpaul
	@author			droy
	@desc			# socialize page in series sites
	@todo			# convert uneccesary choose statements to simple if tests
	--------------------------------------------------------------------------------
	--%>
	
	<tiles:importAttribute scope="request" />
	<c:set var="article_id_series" value="${data.series.id}_0_0" />
	<c:set var="article_id_season" value="${customValueMap['livefyreCollectionPrefix']}" />

	<c:choose>
		<c:when test="${include_socialize_modules == 'legacy'}">

			<c:set var="socialDropdownNavList" value="${data.navigation.socialDropdownNavList}"/>
			<c:set var="hasBoardsLink" value="false"/>
			<c:if test="${!empty socialDropdownNavList}">
				<c:forEach items="${socialDropdownNavList}" var="dropdownNavItem">
					<c:if test="${dropdownNavItem.fieldMap.link_text == 'Message Boards'}">
						<c:set var="boardsLink" value="${dropdownNavItem.fieldMap.link}"/>
						<c:set var="hasBoardsLink" value="true"/>
					</c:if>
				</c:forEach>
			</c:if>

			<div class="table">
				<div class="tr">
					<div class="td td1">
						<tiles:insertDefinition name="series.tune-in" />
						<div class="mod">
							<div class="mod-body">
								<tiles:insertDefinition name="modules.social_components_with_overlay" />
								<c:if test="${hasBoardsLink == 'true'}">
									<div class="boards clearfix">
										<h3>Discuss on the Boards</h3>
										<a href="<c:out value='${boardsLink}'/>">Message Board</a><p>Talk about <c:out value="${data.series.displayTitle}"/> on the show's message board.</p>
									</div>
								</c:if>
							</div>
						</div>
					</div>
		
					<div class="td td2">
						<div class="module social-stream-outer">
						<h2>Share Your Thoughts</h2>
						<p>Join the conversation without leaving SHO.com. Discuss the latest episode, the current season, or anything else series related. Log in to get started.</p>
	
						<tiles:insertDefinition name="modules.social.social_stream">
							<tiles:putAttribute name="livefyre_article_id" value="${data.series.id}_0_0" />
						</tiles:insertDefinition>
						
						</div>
					</div><!-- END td2 -->
				</div><!-- END tr -->
			</div><!-- END table -->

		</c:when><%-- ' END legacy socialize page'
		-----------------------------------------------------------------------------------------------------------%>

		<c:otherwise>
			<tiles:insertDefinition name="series.tune-in" />

			<div class="socialize-masthead">
				<h1>Join the ${fn:replace(data.series.displayTitle,'The ','')} Community</h1>
			</div>
			<hr />

			<%-- '
			new: determine path to fan-pages image dynamically! '--%>
			<c:set var="hero_img_prefix"   value="${fn:toLowerCase(fn:replace(data.series.shortTitle, ' ', ''))}" />
			<c:set var="hero_img_path"	   value="/assets/images/series/${hero_img_prefix}/socialize/${hero_img_prefix}-fan-page_180x180.jpg" />
	
			<div class="socialize-body clearfix three-cols">
				<div class="col two">
			
				<c:choose>	
					<c:when test="${fn:contains(include_socialize_modules, 'stream')}"> 
					<div class="module social-stream-outer">
						<h2>Share Your Thoughts</h2>
						<p>Join the conversation without leaving SHO.com. Discuss the latest episode, the current season, or anything else series related. Log in to get started.</p>
							
						<tiles:insertDefinition 
							name="modules.social.social_stream">
							<tiles:putAttribute name="livefyre_article_id" value="${article_id_series}" /></tiles:insertDefinition>
					</div><!-- END social-stream-outer -->
					</c:when>
				</c:choose><%-- 'END social stream module' --%>	
		
				</div><!-- END col -->
				<div class="col one">
	
				<c:choose>	
					<c:when test="${fn:contains(include_socialize_modules, 'fanpages')}">
					<tiles:insertDefinition 
						name="modules.social.fan_pages">			
						<tiles:putAttribute name="hero_img" value="${hero_img_path}" />
						<tiles:putAttribute name="livefyre_article_id" value="${article_id_series}" /></tiles:insertDefinition>
					</c:when>
				</c:choose><%-- 'END fanpages/connect with us module' --%>
		
				</div><!-- END col -->
				<div class="col three">
		
				<c:choose>	
					<c:when test="${fn:contains(include_socialize_modules, 'cast')}">
					<tiles:insertDefinition 
						name="modules.social.social_collection">
						<tiles:putAttribute name="livefyre_article_id" 		value="${article_id_season}_cast" />
						<tiles:putAttribute name="collection_title" 		value="Follow the Leads" />
						<tiles:putAttribute name="collection_description" 	value="Twitter handles of the people behind the show" />
						<tiles:putAttribute name="max_items" 				value="5" />
						<tiles:putAttribute name="include_twitter_authors" 	value="true" /></tiles:insertDefinition>
					</c:when>
				</c:choose><%-- 'END cast module' --%>
	
				<c:choose>	
					<c:when test="${fn:contains(include_socialize_modules, 'press')}">
					<tiles:insertDefinition 
						name="modules.social.social_collection">
						<tiles:putAttribute name="livefyre_article_id" 		value="${article_id_season}_press" />
						<tiles:putAttribute name="collection_title" 		value="Press" />
						<tiles:putAttribute name="collection_description" 	value="From the press, the blogosphere, and beyond" />
						<tiles:putAttribute name="max_items" 				value="5" /></tiles:insertDefinition>
					</c:when>
				</c:choose><%-- 'END press module' --%>
		
				</div><!-- END col -->
			</div><!-- END socialize-body -->
		
		</c:otherwise> <%-- 'END all new modules' --%>
	
	</c:choose>
