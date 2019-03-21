#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

eval {
	die {
		'line'	=>	__LINE__,
		'package'	=>	__PACKAGE__,
		'type'		=>	'Demonstration',
		'messge'	=>	'See, it works!',
	};
};
if ( $@ ) {
	print "Error type: $@->{type}\n".
			"\t$@->{message}\n",
			"\tat $@->{package} at line $@->{line}\n";
}

use Hash::AsObject;
eval {
	my $error = Hash::AsObject->new(
		{
			'line'	=>	__LINE__ - 1,
			'package'	=>	__PACKAGE__,
			'type'		=>	'Demonstration',
			'message'	=>	'See, it works!',
		}
	);
	die $error;
};
if ( $@ ) {
	my $error = $@;
	print "Error type: ". $error->type."\n".
		"\t". $error->message."\n",
		"\tat ". $error->package. " at line ".$error->line."\n";
}
