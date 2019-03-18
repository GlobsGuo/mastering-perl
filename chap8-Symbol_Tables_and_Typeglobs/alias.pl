#!/usr/bin/perl
use v5.16;
#use strict;
#use warnings;
#use diagnostics;

no strict;
$foo = "Foo scalar";
@foo = 1 .. 5;
%foo = qw( One 1 Two 2 Three 3 );
sub foo { 'I\'m a subroutine!' }

*bar = *foo;

print "scalar is <$bar>, array is <@bar>\n";
print "sub returns <", bar(), ">\n";

*bar = \$foo;
*bar = \@foo;
*bar = \&foo;

print "scalar is <$bar>, array is <@bar>\n";
print "sub returns <", bar(), ">\n";

$bar = 'Bar scalar';
@bar = 6 .. 10;
print "scalar is <$foo>, array is <@foo>\n";

