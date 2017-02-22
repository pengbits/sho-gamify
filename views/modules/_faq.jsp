	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <desktop>
	@project		gamify
	@file			gamify/views/modules/_faq.jsp
	@type			component/tile
	@author			ncavanagh
	@modified		04.29.13
	@desc			# draws the markup of the gamification FAQs
	-----------------------------------------------------------------------------
	--%>
	
	<h2 class="gamify-section-header">Frequently Asked Questions</h2>
	<div class="gamify-faq-container">
		<dl>	
			<dt>Q: What is Red Rewards?</dt>
			<dd>A: Red rewards is a Showtime affinity program where members earn points and achievements for interacting on various digital platforms operated by Showtime (including SHO.com and Showtime apps for mobile, tablet, and TV). Points can be redeemed for real rewards on the <a href="/sho/red-rewards/redemption">Redeem Rewards</a> page.
				
			</dd>
		
			<dt>Q: Is Red Rewards free?</dt>
			<dd>A: Yes! All you have to do is create an account on SHO.com and opt-in to Red Rewards to get started!
			<c:if test="${!securityContext.isAuthenticated || securityContext.user.isGamificationParticipant != 'YES'}"> 			
				<a href="#" class="gamification-signup" id="login" data-behavior="track-click" data-click-id="get started now">Get Started Now</a></dd>
			</c:if>

			<dt>Q: How do I earn points and achievements?</dt>
			<dd>
				You earn points and achievements by completing challenges in which you perform specific actions, such as watching videos or viewing photo galleries. Challenges are either specific to a particular series, and all points and achievements earned are for that series, or for the network as a whole. All points earned for a series are counted towards your Showtime total as well. 
				Check out the <a href="/sho/red-rewards/featured-challenges">Featured Challenges Page</a> to see which challenges and series are currently available.
			</dd>
			
			<dt>Q: How do I level up?</dt>
			<dd>Once you reach the point threshold for a new level you will automatically be moved to that level, with a new set of challenges and achievements. See how high you can get!
				<!--<ul>
		          	<li>Level 1: <span>all users start here (0 pts needed)</span></li>
		            <li>Level 2: <span>2,001</span></li>
		            <li>Level 3: <span>3,001</span></li>
		            <li>Level 4: <span>5,001</span></li>
		            <li>Level 5: <span>8,001</span></li>
		            <li>Level 6: <span>10,001</span></li>
		            <li>Level 7: <span>50,001</span></li>
		        </ul>-->
				<!-- switch levels to list below for 1/5 build -->
		    	<ul>
		          	<li>Level 1: <span>all users start here (0 pts needed)</span></li>
		            <li>Level 2: <span>501</span></li>
		            <li>Level 3: <span>2,001</span></li>
		            <li>Level 4: <span>3,001</span></li>
		            <li>Level 5: <span>4,001</span></li>
		            <li>Level 6: <span>5,001</span></li>
		            <li>Level 7: <span>6,001</span></li>
					<li>Level 8: <span>7,001</span></li>
					<li>Level 9: <span>8,001</span></li>
					<li>Level 10: <span>9,001</span></li>
					<li>Level 11: <span>10,001</span></li>
					<li>Level 12: <span>50,001</span></li>
		        </ul>
			</dd>
			
			<dt>Q: What can I do with the points and achievements that I've earned?</dt>
			<dd>A: You can redeem your available points for real rewards, like merchandise from your favorite shows! Check out the <a href="/sho/red-rewards/redemption">Redeem Rewards</a> page to see the available rewards. You can redeem your points for one item every 10 days. Your points also determine your rank on the series leaderboard and demonstrate your superior skills as a fan.</dd>

			<dt>Q: Do my points or achievements expire?</dt>
			<dd>A: No, at this time points earned on Red Rewards have no expiration date. Showtime does reserve the right to change this policy at any time.</dd>

			<dt>Q: What are the official Red Rewards Terms of Service?</dt>
			<dd>A: <a href="/sho/about/terms-red-rewards">Terms</a></dd>

			<dt>Q: What should I do if I'm having technical difficulties or need customer support?</dt>
			<dd>A: Use our <a href="https://cbsi.secure.force.com/CBSi/submitcase?template=template_sho&referer=sho.com&cfs=default&data=">help form</a> to contact Showtime.</dd>

		</dl>
	</div>

	
