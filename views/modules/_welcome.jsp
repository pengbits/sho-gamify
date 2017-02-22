	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		gamify
	@file			gamify/views/modules/_welcome.jsp
	@type			component/tile
	@author			ncavanagh
	@modified		04.29.13
	@desc			# draws the markup of the gamification welcome message
	-----------------------------------------------------------------------------
	--%>

	<div class="gamify-welcome-container">
		<div class="gamify-welcome">
			
			<h1><span>Welcome to</span>
				 <em>Red Rewards</em>
			</h1>
			<h3>Now you can earn points, badges and real rewards just for checking out the SHO.com website.</h3>
			
			<p class="sign-up-now"><a href="#" id="login" class="gamification-signup" data-behavior="track-click" data-click-id="log in:faq panel">log in or sign up now!</a></p>
			
			<div class="reward-steps">
				<ul class="cf">
					<li>
						<h2>1. Log in or Register</h2>
						<p>
						<c:choose>
							<c:when test="${!securityContext.isAuthenticated || securityContext.user.isGamificationParticipant != 'YES'}"> 
								In order to participate, you need a SHO.com profile. <a href="#" id="login" class="gamification-signup" data-behavior="track-click" data-click-id="log in:instructions">Log in or register now</a> to get started. It's easy!							
							</c:when>
							<c:otherwise>
								<a href="#" id="login" class="gamification-signup">Log in or register now!</a>
							</c:otherwise>
						</c:choose>
						</p>
					</li>
					<li>
						<h2>2. Complete Challenges</h2>
						<p>Earn points via challenges and activities like watching videos, viewing photos, or sharing content. Collect badges and climb the leaderboard!</p>
					</li>
					<li>
						<h2>3. Earn Rewards</h2>
						<p>Redeem your points for real rewards, like merchandise from your favorite shows!</p>
					</li>
				</ul>
			</div>
		</div>
	</div>