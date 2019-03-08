#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;
use Benchmark;

my @array = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
my $start = time;
foreach my $i (0 .. 99999) {
	$array[$i % $#array] += 2;
}
my $end = time;
printf "time1: %d\n", $end - $start;

my @start = times;
foreach my $i (0 .. 99999) {
	$array[$i % $#array] -= 1;
}
my @end = times;
my @diffs = map { $end[$_] - $start[$_] } 0 .. $#end;
print "time2: @diffs\n";
	
$start = Benchmark->new;
foreach my $i (0 .. 99999) {
	$array[$i % $#array] -= 1;
}
my $end = Benchmark->new;
my $diff = timediff( $end, $start );
print "time3: ".timestr( $diff )."\n";

my ( $real, $child_user, $child_system ) = @$diff[0, 3, 4];

printf STDERR "\nreal\t%.3f\nuser\t%.3f\nsys\t%.3f\n",
	$real, $child_user, $child_system;


