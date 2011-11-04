<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="fusion" taglib="tags">
<fusion:pagelayout type="Archives">
	<mango:Archive pageSize="5">
		<mango:ArchiveProperty ifIsType="category"><h1 class="pagetitle">Entries Tagged as "<mango:ArchiveProperty title />"</h1></mango:ArchiveProperty>
		<mango:ArchiveProperty ifIsType="month"><h1 class="pagetitle">Entries for month: <mango:ArchiveProperty title dateformat="mmmm yyyy"  /></h1></mango:ArchiveProperty>
		<mango:ArchiveProperty ifIsType="day"><h1 class="pagetitle">Entries for day: <mango:ArchiveProperty title dateformat="dd mmmm yyyy" /></h1></mango:ArchiveProperty>
		<mango:ArchiveProperty ifIsType="year"><h1 class="pagetitle">Entries for year: <mango:ArchiveProperty title dateformat="yyyy" /></h1></mango:ArchiveProperty>
		<mango:ArchiveProperty ifIsType="search"><h1 class="pagetitle">Search Results for <mango:ArchiveProperty title /></h1></mango:ArchiveProperty>
		<mango:ArchiveProperty ifIsType="author"><h1 class="pagetitle">Entries by "<mango:ArchiveProperty title />"</h1></mango:ArchiveProperty>
		<mango:ArchiveProperty ifIsType="unknown"><h1 class="pagetitle">No archives</h1></mango:ArchiveProperty>
		<fusion:postlist />
		<fusion:navigation />
	</mango:Archive>
</fusion:pagelayout>