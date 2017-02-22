	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		gamify
	@file			gamify/views/modules/_leaderboards.jsp
	@type			component/tile
	@author			ncavanagh
	@modified		09.22.14
	@desc			# draws the markup needed to trigger the leaderboards component
	@note			# adding in attributes so module can be reused	
	@note			# removed h2 entirely
	-----------------------------------------------------------------------------
	--%>

	<tiles:useAttribute name="tags"	ignore="false"/> 
	<c:set var="tags" value="${!empty tags? tags : 'product:shocom' }" />

	<tiles:useAttribute name="count" ignore="false"/>
	<c:set var="count" value="${!empty count? count : 20 }" />

	<tiles:useAttribute name="method"	ignore="false"/>
	<c:set var="method" value="${!empty methods? methods : 'points' }" />

	<tiles:useAttribute name="duration"	ignore="false"/>
	<c:set var="duration" value="${!empty duration? duration : 'ALLTIME' }" />

	<tiles:useAttribute name="operator"	ignore="false"/>
	<c:set var="operator" value="${!empty operator? operator : 'AND' }" />

	<div class="nitro-widget leaderboards" 
		data-component="sho.gamify.leaderboards.Widget"
		data-defer="nitro:init"
		data-leaderboard-method="${method}"
		data-leaderboard-count="${count}"
		data-leaderboard-duration="${duration}"
		data-leaderboard-tags-operator="${operator}"
		data-leaderboard-tags="${tags}">
		
		<div class="leaderboard-controls clearfix">
			<div rel="prev" class="leaderboard-prev leaderboard-control"></div> 
			<div class="leaderboard-nav dropdown clearfix">
				<!--<p>alternate content</p>-->
			</div>
			<div rel="next" class="leaderboard-next leaderboard-control"></div> 
		</div>
		<div class="leaderboard-stage"></div>
	</div>
	