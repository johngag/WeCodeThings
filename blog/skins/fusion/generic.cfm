<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="fusion" taglib="tags">
<fusion:pagelayout type="Generic">
	<div class="page">
		<h2><mango:Message title /></h2>
		<div class="entry clearfix">
			<mango:Message text />
			<mango:Message data />
		</div>
	</div>
</fusion:pagelayout>