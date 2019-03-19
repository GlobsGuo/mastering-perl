#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

{
	package FlatList::Util;
	
	sub reduce (&@) {
		my $code = shift;
		no strict 'refs';
		return shift unless @_ > 1;
	
		use vars qw( $a $b );
		my $caller = caller;
		local ( * { $caller."::a" } ) = \my $a;
		local ( * { $caller."::b" } ) = \my $b;
		$a = shift;
		foreach ( @_ ) {
			$b = $_;
			$a = &{ $code }();
		}
		$a;
	}

	sub reduce2 (&@) {
		my $sub = shift;
		while ( @_ > 1 ) {
			unshift @_, $sub->( shift, shift );
		}
		return $_[0];
	}
}

my @list = qw( 1 2 3 4 5 );
my $sum = FlatList::Util::reduce { $a + $b } @list;
print "$sum\n";
$sum = FlatList::Util::reduce2 { $_[0] + $_[1] } @list;
print "$sum\n";
