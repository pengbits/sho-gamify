	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		gamify
	@file			series/lib/views/gamify/leaderboards/index.jsp
	@type			page
	@author			ncavanagh
	@modified		03.11.14
	@note			# attributes passed to leaderboard tile so other pages can reuse this module
	@note			# switched from series specific leaderboard to global leaderboard for 6.3.15
	-----------------------------------------------------------------------------
	--%>
	
	<tiles:insertDefinition 
		name="gamify.two_col_layout">
		
		<tiles:putAttribute name="has_welcome_panel" 		value="false" />
		<tiles:putAttribute name="welcome_panel_remix"		value="false" />
		
		<tiles:putAttribute name="left">
			<tiles:insertDefinition name="gamify.user_snapshot" />
			
			<tiles:insertDefinition name="gamify.vertical_nav">
				<tiles:putAttribute name="base_url"			value="${data.series.baseUrl}" />
				<tiles:putAttribute name="theme"			value="series" />
			</tiles:insertDefinition>
			
		</tiles:putAttribute>

		<tiles:putAttribute name="right">
			
			<h2 class="gamify-section-header">Leaderboards</h2>
		
			<tiles:insertDefinition name="gamify.leaderboards">
				<tiles:putAttribute name="tags" value="product:shocom" />		
				<tiles:putAttribute name="count" value="20" />
				<tiles:putAttribute name="method" value="points" />			
				<tiles:putAttribute name="duration" value="ALLTIME" />
				<tiles:putAttribute name="operator" value="AND" />
				<tiles:putAttribute name="context" value="series" />		
			</tiles:insertDefinition>
		</tiles:putAttribute>  

	</tiles:insertDefinition>
	
