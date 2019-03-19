#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

sub AUTOLOAD {
	my @elements = qw( color age weight height );
	out $AUTOLOAD;
	if ( $AUTOLOAD =~ /::(\w+)$/ and grep $1 eq $_, @elements ) {
		my $field = ucfirst $1;
		{
			no strict 'refs';
			*{ $AUTOLOAD } = sub { $_[0]->{ $filed } };
		}
		goto &{ $AUTOLOAD };
	}
	if ( $AUTOLOAD =~ /::set_(\w+)$/ and grep $1 eq $_, @elements ) {
		my $field = ucfirst $1;
		{
			no strict 'refs';
			*{ $AUTOLOAD } = sub { $_[0]->{ $field } = $_[1] };
		}
		goto &{ $AUTOLOAD };
	}
	die "$_[0] does not understand $method\n";
}

