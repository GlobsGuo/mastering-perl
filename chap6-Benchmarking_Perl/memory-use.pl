#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

use Devel::Peek;

my $a, $b;
print_message( "Before I do something" );
Dump( $a );

print_message( "After I assign a string" );
$a = '123456789';
Dump( $a );

print_message( "After I use it as a number" );
$b = $a + 1;
Dump( $a );

sub print_message {
	print "\n", "-" x 50,
		"\n$_[0]\n", "-" x 50, "\n";
}

use Devel::Size qw(size);

my $n;
print_message( "Before I do something" );
print "size is ", size( \$n );

print_message( "After I assign a string" );
$n = '1';
print "size is ", size( \$n );

print_message( "After I use as a number" );

my $m = $n + 1;
print "size is ", size( \$n );

my $ref = \$n;
print "ref size is ", size( \$ref );
print "\n";

use Devel::Size qw(total_size);
my $data = '-' x 500;
print "The size of scalar is ", size( $data ), "\n";
print "The total size of scalar is ", total_size( $data ), "\n";

print "\n";
my @array = ( $data ) x 500;
print "The size of the array is ", size( \@array ), "\n";
print "The total size of the array is ", total_size( \@array ), "\n";
