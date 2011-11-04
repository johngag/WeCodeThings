<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="fusion" taglib="tags">
<fusion:pagelayout type="Home">
	<fusion:postlist />
	<mango:Archive pagesize="5">
		<fusion:navigation />
	</mango:Archive>
</fusion:pagelayout>