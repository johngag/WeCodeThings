<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="fusion" taglib="tags">
<mango:Author>
	<fusion:pagelayout type="Author">
		<h2><mango:AuthorProperty name /></h2>
		<div class="profile">
			<mango:AuthorProperty description />
			<div class="clear"></div>
		</div>
	</fusion:pagelayout>
</mango:Author>