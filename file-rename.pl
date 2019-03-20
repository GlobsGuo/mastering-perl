#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

chdir ( $ARGV[0] )if ( defined $ARGV[0] );
foreach my $dir (glob("*")) {
	my $dh;
	if ( -d $dir ) {
		opendir ( $dh, $dir );
	} else {
		next;
	}
	while ( readdir $dh ) {
		print "$dir/$_\n";
		my $original = $_;
		next if ( !/_/ );
		( my $updated = $original ) =~ s/_/-/g;
		print "$dir/$updated\n";
		print "$dir/$original\n";
		my @args = ( "git", "mv", "$dir/$original", "$dir/$updated" );
		system @args == 0 || die "git mv error";
		@args = ( "git", "commit", "-m", "update file name" );
		system @args == 0 || die "git commit error";
		@args = ( "git", "push" );
		system @args == 0 || die "git push error";
	}
	closedir $dh;
}

