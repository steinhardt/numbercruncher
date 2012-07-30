numbercruncher
==============

`numbercruncher` is a short Perl script which checks that files in a directory and its subdirectories are following the syntax `12/1234/1234nn(-*).*`. That is to say that any file in directory `12/1234` must *also* begin with `1234`.

Outliers and discrepancies are printed to `STDOUT`.
