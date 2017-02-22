	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sports site build
	@project		polls page mobile
	@file			series/lib/views/polls/index.mobile.jsp
	@type			page
	@author			droy	
	@desc			polls stand alone template
	--------------------------------------------------------------------------------
	--%>
	<style type="text/css">
		.poll-wrapper {
			width:100%;
		}
		.poll-wrapper .c2 {
			background: none repeat scroll 0 0 #000000;
			padding: 0 0 40px;
		}
		.tune-in p {
			text-transform:uppercase;
			color:#fff;
		}
		.poll {
			min-height:250px;
			background:none repeat scroll 0 0 #1d1d1d;
			margin: 3% 3% 4% 3%;
			padding: 3%;
		}
		.promo-body {
			margin: 0 0 10px 0;
		}
		.posted-date {
			color:#2b8794;
			text-transform:uppercase;
			font-size: 14px!important;
		}
		.poll-name {
			font-size:16px;
			font-weight: 600;
			color:#fff;
			margin:5px 0 10px 0;
			text-transform: uppercase;
		}
		.poll-question {
			font-size:16px!important;
			color:#9b9b9b!important;
			font-weight:200!important;
			margin: 0!important;
			padding: 0 0 10px 0;
		}
		.poll-page .poll .status-results li span {
			color:#fff;
		}
		.poll-page .poll li {
			border: #1d1d1d solid 2px!important;
			padding: 0px!important;
			font-size: 14px;
		}
		.poll-page .poll .status-init .input-radio {
			top: 4px!important;
			left:4px!important;
		}
	</style>

	<section class="tune-in-block">
		<c:out value='${data.tuneIn}'/>
	</section>
	<div class="tune-in">
		<p>Episode <c:out value='${data.episodeItemView.title}'/> Polls</p>
	</div>
	<div class="mod-body">
		<p style="color:#fff;"><c:out value='${data.episodeItemView.longDescription}'/></p>
		<br>
		<div class="mod">
			<tiles:insertDefinition
				name="modules.social_components_urls" />
			<tiles:insertDefinition
				name="modules.social_components.content" >
				<tiles:putAttribute name="url" value="${global.requestUrl}" /></tiles:insertDefinition>
		</div>
	</div>

	<div class="poll-collection" data-id="<c:out value='${data.episodeItemView.id}'/>">
		<!-- assume some unique identifier will be needed to build url at sho.com/api/polls/page?id=xx -->
	</div>

	