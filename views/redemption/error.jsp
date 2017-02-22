	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		gamify
	@file			gamify/views/redemption/error.jsp
	@type			page
	@author			wlee	
	@desc			# red-rewards redemption error page
	--------------------------------------------------------------------------------
	--%>


		<div id="nav-secondary" class="nav docked nav-secondary">
			<span class="page-title">Red Rewards</span>
		</div>
		
		<div class="redemption-column error">
			<h1 class="messaging-header">Sorry, we are unable to process your order at this time.</h1>
			<a href="/sho/red-rewards/redemption" class="button">try again</a>
		</div>