#!/usr/bin/perl

use File::Find;
use warnings;


my $scriptname = "numbercruncher.pl";
# my $dir = ".";


# Get path to recursively search from user
print "Directory path: ";
chomp ( my $dir = <STDIN> );
$dir =~ s/\/+$//; # Removes any trailing slashes


# [1] Checks that the name of a file in directory `{nietvrij,vrij}/12/1234` begins with `1234`
print "Checking that file names begin with their parent directory's name...\n";
find(\&check_followsyntax, $dir);

sub check_followsyntax {
	if ( $File::Find::name =~ /(\d{4})\/(\d{4}).*$/ ) {
		my $parent = $1;
		my $filestart = $2;
		my $new_grandparent = substr ( $2, 0, 2 ); # e.g. parent of 1234/ would be 12/
	
		if ( $filestart !~ $parent ) {
			print "$scriptname - file $File::Find::name not in correct directory; should be in $new_grandparent/$filestart/.\n";
		}
	}
}


# [2] Checks that said file name also doesn’t contain spaces or "forbidden characters"
print "Checking file names for forbidden characters...\n";
find(\&check_forbiddencharacters, $dir);

sub check_forbiddencharacters {
	if ( $_ !~ /^[A-Za-z0-9\.\-\+]+$/ ) {
		print "$scriptname - file $File::Find::name contains forbidden characters. Only A-Z, a-z, 0-9, \. (full stop), - (hyphen) and + (plus sign) allowed.\n";
	}
}


# [3] Checks that only PSDs are in the `vrij/` directory but anything can be in `nietvrij/`
if ( $dir =~ /vrij$/ ) { # FIXME Only works if user *gives* vrij/ as input, not just if it's a subdirectory.
	print "Checking that only PSDs reside in the vrij/ directory...\n";
	find(\&check_psdsinvrij, $dir);
}

sub check_psdsinvrij {
	if ( $_ !~ /.psd$/ ) {
		print "$scriptname - file $File::Find::name not in Photoshop format. Only Photoshop files (*.psd) allowed in vrij/ directories.\n" if ( -f );
	}
}

exit;


# TODO Print warnings to STDERR rather than STDOUT!
# TODO Skip step 3 if $dir doesn't _end_ in "vrij/" or "vrij".
# TODO Ignore directories and subdirectories when printing these errors.
