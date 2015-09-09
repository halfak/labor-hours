
dbstore = --defaults-file=~/.my.research.cnf -h analytics-store.eqiad.wmnet \
          -u research


######################## Catalan Wikipedia (cawiki) ############################
datasets/cawiki.session_revisions.2001-2015.tsv: \
		datasets/cawiki.sessions.2001-2015.tsv

datasets/cawiki.sessions.2001-2015.tsv: \
		cawiki.sorted_revisions \
		cawiki.sorted_archives
	mwsessions sessionize cluster \
		cawiki.revisions_sorted.*.tsv \
		cawiki.archives_sorted.*.tsv \
		--user user_id --user user_text \
		--timestamp timestamp \
		--events datasets/cawiki.session_revisions.2001-2015.tsv
		--verbose > \

cawiki.sorted_revisions: cawiki.revisions_sorted.2001-2015.tsv

cawiki.sorted_archives: cawiki.sorted_archives.2001-2015.tsv

datasets/cawiki.revisions_sorted.2001-2015.tsv: sql/revisions_sorted.range.sql
	echo "@start_date = '2001';@end_date = '2015';" | \
	cat sql/revisions_sorted.range.sql | mysql $dbstore > \
	datasets/cawiki.revisions_sorted.2001-2015.tsv

datasets/cawiki.archives_sorted.2001-2015.tsv: sql/archives_sorted.range.sql
	echo "@start_date = '2001';@end_date = '2015';" | \
	cat sql/archives_sorted.range.sql | mysql $dbstore > \
	datasets/cawiki.archives_sorted.2001-2015.tsv


######################## English Wikipedia (enwiki) ############################
datasets/enwiki.session_revisions.2001-2015.tsv: \
		datasets/enwiki.sessions.2001-2015.tsv

datasets/enwiki.sessions.2001-2015.tsv: \
		enwiki.sorted_revisions \
		enwiki.sorted_archives
	mwsessions sessionize cluster \
		enwiki.revisions_sorted.*.tsv \
		enwiki.archives_sorted.*.tsv \
		--user user_id --user user_text \
		--timestamp timestamp \
		--events datasets/enwiki.session_revisions.2001-2015.tsv
		--verbose > \
	datasets/enwiki.sessions.2001-2014.tsv

enwiki.sorted_revisions: \
		enwiki.revisions_sorted.2001-2006.tsv
		enwiki.revisions_sorted.2007.tsv
		enwiki.revisions_sorted.2008.tsv
		enwiki.revisions_sorted.2009.tsv
		enwiki.revisions_sorted.2010.tsv
		enwiki.revisions_sorted.2011.tsv
		enwiki.revisions_sorted.2012.tsv
		enwiki.revisions_sorted.2013.tsv
		enwiki.revisions_sorted.2014.tsv

enwiki.sorted_archives: \
		enwiki.sorted_archives.2001-2006.tsv
		enwiki.sorted_archives.2006-2008.tsv
		enwiki.sorted_archives.2008-2010.tsv
		enwiki.sorted_archives.2010-2012.tsv
		enwiki.sorted_archives.2012-2014.tsv
		enwiki.sorted_archives.2014.tsv

datasets/enwiki.revisions_sorted.2001-2006.tsv: sql/revisions_sorted.range.sql
	echo "@start_date = '2001';@end_date = '2006';" | \
	cat sql/revisions_sorted.range.sql | mysql $dbstore > \
	datasets/enwiki.revisions_sorted.2001-2006.tsv

datasets/enwiki.revisions_sorted.2006.tsv: sql/revisions_sorted.range.sql
	echo "@start_date = '2006';@end_date = '2007';" | \
	cat sql/revisions_sorted.range.sql | mysql $dbstore > \
	datasets/enwiki.revisions_sorted.2006.tsv

datasets/enwiki.revisions_sorted.2007.tsv: sql/revisions_sorted.range.sql
	echo "@start_date = '2007';@end_date = '2008';" | \
	cat sql/revisions_sorted.range.sql | mysql $dbstore > \
	datasets/enwiki.revisions_sorted.2007.tsv

