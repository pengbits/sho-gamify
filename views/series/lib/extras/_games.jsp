	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		series ways to watch
	@file			series/lib/views/extras/_games.jsp
	@type			partial
	@author			ncavanagh	
	@desc			from global PCE feed (all series)
	--------------------------------------------------------------------------------
	--%>
	<c:set var="gamesPromotions" value="${data.gamesPromotions}"/>
	<div class="mod-body">
		<h2>Games</h2>
		<ul>
			<c:forEach items="${gamesPromotions}" var="game">
			<li class="clearfix">
				<div class="promo-img"><a href="<c:out value='${game.fieldMap["link"]}' />"><img alt="<c:out value='${game.fieldMap["headline"]}' />" src="<c:out value='${game.fieldMap["image_url"]}' />"></a></div>
				<p><a href="<c:out value='${game.fieldMap["link"]}' />"><c:out value='${game.fieldMap["headline"]}' /></a><c:out value='${game.fieldMap["copy_block"]}' /></p>
				<c:if test="${game.fieldMap['social_links'] != 'No'}">
					<tiles:insertDefinition name="modules.social.sharing_inline">
						<tiles:putAttribute name="shareUrl" value="${game.fieldMap['link']}" />
						<tiles:putAttribute name="headline" value="${game.fieldMap['headline']}" /></tiles:insertDefinition>
				</c:if>
			</li>
			</c:forEach>
		</ul>
	</div>
