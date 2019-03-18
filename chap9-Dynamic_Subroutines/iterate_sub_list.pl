#!/usr/bin/perl
use v5.16;
use strict;
use warnings;
use diagnostics;

my %Constraints = (
	is_defined		=>	sub { defined $_[0] },
	not_empty 		=> 	sub { length $_[0] > 0 },
	is_long	  		=>	sub { length $_[0] > 8 },
	has_whitespace	=>	sub { $_[0] =~ m/\s/ },
	no_whitespace	=>	sub { $_[0] !~ m/\s/ },
	has_digit		=> 	sub { $_[0] =~ m/\d/ },
	only_digits		=>	sub { $_[0] !~ m/\D/ },
	has_special		=>	sub { $_[0] =~ m/[^a-z0-9]/ },
);

chomp ( my $pw = <STDIN> );
my $fails = grep {
	! $Constraints{ $_ }->( $pw )
} qw( is_long no_whitespace has_digit has_special );
print $fails;
