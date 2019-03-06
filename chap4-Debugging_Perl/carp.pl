#!/usr/bin/perl
use v5.16;
use strict;
use diagnostics;

use Carp qw(carp);

printf "%.2f\n", divide(3, 4);
printf "%.2f\n", divide(1, 0);
printf "%.2f\n", divide(5, 4);

sub divide {
	my ( $numerator, $denominator ) = @_;
	carp "N:[$numerator] D:[$denominator]";
	return $numerator / $denominator;
}

