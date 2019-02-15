#!/usr/bin/perl -T
use v5.16;
use strict;
use diagnostics;

use IO::Handle;
use File::Spec;
use Scalar::Util qw(tainted);

open my($fh), $ARGV[0] or die "Could not open file! $!\n";

my $line = <$fh>;
print "Line is tainted\n" if tainted($line);

print "$line";
$fh->untaint;
print "$line";
$line = <$fh>;
print "Line is not tainted\n" unless tainted($line);
print "$line";
