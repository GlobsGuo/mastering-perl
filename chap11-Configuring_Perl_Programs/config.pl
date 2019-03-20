#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

use Config;

print "Send mail to $Config{cf_email}\n";
print "Complied on $Config{myhostname}.$Config{mydomain}\n";
print "has thread support\n" if $Config{usethreads};
print "running on $^O\n";
print "running on $Config{'osname'}\n";
print "running on $Config{archname}\n";

