	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%-- 

	JSP
	--------------------------------------------------------------------------------
	@site			sho.com <rebuild>
	@project		generic series
	@file			dexter/s6/views/slice-of-life/index.jsp
	@type			page
	@author			ncavanagh	
	@desc			slice-of-life for dexter
	@note 			
	--------------------------------------------------------------------------------
	--%>
	<tiles:insertDefinition name="series.tune-in" />
    
	<div class="faux-carousel carousel height320">
		<div class="carousel-content">
				<div class="panel">
					<img src="/assets/images/series/dexter/s6/sliceoflife/323_7_0_prm-dexgame2_1024x320.jpg" />
					<div class="text-block align-vert">
						<span class="options tunein">
							<span class="accent"></span>
						</span>
						<span class="title">DEXTER THE GAME 2</span>
						<span class="options more-info">
							<a class="more" data-behavior="track-click" data-click-id="carousel:1:dexter the game 2:1:link_other:download for ios" href="https://itunes.apple.com/us/app/dexter-the-game-2/id571745178?mt=8">DOWNLOAD FOR IOS</a>
							<a class="more" data-behavior="track-click" data-click-id="carousel:1:dexter the game 2:2:link_other:download for android" href="https://play.google.com/store/apps/details?id=com.marceckoentertainment.dexterTheGame2">DOWNLOAD FOR ANDROID</a>
						</span>	<br/>
						<!--
						<tiles:insertDefinition name="modules.social.sharing_inline">
							<tiles:putAttribute name="shareUrl" value="http://apps.facebook.com/dextersliceoflife" />
							<tiles:putAttribute name="headline" value="Dexter Slice Of Life" /></tiles:insertDefinition>						
						 -->
					</div>
				</div>
		</div><!-- END carousel-content -->
	</div><!-- END carousel -->
    
	<div class="secondary">
		<div class="row">
            <div class="mod">
                <div class="mod-body">
                    <tiles:insertDefinition name="modules.social_components_with_overlay" />
                    <tiles:insertDefinition name="series.ways-to-watch" />
                </div>
            </div>
			<div class="mod secondary-promos thumb mod30">
			<h2 id="colTitle">Also Available</h2>
			<div class="mod-body">
			<div class="secondary-promo-column table">
			<div class="tr">
			<div class="td promo clearfix">

			<div class="promo-img">
			<img class="slice-gallery" src="/assets/images/series/dexter/s6/sliceoflife/dex_SOL_72x41.jpg" />
			</div>
			<h2>
			Dexter Slice of Life
			</h2>
			<p>Assume Dexter's identity in this killer social game.<br/>
            <span class="raquo">&raquo;</span><a href="http://apps.facebook.com/dextersliceoflife" class="more">PLAY ON FACEBOOK</a></p>
			</div>

			</div>
				
				
			<div class="tr">
			<div class="td promo clearfix">
				
			<div class="promo-img">
			<img class="slice-gallery" src="/assets/images/series/dexter/s6/sliceoflife/dtgiphone.jpg" />
			</div>
			<h2>
			Dexter the Game for iPhone
			</h2>
			<p>Play the killer game based on the hit Showtime original series now in HD.<br/>
            <span class="raquo">&raquo;</span><a href="http://itunes.apple.com/us/app/dexter-the-game/id327389727?mt=8" class="more">DOWNLOAD GAME</a></p>
			</div>

			</div>

			<div class="tr">

			<div class="td promo clearfix">
			<div class="promo-img">
			<img class="slice-gallery" src="/assets/images/series/dexter/s6/sliceoflife/dtgipad.jpg" />
			</div>
			<h2>
			Dexter the Game for iPad
			</h2>
			<p>Play the killer game based on the hit Showtime original series now in HD.
			Become Dexter and download the hit game for your iPad.
            <span class="raquo">&raquo;</span><a href="http://itunes.apple.com/us/app/dexter-the-game-hd/id396662769?mt=8" class="more">DOWNLOAD GAME</a></p>
			</div>

			</div>

			</div><!-- END secondary-promo-column -->

			</div>
			</div>

<!-- 			<div class="mod">
				<div class="mod-body">
                     <h2>Also Available</h2>
                    <img class="slice-gallery" src="/assets/images/series/dexter/s6/sliceoflife/dtgiphone.jpg" />
					<h3>Dexter the Game for iPhone</h3>
                    <p>Play the killer game based on the hit Showtime original series now in HD. </p>
                    <span class="raquo">&raquo;</span><a href="http://itunes.apple.com/us/app/dexter-the-game/id327389727?mt=8" class="more">DOWNLOAD GAME</a>
					<br /><br />
					<img class="slice-gallery" src="/assets/images/series/dexter/s6/sliceoflife/dtgipad.jpg" />
					<h3>Dexter the Game for iPad</h3>
                    <p>Become Dexter and download the hit game for your iPad.</p>
                    <span class="raquo">&raquo;</span><a href="http://itunes.apple.com/us/app/dexter-the-game-hd/id396662769?mt=8" class="more">DOWNLOAD GAME</a>
                </div> 
			</div> -->
			<div class="mod mod50">
				<div class="mod-body">
                	<h2>DEXTER THE GAME 2</h2>
                    <p>Play as Dexter Morgan in an open-world Miami and go wherever your dark passenger takes you. Drive Dexter's SUV to visit crime scenes, stop at Miami Metro to analyze evidence, stalk suspects, and carry out Harry's code. Investigate a new crime scene and go after a new serial killer every time you play.</p><br/>
					<p>For game support, please contact: <a href="mailto:support@eckocode.com">support@eckocode.com</a>.</p>
                </div>
			</div>
		</div>
	</div>