#!/usr/bin/perl

use File::Find;
use warnings;


my $scriptname = "watermarker.pl";
my $dir = ".";


# [1] Checks that the name of a file in directory `{nietvrij,vrij}/12/1234` begins with `1234`
print "FIXME - haven't coded this bit yet!\n";


# [2] Checks that said file name also doesn’t contain spaces or "forbidden characters"
find(\&check_forbiddencharacters, $dir);
sub check_forbiddencharacters {
	if ( $_ !~ /^[A-Za-z0-9\.\-\+]+$/ ) {
		print "$scriptname - file $_ contains forbidden characters. Only A-Z, a-z, 0-9, \. (full stop), - (hyphen) and + (plus sign) allowed.\n";
	}
}


# [3] Checks that only PSDs are in the `vrij/` directory but anything can be in `nietvrij/`
print "FIXME - haven't coded this bit yet!\n";


# [4] Reports any discrepancies by printing messages to `STDOUT`
print "FIXME - haven't coded this bit yet!\n";


exit;
