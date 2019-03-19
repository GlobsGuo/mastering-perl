#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;
use Carp;

sub igrep (&$) {
	my $sub = shift;
	my $object = shift;
	$object->_check_object;
	my @output = ();
	while ( $object->__more__ ) {
		local $_ = $object->__next__;
		push @output, $_ if $sub->();
	}
	$object->__final__ if $object->can( __final__ );
	wantarray ? @output : scalar @output;
}
sub _check_object {
	croak( "iterate object has no __next__ method" )
		unless eval { $_[0]->can( '__next__' );
	croak( "iterate object has no __more__ method" )
		unless eval { $_[0]->can( '__more__' );
	$_[0]->__init__ if eval { $_[0]->isa( '__init__' ) };
	return 1;
}

