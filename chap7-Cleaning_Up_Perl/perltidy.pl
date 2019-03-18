#!/usr/bin/perl
## yucky
use strict;use warnings;my %Words;while(<>){chomp;s{^\s+}{};s{\s+$}{};
my $line=lc;my @words=split/\s+/,$line;foreach my $word(@words){
$word=~s{\W}{}g;next unless length $word;$Words{$word}++;}}foreach
my $word(sort{$Words{$b}<=>$Words{$a}}keys %Words){last
if $Words{$word}<10;printf"%5d %s\n",$Words{$word},$word;}

