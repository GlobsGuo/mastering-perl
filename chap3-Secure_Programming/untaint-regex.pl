#!/usr/bin/perl -T
use v5.16;
use strict;
use diagnostics;

use Scalar::Util qw(tainted);

{
	no locale;
	my($file) = $ARGV[0] =~ m/([\w.-]+)$/;
	print "$file is not tainted\n" unless tainted($file);
}

use re 'taint';
{
	no re 'taint';
	my($file) = $ARGV[0] =~ m/([\w.-]+)$/;
	print "$file is not tainted\n" unless tainted($file);
}

{
	my($file) = $ARGV[0] =~ m/([\w.-]+)$/;
	print "$file is tainted\n" if tainted($file);
}
