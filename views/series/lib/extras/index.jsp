	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		apps & extras page
	@file			series/lib/views/extras/index.jsp
	@type			page
	@author			ncavanagh	
	@desc			apps-and-extras template
	@note			all extras pages get an In The Store module, default store view if needed
	--------------------------------------------------------------------------------
	--%>
	<tiles:insertDefinition name="series.tune-in.docked" />
	<tiles:insertDefinition name="series.header-promotion" />
	<div class="secondary">
		<div class="row">
			<div class="mod mod33 thumb">
				<tiles:insertDefinition name="series.games" />
			</div>
			<div class="mod mod33 thumb">
				<tiles:insertDefinition name="series.apps" />
			</div>
			<div class="mod mod33 thumb">
				<tiles:insertDefinition name="series.extras" />
				<c:set var="storeView" value="${!empty customValueMap['storeView'] ? customValueMap['storeView'] : 'showtime_dvds'}" />
				<tiles:insertDefinition name="series.in-the-store.default">
					<tiles:putAttribute name="view" value="${storeView}" />
				<tiles:putAttribute name="context" value="extras" />
				</tiles:insertDefinition>
			</div>
		</div>
	</div>