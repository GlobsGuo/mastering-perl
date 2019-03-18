#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

{
	no strict 'refs';
	my $name = 'foo';
	*{ $name } = sub { print "Hi, how are you?\n" };

	my $remote_name = "Some::Module::foo";
	*{ $remote_name } = sub { print "Hi, are you from Maine?\n" };
}
foo();
Some::Module::foo();

{
	no strict 'refs';
	my $evil_name = "<=>";
	*{ $evil_name } = sub { print "How did you ever call me?\n" };

	*{ $evil_name }{CODE}->();
	&{ $evil_name }();
}

