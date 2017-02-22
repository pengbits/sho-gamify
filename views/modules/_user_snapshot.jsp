	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		gamify
	@file			gamify/views/modules/_user_snapshot.jsp
	@type			component/tile
	@author			ncavanagh
	@author			dpaul
	@modified		06.03.14
	@desc			# changing defaults to reflect the move to generic points everywhere
	-----------------------------------------------------------------------------
	--%>
	<tiles:useAttribute name="theme"				ignore="true" />
	<c:set var="theme"								value="${!empty theme ? theme : 'generic'}" /> 		

	<tiles:useAttribute name="include_points_details" ignore="true" />
	<c:set var="include_points_details"				value="${!empty include_points_details ? include_points_details : false}" /> 

	<tiles:useAttribute name="include_level"		ignore="true" />
	<c:set var="include_level"						value="${!empty include_level ? include_level : true}" /> 		
	
	<tiles:useAttribute name="fpo_avatar"			ignore="true" />
	<c:set var="fpo_avatar"							value="${!empty fpo_avatar ? fpo_avatar : false}" /> 		
	
	<tiles:useAttribute name="avatar_size"			ignore="true" />
	<c:set var="avatar_size"						value="${!empty avatar_size ? avatar_size : 'small'}" /> 		
	
	<tiles:useAttribute name="contextual_points"	ignore="true" />
	<c:set var="contextual_points"					value="${!empty contextual_points ? contextual_points : false}" /> 		
		
	<c:set var="default_avatar" 					value="http://www.sho.com/assets/images/accounts/avatars/generic/90x90/Generic_90x90.png" />
	<c:set var="is_authenticated" 					value="${securityContext.isAuthenticated}" />
	<c:set var="user"								value="${securityContext.user}" />
	<c:set var="is_gamified" 						value="${is_authenticated && user.isGamificationParticipant == 'YES' }" />
	<c:set var="points_key" 						value="${contextual_points ? 'contextualPointsBalance' : 'pointsBalance'}" />
	<c:set var="user_points"						value="${is_gamified ? user.gamification[points_key].lifetimeBalance : '0'}" />
	<c:set var="levels_total"						value="12" /> <%-- change to 12 for 1/5 build --%>
	<c:set var="points_label"						value="${contextual_points ? 'Points' : 'Total Lifetime Points'}" />
	
	<%-- `define lists for itemized points labels/values` --%>
	<c:set var="countable_keys"   	   				value="video,photo,comment,share" />
	<c:set var="countable_labels_str"  				value="Videos Watched,Photo Galleries Viewed,Comments Posted,Content Shared" />
	<c:set var="countable_labels"	   				value="${fn:split(countable_labels_str, ',')}" />
	
	<script>
	// contextual_points : ${contextual_points}
	// points_key: ${points_key}
	
	</script>
	
	<div class="nitro-widget user-snapshot ${avatar_size}-avatar theme-${theme}" data-component="sho.gamify.usersnapshot.Widget">
		<c:if test="${is_authenticated}"> 
			<div class="user-snapshot-top">
				<img class="user-snapshot-avatar" src="${user.avatar != null ? user.avatar.url : default_avatar}"/>
				<div class="user-snapshot-name">${user.username}</div>
			</div>
			<div class="user-snapshot-border"></div>
		</c:if>
		
		<div class="user-snapshot-points group">
			
			<div class="${include_level ? 'left ':''}user-snapshot-callout user-snapshot-callout-points">
				<h4>
					${user_points}
				</h4>
				<p>${points_label} <a id="points-info" class="gamify-icon-info" href="#"></a></p>
			</div>
			
		<c:if test="${include_level}">
		
			<div class="right user-snapshot-callout user-snapshot-callout-level">				
				<c:set var="level_str" value="${!empty user.gamification && !empty user.gamification.level ? user.gamification.level.name : 'Level 1'}" />
				<c:set var="level_int" value="${fn:replace(level_str, 'Level ', '')}" />
				
				<h4>
				 	${level_int}/${levels_total}
				</h4>
				<p>Level  <a id="level-info" class="gamify-icon-info" href="#"></a></p>
			</div>	
			
		</c:if>
		<c:if test="${include_points_details}">
			<tiles:insertDefinition name="gamify.activity_topline">
				<tiles:putAttribute name="theme" value="user-snapshot" />
			</tiles:insertDefinition>
		</c:if>
	</div>
	
	<c:if test="${!is_authenticated || !is_gamified}"> 			
		<a href="#" id="login" class="gamification-signup" data-behavior="track-click" data-click-id="log in:left col">Log In or Sign Up Now!</a>
	</c:if>
	
			
	</div>