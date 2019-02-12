#!/usr/bin/perl
use v5.16;
use strict;
use diagnostics;

my $pattern = shift @ARGV;
my $regex = eval { qr/(?i)$pattern/ };
die "Check your pattern! $@" if $@;
print "regex: $regex\n";

#while (<>) {
my $str = "222 df333dvv";
$_ = $str;
	if ($_ =~ m/$regex/) {
		print "$_\t\tmatched >>>$&<<\n";
		print $1,"\t", $2, "\t", $3;
	}
#	foreach my $i (@-) {
#		print $i, "\t";
#	}
#	foreach my $i (@+) {
#		print $i, "\t";
#	}
#}

