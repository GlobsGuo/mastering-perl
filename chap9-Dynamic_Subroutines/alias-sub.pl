#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

package Some::Module;
sub bar { print "I'm in ".__PACKAGE__."\n" }
sub import {
	*main::quux = sub { print "I came from ".__PACKAGE__."\n" };
}	

package main;

Some::Module::bar();

{
	no warnings 'redefine';
	*Some::Module::bar = sub { print "Now I'm in ".__PACKAGE__."\n" };
}

Some::Module::bar();
Some::Module->import();
quux();
