#!/usr/bin/perl
use v5.16;
use strict;
use diagnostics;

my $pattern = shift @ARGV;
my $regex = eval { qr/$pattern/ };
die "Check your pattern! $@" if $@;

while (<>) {
	if (m/$regex/) {
	print "$_\t\tmatched >>>$&<<\n";
	print $1,"\t", $2;
}
#	foreach my $i (@-) {
#		print $i, "\t";
#	}
#	foreach my $i (@+) {
#		print $i, "\t";
#	}
}

