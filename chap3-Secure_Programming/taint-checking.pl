#!/usr/bin/perl -T
use v5.16;
use strict;
use diagnostics;

#system qq | echo " Args are @ARGV" |;

use File::Spec;
use Scalar::Util qw(tainted);
print "ARGV is tainted\n" if tainted(@ARGV);

print "Argument $ARGV[0] is tainted\n" if tainted($ARGV[0]);

my $path = File::Spec->catfile( $ENV{HOME}, "cd.sh" );
print "Result [$path] is tainted\n" if tainted( $path );
open my ($fh), $path or die "Could not open $path";
print while (<$fh>);
print "$fh is tainted" if tainted($fh);
