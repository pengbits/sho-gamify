	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		gamify v3
	@file			my_activity/index.jsp
	@type			page
	@author			dpaul
	@modified		03.03.14
	@desc			my activity
	@note			notes
	-----------------------------------------------------------------------------
	--%>

	<tiles:insertDefinition name="modules.layouts.two_col_fixed_fluid">
		<tiles:putAttribute name="content_left">
	
			<tiles:insertDefinition name="gamify.user_snapshot">
				<tiles:putAttribute name="include_points_details"	value="false" />
				<tiles:putAttribute name="include_level"			value="true" />
				<tiles:putAttribute name="avatar_size"				value="large" />
				<tiles:putAttribute name="contextual_points"		value="false" />
			</tiles:insertDefinition>
			<tiles:insertDefinition name="gamify.vertical_nav" />

		</tiles:putAttribute>
		<tiles:putAttribute name="content_right">
			
			<h2 class="gamify-section-header">My Activity</h2>
			<%-- # not yet! SITE-7009, SITE-6709
			<tiles:insertDefinition name="gamify.activity_topline">
				<tiles:putAttribute name="theme" value="my-activity" />
			</tiles:insertDefinition> --%>
			<p style="height:20px">&nbsp;</p>
			
			<div class="row">
				<tiles:insertDefinition name="gamify.activity_stream">
					<tiles:putAttribute name="title"		value="In Progress" />
					<tiles:putAttribute name="classname" 	value="left" />
					<tiles:putAttribute name="src" 			value="challenge_progress" />
					<tiles:putAttribute name="sortby"		value="actionStatus" />
					<tiles:putAttribute name="filter"		value="list:yes" />
					<tiles:putAttribute name="folder"		value="www" />
				</tiles:insertDefinition>

				<tiles:insertDefinition name="gamify.activity_stream">
					<tiles:putAttribute name="title"		value="Completed" />
					<tiles:putAttribute name="classname"	value="right" />
					<tiles:putAttribute name="src" 			value="action_feed" />
				</tiles:insertDefinition>
			</div>

		</tiles:putAttribute>
	</tiles:insertDefinition>
