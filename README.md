# scripts
A few little scripts to keep around

Nothing special here at the moment

- d2l - view column-delimited data fixed-width using less -S
- d2f - just covert to tab to fixed-width data without piping to less
- fan50 - N50 for FASTA files
- fasta_count.pl - count bases/aa in a FASTA/file
- N50.pl - Jim Mullikin's old N50 script
- fagrep - search FASTA files a la grep

Install to ~/bin with 
make install

Install somewhere else with
make install INSTALL_DIR=<bin_directory>

fagrep, fan50, and fasta_count.pl all require GTB::Run.pm and/or GTB::File.pm.
These were designed for internal use, but now I can't code perl without them.
They're available in https://github.com/evolarjun/home/tree/main/lib/perl5/GTB


