#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

use Benchmark;

my $iterations = 10_000;
timethese( $iterations, {
		'Opendir'	=>	'opendir my ( $dh ), "."; my @f = readdir ( $dh )',
		'Glob'		=>	'my @f = glob("*")',
	} );

$L::glob = $ARGV[0];
@L::files = glob $L::glob;
print "Testing with ".@L::files." files\n";

my $transform = q|map $_->[0], sort { $a->[1] <=> $b->[1] } map [ $_, -M ]|;
my $sort = q|sort { -M $a <=> -M $b }|;
my $code = {
	assign	=>	q| my @r = @L::files |,
	'glob'	=>	q| my @files = glob $L::glob |,
	sort_names	=>	q| sort { $a cmp $b } @L::files |,
	sort_names_assign	=>	q| my @r = sort { $a cmp $b } @L::files |,
	sort_names_assign	=>	qq| my \@r = $sort \@L::files |,
	ordinary_orig	=>	qq| my \@r = $sort glob \$L::glob |,
	ordinary_mod	=>	qq| my \@r = $sort \@L::files |,
	schwarts_orig	=>	qq| $transform, glob \$L::glob |,
	schwarts_orig_assign	=>	qq| my \@r = $transform, glob \$L::glob |,
	schwarts_mod	=>	qq| my \@r = $transform, \@L::files |,
};

print "Timing for 2 CPU seconds...\n";
timethese( -2, $code );

$iterations = 1_000;
print "\n", "-" x 73,"\n\n";
print "Timing for $iterations iterations\n";
timethese( $iterations, $code );