datasets/enwiki.revisions_sorted.2008.tsv: sql/revisions_sorted.range.sql
	echo "@start_date = '2008';@end_date = '2009';" | \
	cat sql/revisions_sorted.range.sql | mysql $dbstore > \
	datasets/enwiki.revisions_sorted.2008.tsv

datasets/enwiki.revisions_sorted.2009.tsv: sql/revisions_sorted.range.sql
	echo "@start_date = '2009';@end_date = '';" | \
	cat sql/revisions_sorted.range.sql | mysql $dbstore > \
	datasets/enwiki.revisions_sorted.2009.tsv

datasets/enwiki.revisions_sorted.2010.tsv: sql/revisions_sorted.range.sql
	echo "@start_date = '2010';@end_date = '2011';" | \
	cat sql/revisions_sorted.range.sql | mysql $dbstore > \
	datasets/enwiki.revisions_sorted.2010.tsv

datasets/enwiki.revisions_sorted.2011.tsv: sql/revisions_sorted.range.sql
	echo "@start_date = '2011';@end_date = '2012';" | \
	cat sql/revisions_sorted.range.sql | mysql $dbstore > \
	datasets/enwiki.revisions_sorted.2011.tsv

datasets/enwiki.revisions_sorted.2012.tsv: sql/revisions_sorted.range.sql
	echo "@start_date = '2012';@end_date = '2013';" | \
	cat sql/revisions_sorted.range.sql | mysql $dbstore > \
	datasets/enwiki.revisions_sorted.2012.tsv

datasets/enwiki.revisions_sorted.2013.tsv: sql/revisions_sorted.range.sql
	echo "@start_date = '2013';@end_date = '2014';" | \
	cat sql/revisions_sorted.range.sql | mysql $dbstore > \
	datasets/enwiki.revisions_sorted.2013.tsv

datasets/enwiki.revisions_sorted.2014.tsv: sql/revisions_sorted.range.sql
	echo "@start_date = '2014';@end_date = '2015';" | \
	cat sql/revisions_sorted.range.sql | mysql $dbstore > \
	datasets/enwiki.revisions_sorted.2014.tsv

datasets/enwiki.archives_sorted.2001-2006.tsv: sql/archives_sorted.range.sql
	echo "@start_date = '2001';@end_date = '2006';" | \
	cat sql/archives_sorted.range.sql | mysql $dbstore > \
	datasets/enwiki.archives_sorted.2001-2006.tsv

datasets/enwiki.archives_sorted.2006-2008.tsv: sql/archives_sorted.range.sql
	echo "@start_date = '2006';@end_date = '2008';" | \
	cat sql/archives_sorted.range.sql | mysql $dbstore > \
	datasets/enwiki.archives_sorted.2006-2008.tsv

datasets/enwiki.archives_sorted.2008-2010.tsv: sql/archives_sorted.range.sql
	echo "@start_date = '2008';@end_date = '2010';" | \
	cat sql/archives_sorted.range.sql | mysql $dbstore > \
	datasets/enwiki.archives_sorted.2008-2010.tsv

datasets/enwiki.archives_sorted.2010-2012.tsv: sql/archives_sorted.range.sql
	echo "@start_date = '2010';@end_date = '2012';" | \
	cat sql/archives_sorted.range.sql | mysql $dbstore > \
	datasets/enwiki.archives_sorted.2010-2012.tsv

datasets/enwiki.archives_sorted.2012-2014.tsv: sql/archives_sorted.range.sql
	echo "@start_date = '2012';@end_date = '2014';" | \
	cat sql/archives_sorted.range.sql | mysql $dbstore > \
	datasets/enwiki.archives_sorted.2012-2014.tsv

datasets/enwiki.archives_sorted.2014.tsv: sql/archives_sorted.range.sql
	echo "@start_date = '2014';@end_date = '2015';" | \
	cat sql/archives_sorted.range.sql | mysql $dbstore > \
	datasets/enwiki.archives_sorted.2014.tsv
