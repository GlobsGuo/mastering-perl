#!/usr/bin/perl
package symbol_table;

use v5.16;
use strict;
use diagnostics;

our $n = 10;
our $m = 10;

show_symbol_table( "After assignment" );

delete $symbol_table::{'n'};
delete $symbol_table::{'m'};

show_symbol_table( "After delete" );

sub show_symbol_table {
	print "-" x 10, $_[0], "-" x 10, "\n";
	print "\$n is $n\n\$m is $m\n";
	foreach my $name ( keys %symbol_table::) {
		print "$name\n";
	}
}

