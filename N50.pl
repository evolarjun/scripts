#!/usr/bin/perl -w
# This was originally written by Jim Mullikin and I adopted it so we 
# would have consistent N50s. Other than this message I haven't read
# or altered it. I did not come up with the cool trick used below.
use strict;

my ($sum, $n, $result, @fields, $val, $th);

$th = 0;
$n = 0;
$sum = 0;
my ($sum50) = 0;
my (@n50) = ();


while (@fields = split(/\s/,<>)) {
	if (($val = $fields[$#fields]) =~ /(-?\d+)/) {
		$sum += $val;
		$n50[$n] = $val;
		++$n;
    }
}
my($vp) = .5;
if($n > 0) {
	$result = sprintf("%.2f", ($sum / $n));
	print "sum = $sum, n = $n, avg = $result, ";
	$n = 0;
	foreach (sort { $b <=> $a } @n50) {
		$sum50 += $_;
		print "largest = $_\n" if $n == 0;
		$n++;
		if($sum50/$vp > $sum) {
			printf "N%.0f = $_, n = $n\n", $vp*100;
			$vp += .1;
		}
	}
}

__END__
6acm76c2.s1c:CC   first phred clip: 24, 427
6acm76c7.s1c:CC   first phred clip: 20, 287


sum(v2-v1-1)/n_lines
