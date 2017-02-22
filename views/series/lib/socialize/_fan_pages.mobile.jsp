	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		socialize
	@file			_fan_pages.mobile.jsp
	@type			tile
	@author			dpaul
	@modified		11.30.12
	@note			# fan-pages module for use in socialize page
	@note			# currently, only disclosure-list has the toggle behavior,
	@note			# while the more generic 'disclosure list' is static. we should change this
	@note			# so that we don't have to use the disclosure-list classnames here
	-----------------------------------------------------------------------------
	--%>
	<tiles:importAttribute name="hero_img" ignore="true" />
	
	<c:if test="${!empty hero_img}">
	<img class="hero" src="${hero_img}" />
	</c:if>
	
	<div class="disclosure-list theme-social toggleable" data-component="sho.ui.mobile.DisclosureList">
		<div class="disclosure-list-header header-closed">
			<h1>Connect with Us <canvas class="icon-canvas icon-down"></canvas></h1>
		</div>

		<div class="disclosure-list-menu">
			<ul>
				<c:forEach items="${data.socialLinkMap}" var="socialLink">
					<li>
						<h2><a href="${socialLink.value.socialURL}">${socialLink.value.displayTitle}</a></h2>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div><!-- END modules.disclosure-list.social -->
	
	