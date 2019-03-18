#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

use vars qw( %Operators );
%Operators = (
	'+'	=>	sub { $_[0] + $_[1] },
	'-'	=>	sub { $_[0] - $_[1] },
	'*'	=>	sub { $_[0] * $_[1] },
	'/' =>	sub { $_[1] ? eval { $_[0] / $_[1] } : 'NaN' },
);

while(1) {
	my ( $operator, @operand ) = get_line();
	my $some_sub = $Operators{ $operator };
	unless ( defined $some_sub ) {
		print "Unknown operator [$operator]\n";
		last;
	}
	print $Operators{ $operator }->( @operand );
}

print "Done, exiting...\n";

sub get_line {
	print "\nprompt> ";
	my $line = <STDIN>;
	$line =~ s/^\s+|\s+$//g;
	( split /\s+/, $line )[1, 0, 2];
}

