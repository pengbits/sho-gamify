	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%--

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <mobile>
	@project		livefyre_dev
	@file			social_collections/_323_7_0_cast.mobile.jsp
	@type			partial
	@author			dpaul
	@modified		12.07.12
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
					<span class="twitter-avatar"><img src="/assets/images/series/episodes/socialize/twitter_authors/35x35/stephenmangan_35x35.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/StephenMangan">Stephen Mangan</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/StephenMangan">@StephenMangan</a></span></h2>
				</li>

				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/episodes/socialize/twitter_authors/35x35/mircea_35x35.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/missmircea">Mircea Monroe</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/missmircea">@missmircea</a></h2>
				</li>

				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/episodes/socialize/twitter_authors/35x35/kathleenperkins_35x35.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/KathleenPerkins">Kathleen Rose Perkins</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/KathleenPerkins">@KathleenPerkins</a></span></h2>
				</li>

				<li><h2>
					<span class="twitter-avatar"><img src="/assets/images/series/episodes/socialize/twitter_authors/35x35/sampalladio_35X35.jpg" width="48" height="48" /></span>
					<span class="twitter-author-name"><a href="http://twitter.com/sampalladio">Sam Palladio</a></span>
					<span class="twitter-author-handle"><a href="http://twitter.com/sampalladio">@sampalladio</a></span></h2>
				</li>

			</ul>
		</div>
	</div><!-- END modules.ways_to_watch -->

			