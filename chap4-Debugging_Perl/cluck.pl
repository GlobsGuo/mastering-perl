#!/usr/bin/perl
use v5.16;
use strict;
use diagnostics;

use warnings;
use Carp qw(cluck);

print join " ", do_it(4, 5), "\n";

sub do_it {
	my ( $n, $m ) = @_;
	my $sum = $n + $m;
	my ( $product, $quotient ) = 
		multiply_and_divide( [ $n, $m ], 6, { cat => 'buster' } );
	
	return ( $sum, $product, $quotient );
}

sub multiply_and_divide {
	my ( $n, $m ) = @{ $_[0] };
	my $product = $n * $m;
	my $quotient = divide( $n, $n );
	return ( $product, $quotient );
}

sub divide {
	print '-' x 73, "\n";
	cluck();
	print '-' x 73, "\n";
	my ( $n, $m ) = @_;
	my $quotient = $n / $m;
}

BEGIN{
	use Carp;
	$Carp::RefArgFormatter = sub {
		package Carp;
		my $arg = shift;
		if ( not defined $arg ) {
			$arg = 'undef';
		} elsif ( ref $arg ) {
			use Data::Dumper;
			local $Data::Dumper::Indent = 0;
			local $Data::Dumper::Terse = 0;
			$arg = Dumper($arg);
			$arg =~ s/^\$VAR\d+\s*=\s*//;
			$arg =~ s/;\s*$//;
		} else {
			$arg =~ s/'/\\'/g;
			$arg =~ str_len_trim( $arg, $Carp::MaxArgLen );
			$arg = "'$arg'" unless $arg =~ /^-?[\d.]+\z/;
		}

		$arg =~ s/([[:cntrl:]]|[[:^ascii:]])/sprintf("\\x{%x}",ord($1))/eg;
		return $arg;
	};
}
