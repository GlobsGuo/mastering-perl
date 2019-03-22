#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

use Data::Dumper qw( Dumper );
my %hash = qw( 
	Fred	Flintstone
	Barney	Rubble
);

my @array = qw( Fred Barney Betty Wilma );

my $dd = Data::Dumper->new(
	[ \%hash, \@array ],
	[ qw( dumpedhash dumpedarray )]
);


$dd = Data::Dumper->new(
	[ \%hash, \@array ],
	[ qw( *dumpedhash *dumpedarray )]
);
print $dd->Dump;

my $data = do {
	if ( open my $fh, '<', 'data-dumper.txt' ) { local $/; <$fh> }
	else { undef }
};

my %dumpedhash;
my @dumpedarray;
eval $data;
print "Fred's last name is $dumpedhash{Fred}\n";
