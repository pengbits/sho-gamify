	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		livefyre_dev
	@file			social_collections/_408_4_0_cast.mobile.jsp
	@type			partial
	@author			dpaul
	@modified		01.14.13
	@note			# contains list of talent tweeters for cast module in socialize page
	@note			# currently, only ways-to-watch has the toggle behavior,
	@note			# while the more generic 'disclosure list' is static. we should change this
	@note			# so that we don't have to use the ways-to-watch classnames here
	-----------------------------------------------------------------------------
	--%>
	<div class="disclosure-list theme-twitter toggleable" data-component="sho.ui.mobile.DisclosureList">
		<div class="disclosure-list-header header-closed">
			<h1>Follow the Leads <canvas class="icon-canvas icon-down"></canvas></h1>
		</div>

		<div class="disclosure-list-menu">
			<ul>
				<li>
					<h2>
							<span class="twitter-avatar"><img src="/assets/images/series/theaffair/socialize/twitter_authors/128x128/DominicWest.jpg" width="48" height="48" /></span>
							<span class="twitter-author-name"><a href="http://twitter.com/DominicWest">Dominic West</a></span>
							<span class="twitter-author-handle"><a href="http://twitter.com/DominicWest">@DominicWest</a></span>
					</h2>
				</li>				
				<li>
					<h2>
							<span class="twitter-avatar"><img src="/assets/images/series/theaffair/socialize/twitter_authors/128x128/JoshuaJackson.jpg" width="48" height="48" /></span>
							<span class="twitter-author-name"><a href="http://twitter.com/VancityJax">Joshua Jackson</a></span>
							<span class="twitter-author-handle"><a href="http://twitter.com/VancityJax">@VancityJax</a></span>
					</h2>
				</li>
				<li>
					<h2>
							<span class="twitter-avatar"><img src="/assets/images/series/theaffair/socialize/twitter_authors/128x128/SarahTreem.jpg" width="48" height="48" /></span>
							<span class="twitter-author-name"><a href="http://twitter.com/SarahTreem">Sarah Treem</a></span>
							<span class="twitter-author-handle"><a href="http://twitter.com/SarahTreem">@SarahTreem</a></span>
					</h2>
				</li>
				<li>
					<h2>
							<span class="twitter-avatar"><img src="/assets/images/series/theaffair/socialize/twitter_authors/128x128/JuliaGTelles.jpg" width="48" height="48" /></span>
							<span class="twitter-author-name"><a href="http://twitter.com/JuliaGTelles">Julia Goldani Telles</a></span>
							<span class="twitter-author-handle"><a href="http://twitter.com/JuliaGTelles">@JuliaGTelles</a></span>
					</h2>
				</li>
				<li>
					<h2>
							<span class="twitter-avatar"><img src="/assets/images/series/theaffair/socialize/twitter_authors/128x128/NicoletteRobinson.jpg" width="48" height="48" /></span>
							<span class="twitter-author-name"><a href="http://twitter.com/NicoletteKloe">Nicolette Robinson</a></span>
							<span class="twitter-author-handle"><a href="http://twitter.com/NicoletteKloe">@NicoletteKloe</a></span>
					</h2>
				</li>
				<li>
					<h2>
							<span class="twitter-avatar"><img src="/assets/images/series/theaffair/socialize/twitter_authors/128x128/VictorWilliams.jpg" width="48" height="48" /></span>
							<span class="twitter-author-name"><a href="http://twitter.com/BigVicWilliams">Victor Williams</a></span>
							<span class="twitter-author-handle"><a href="http://twitter.com/BigVicWilliams">@BigVicWilliams</a></span>
					</h2>
				</li>
				<li>
					<h2>
							<span class="twitter-avatar"><img src="/assets/images/series/theaffair/socialize/twitter_authors/128x128/ColinDonnell.jpg" width="48" height="48" /></span>
							<span class="twitter-author-name"><a href="http://twitter.com/colindonnell">Colin Donnell</a></span>
							<span class="twitter-author-handle"><a href="http://twitter.com/colindonnell">@colindonnell</a></span>
					</h2>
				</li>
			</ul>
		</div>
	</div><!-- END modules.ways_to_watch -->

