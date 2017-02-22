	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		livefyre_dev
	@file			social_collections/_ 1000323_1_0_cast.mobile.jsp
	@type			partial
	@author			droy
	@modified		03.17.14
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
				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/pennydreadful/socialize/128x128/5_Twitter-profile_128X128.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/reevecarney">Reeve Carney</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/reevecarney">@reevecarney</a></span></h2>
				</li>

				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/pennydreadful/socialize/128x128/1_Twitter-profile_128X128.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/billiepiper">Billie Piper</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/billiepiper">@billiepiper</a></span></h2>
				</li>

				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/pennydreadful/socialize/128x128/2_Twitter-profile_128X128.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/DannySapani">Danny Sapani</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/DannySapani">@DannySapani</a></span></h2>
				</li>

				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/pennydreadful/socialize/128x128/4-Twitter-profile_128X128.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/FilmBayona">J.A. Bayona</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/FilmBayona">@FilmBayona</a></span></h2>
				</li>

				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/pennydreadful/socialize/128x128/3-Twitter-profile_128X128.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/JamesEHawes">James Hawes</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/JamesEHawes">@JamesEHawes</a></span></h2>
				</li>
			</ul>
		</div>
	</div><!-- END modules.ways_to_watch -->

			