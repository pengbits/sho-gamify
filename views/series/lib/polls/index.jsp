	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sports site build
	@project		polls page
	@file			series/lib/views/polls/index.jsp
	@type			page
	@author			droy	
	@desc			polls stand alone template
	--------------------------------------------------------------------------------
	--%>
	<div class="two-col-25-75 poll-wrapper">
		<div class="c1">
			<div class="tune-in">
				<p><c:out value='${data.tuneIn}'/></p>
			</div>
			<div class="poll-title">
				<h2>Episode <c:out value='${data.episodeItemView.title}'/> Polls</h2>
			</div>
			<div class="mod-body poll-summary">
				<p style="color:#999;"><c:out value='${data.episodeItemView.longDescription}'/></p>			
				<tiles:insertDefinition name="modules.social.sharing_inline">
					<tiles:putAttribute name="shareUrl" value="${global.requestUrl}" />
					<tiles:putAttribute name="headline" value="" /></tiles:insertDefinition>
			</div>
		</div>
		<div class="c2">
			<div class="poll-collection" data-id="<c:out value='${data.episodeItemView.id}'/>">
				<!-- assume some unique identifier will be needed to build url at sho.com/api/polls/page?id=xx -->
			</div>
		</div>
	</div>
	