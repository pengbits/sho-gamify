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
							<span class="twitter-avatar"><img src="/assets/images/series/shameless/socialize/twitter_authors/35x35/EmmyRossum.jpg" width="48" height="48" /></span>
							<span class="twitter-author-name"><a href="http://twitter.com/EmmyRossum">Emmy Rossum</a></span>
							<span class="twitter-author-handle"><a href="http://twitter.com/EmmyRossum">@EmmyRossum </a></span>
					</h2>
				</li>
				<li>
					<h2>
							<span class="twitter-avatar"><img src="/assets/images/series/shameless/socialize/twitter_authors/35x35/JustinGChatwin.jpg" width="48" height="48" /></span>
							<span class="twitter-author-name"><a href="http://twitter.com/JustinGChatwin">Justin Chatwin</a></span>
							<span class="twitter-author-handle"><a href="http://twitter.com/JustinGChatwin">@JustinGChatwin</a></span>
					</h2>
				</li>
				<li>
					<h2>
							<span class="twitter-avatar"><img src="/assets/images/series/shameless/socialize/twitter_authors/35x35/ShanolaHampton.jpg" width="48" height="48" /></span>
							<span class="twitter-author-name"><a href="http://twitter.com/ShanolaHampton">Shanola Hampton</a></span>
							<span class="twitter-author-handle"><a href="http://twitter.com/ShanolaHampton">@ShanolaHampton </a></span>
					</h2>
				</li>
				<li>
					<h2>
							<span class="twitter-avatar"><img src="/assets/images/series/shameless/socialize/twitter_authors/35x35/CameronMonaghan.jpg" width="48" height="48" /></span>
							<span class="twitter-author-name"><a href="http://twitter.com/CameronMonaghan">Cameron Monaghan</a></span>
							<span class="twitter-author-handle"><a href="http://twitter.com/CameronMonaghan">@CameronMonaghan </a></span>
					</h2>
				</li>
				<li>
					<h2>
							<span class="twitter-avatar"><img src="/assets/images/series/shameless/socialize/twitter_authors/35x35/EmmaRoseKenney.jpg" width="48" height="48" /></span>
							<span class="twitter-author-name"><a href="http://twitter.com/EmmaRoseKenney">Emma Kenney</a></span>
							<span class="twitter-author-handle"><a href="http://twitter.com/EmmaRoseKenney">@EmmaRoseKenney </a></span>
					</h2>
				</li>
				<li>
					<h2>
							<span class="twitter-avatar"><img src="/assets/images/series/shameless/socialize/twitter_authors/35x35/ReelSteveHowey.jpg" width="48" height="48" /></span>
							<span class="twitter-author-name"><a href="http://twitter.com/ReelSteveHowey">Steve Howey</a></span>
							<span class="twitter-author-handle"><a href="http://twitter.com/ReelSteveHowey">@ReelSteveHowey </a></span>
					</h2>
				</li>
				<li>
					<h2>
							<span class="twitter-avatar"><img src="/assets/images/series/shameless/socialize/twitter_authors/35x35/EthanCutkosky.jpg" width="48" height="48" /></span>
							<span class="twitter-author-name"><a href="http://twitter.com/EthanCutkosky">Ethan Cutkosky</a></span>
							<span class="twitter-author-handle"><a href="http://twitter.com/EthanCutkosky">@EthanCutkosky </a></span>
					</h2>
				</li>
				<li>
					<h2>
							<span class="twitter-avatar"><img src="/assets/images/series/shameless/socialize/twitter_authors/35x35/Zach_McGowan.jpg" width="48" height="48" /></span>
							<span class="twitter-author-name"><a href="http://twitter.com/Zach_McGowan">Zach McGowan</a></span>
							<span class="twitter-author-handle"><a href="http://twitter.com/Zach_McGowan">@Zach_McGowan </a></span>
					</h2>
				</li>
				<li>
					<h2>
							<span class="twitter-avatar"><img src="/assets/images/series/shameless/socialize/twitter_authors/35x35/violettegreen.png" width="48" height="48" /></span>
							<span class="twitter-author-name"><a href="http://twitter.com/violettegreen">Emma Greenwell</a></span>
							<span class="twitter-author-handle"><a href="http://twitter.com/violettegreen">@violettegreen </a></span>
					</h2>
				</li>
				<li>
					<h2>
							<span class="twitter-avatar"><img src="/assets/images/series/shameless/socialize/twitter_authors/35x35/noel_fisher.png" width="48" height="48" /></span>
							<span class="twitter-author-name"><a href="http://twitter.com/noel_fisher">Noel Fisher</a></span>
							<span class="twitter-author-handle"><a href="http://twitter.com/noel_fisher">@noel_fisher </a></span>
					</h2>
				</li>
				<li>
					<h2>
							<span class="twitter-avatar"><img src="/assets/images/series/shameless/socialize/twitter_authors/35x35/lauraslade11.jpg" width="48" height="48" /></span>
							<span class="twitter-author-name"><a href="http://twitter.com/lauraslade11">Laura Slade Wiggins</a></span>
							<span class="twitter-author-handle"><a href="http://twitter.com/lauraslade11">@lauraslade11</a></span>
					</h2>

				</li>

			
			</ul>
		</div>
	</div><!-- END modules.ways_to_watch -->

