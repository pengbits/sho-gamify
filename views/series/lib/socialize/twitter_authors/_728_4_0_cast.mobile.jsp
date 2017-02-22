	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		livefyre_dev
	@file			social_collections/_654_5_0_cast.mobile.jsp
	@type			partial
	@author			droy
	@modified		03.19.13
	@note			# contains list of talent tweeters for cast module in socialize page -the big c
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
					<span class="twitter-avatar"><img src="/assets/images/series/thebigc/socialize/twitter_authors/Big-C-Socialize-Twitter-GabeBasso-35x35.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/GabeBasso">Gabriel Basso</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/GabeBasso">@GabeBasso</a></span></h2>
				</li>

				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/thebigc/socialize/twitter_authors/Big-C-Socialize-Twitter-JennyBicks-35x35.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/JennyBicks">Jenny Bicks (EP)</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/JennyBicks ">@JennyBicks </a></span></h2>
				</li>

				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/thebigc/socialize/twitter_authors/Big-C-Socialize-Twitter-Darlene-35x35.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/DarleneTweets">Darlene Hunt (EP)</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/DarleneTweets">@DarleneTweets </a></span></h2>
				</li>
			</ul>
		</div>
	</div><!-- END modules.disclosure-list -->

			