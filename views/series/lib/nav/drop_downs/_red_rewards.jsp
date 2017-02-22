	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		_
	@file			series/lib/views/nav/drop_downs/_shop.jsp
	@type			partial
	@author			dpaul	
	@modfied		05.15.14
	@desc			# dropdown for red rewards nav item, this is in use for both gamified and non-gamified series
	--------------------------------------------------------------------------------
	--%>
	
	<c:set var="gamified_series"	value="${data.navigation.configuration.hasRedRewardsNav}" />
	<c:set var="gamify_base_url" 	value="${gamified_series ? data.series.baseUrl : '/sho'}/red-rewards" />
	
	<div id="nav-content-red-rewards" class="nav-content x1">
		<c:choose><c:when test="${gamified_series}">
			<tiles:insertTemplate template="./_promotional_nav_item.jsp">
				<tiles:putAttribute name="promo_key" value="redrewards" />
			</tiles:insertTemplate>
		</c:when><c:otherwise>
			
			<div class="nav-col nav-promo">												
					<div class="nav-promo-img">
						<a href="/sho/red-rewards/featured-challenges" data-behavior="track-click" data-click-id="series_nav:redrewards:Earn Points for Being a Fan">
							<img src="http://www.sho.com/site/image-bin/images/0_0_0/0_0_0_prm-rrstepsb_144x81.jpg" /></a>				
					</div>
					<a href="/sho/red-rewards/featured-challenges" data-behavior="track-click" data-click-id="series_nav:redrewards:Earn Points for Being a Fan"><b>Earn Points for Being a Fan</b></a>
				</div>
			
		</c:otherwise></c:choose>
		
		<div class="nav-col">
			<ul>
				<c:set var="challenges_url"	  value="${gamified_series ? 'challenges':'featured-challenges'}" />
				<c:set var="challenges_label" value="${gamified_series ? 'Challenges':'Featured Challenges'}" />
				<li><a href="${gamify_base_url}/${challenges_url}">${challenges_label}</a></li>
				<li><a href="${gamify_base_url}/achievements">Achievements</a></li>
				<li><a href="${gamify_base_url}/leaderboards">Leaderboards</a></li>
				<li><a href="${gamify_base_url}/redemption">Redemption</a></li>
				<li><a href="${gamify_base_url}/faq">FAQ</a></li>
			</ul>
		</div>
		
	</div>
