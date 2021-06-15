#!/usr/bin/perl
# fasta_count.pl - count bases / AA in a FASTA file

use strict;
use warnings;
use lib "/home/aprasad/lib/perl5";
use GTB::FASTAiterator;
use GTB::Run qw(comment_usage);

my @filenames;

if (@ARGV == 0) {
    if (-t STDIN) {
        comment_usage();
    } else {
        $filenames[0] = '-';
    }
} else {
    @filenames = @ARGV;
}

foreach my $filename (@filenames) {
    if (@filenames > 1) {
        print "$filename\n";
    }
    my $fa = GTB::FASTAiterator->new($filename);
    my($def, $seq);
    while(($def, $seq) = $fa->getEntry() and defined($def)) {
        my ($name) = $def =~ /^>(\S+)/;
        my $num_all = length($seq);
        my $num_gaps = $seq =~ tr/-//;
        my $num_Ns = $seq =~ tr/Nn//;
        my $num_Xs = $seq =~ tr/Xx//;
        printf("%-20s %10d tot  %10d ungapped  %8d N's  %8d X's\n",
            $name, $num_all, $num_all - $num_gaps, $num_Ns, $num_Xs);
    }
}


