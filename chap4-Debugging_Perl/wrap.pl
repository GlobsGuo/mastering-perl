#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

use Hook::LexWrap qw(wrap);

my $n = shift @ARGV;
my $m = $ARGV[0];

wrap add,
	pre		=>	sub { print "I got the arguments:[@_]\n" }, 
	post	=>	sub { print "The return value is going to be $_[-1]\n" }
	;

print "The sum of $n and $m is ".add( $n, $n )."\n";

sub add {
	my ( $n, $m ) = @_;
	my $sum = $n + $m;
	return $sum;
}

