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
		my $updated = map { s/_/-/g } $_;
		print "$dir/$_\n";
		my @args = ( "/usr/bin/git", "mv", "$original", "$updated" );
		system @args 
		#system "/usr/bin/git", "mv", $original, $updated 
			|| die "git mv error";
		#system "/usr/bin/git", "commit", "-m "update file name""
		@args = ( "/usr/bin/git", "commit", "-m", "update file name" );
		system @args 
			|| die "git commit error";
		@args = ( "/usr/bin/git", "push" );
		system @args 
		#system "/usr/bin/git", "push"
			|| die "git push error";
	}
	closedir $dh;
}

