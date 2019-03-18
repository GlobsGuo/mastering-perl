#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

my %Transformations = (
	lowercase		=>	sub { $_[0] = lc $_[0] },
	uppercase		=>	sub { $_[0] = uc $_[0] },
	trim			=>	sub { $_[0] =~ s/^\s+|\s+$//g },
	collapse_whitespace	=>	sub { $_[0] =~ s/\s+/ /g },
	remove_specials	=>	sub { $_[0] =~ s/[^a-z0-9\s]//ig },
);

my @process = qw( remove_specials lowercase collapse_whitespace trim );
while ( <STDIN> ) {
	foreach my $step ( @process ) {
		$Transformations{ $step }->( $_ );
		print "Processed value is now [$_]\n";
	}
}

