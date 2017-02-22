	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		livefyre_dev
	@file			social_collections/_411_6_0_cast.mobile.jsp
	@type			partial
	@author			mlamoureaux
	@modified		01.15.13
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
						<span class="twitter-avatar"><img src="/assets/images/series/californication/socialize/twitter_authors/35x35/duchovny_35x35.jpg" width="48" height="48" /></span>
						<span class="twitter-author-name"><a href="http://twitter.com/davidduchovny">David Duchovny</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/davidduchovny">@davidduchovny</a></span>
					</h2>
				</li>
				<li>
					<h2>
						<span class="twitter-avatar"><img src="/assets/images/series/californication/socialize/twitter_authors/35x35/EvanHandler.jpg" width="48" height="48" /></span>
						<span class="twitter-author-name"><a href="http://twitter.com/EvanHandler">Evan Handler</a></span>
						<span class="twitter-author-handle"><a href="http://twitter.com/EvanHandler">@EvanHandler</a></span>
					</h2>
				</li>
				<li>
					<h2>
						<span class="twitter-avatar"><img src="/assets/images/series/californication/socialize/twitter_authors/35x35/adlon_35x35.jpg" width="48" height="48" /></span>
						<span class="twitter-author-name"><a href="http://twitter.com/pamelaadlon">Pamela Adlon</a></span>
						<span class="twitter-author-handle"><a href="http://twitter.com/pamelaadlon">@pamelaadlon</a></span>
					</h2>
				</li>
				<li>
					<h2>
						<span class="twitter-avatar"><img src="/assets/images/series/californication/socialize/twitter_authors/35x35/Tobolowsky.jpg" width="48" height="48" /></span>
						<span class="twitter-author-name"><a href="http://twitter.com/Tobolowsky">Stephen Tobolowsky</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/Tobolowsky">@Tobolowsky</a></span>
					</h2>
				</li>
				<li>
					<h2>
						<span class="twitter-avatar"><img src="/assets/images/series/californication/socialize/twitter_authors/35x35/cooper_35x35.jpg" width="48" height="48" /></span>
						<span class="twitter-author-name"><a href="http://twitter.com/TheOliverCooper">Oliver Cooper</a></span>
						<span class="twitter-author-handle"><a href="http://twitter.com/TheOliverCooper">@TheOliverCooper</a></span>
					</h2>
				</li>
				<li>
					<h2>
						<span class="twitter-avatar"><img src="/assets/images/series/californication/socialize/twitter_authors/35x35/holt_35x35.jpg" width="48" height="48" /></span>
						<span class="twitter-author-name"><a href="http://twitter.com/TaraHolt">Tara Holt</a></span>
						<span class="twitter-author-handle"><a href="http://twitter.com/TaraHolt">@TaraHolt </a></span>
					</h2>
				</li>
				<li>
					<h2>
						<span class="twitter-avatar"><img src="/assets/images/series/californication/socialize/twitter_authors/35x35/MaggieGrace.jpg" width="48" height="48" /></span>
						<span class="twitter-author-name"><a href="http://twitter.com/MaggieGrace">Maggie Grace</a></span>
						<span class="twitter-author-handle"><a href="http://twitter.com/MaggieGrace">@MaggieGrace </a></span>
					</h2>
				</li>
				<li>
					<h2>
						<span class="twitter-avatar"><img src="/assets/images/series/californication/socialize/twitter_authors/35x35/jorgegarcia.jpg" width="48" height="48" /></span>
						<span class="twitter-author-name"><a href="http://twitter.com/jorgegarcia">Jorge Garcia</a></span>
						<span class="twitter-author-handle"><a href="http://twitter.com/jorgegarcia">@jorgegarcia </a></span>
					</h2>
				</li>
			</ul>
		</div>
	</div><!-- END modules.ways_to_watch -->

