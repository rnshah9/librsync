#! /bin/sh -pe

# libhsync test case.
# Copyright (C) 2000 by Martin Pool

# $Id$

source ${srcdir:-.}/testfns.sh $0 $@

from=$srcdir/COPYING
new=$tmpdir/new.tmp
cmds=$tmpdir/cmds
expect=$tmpdir/expect

run_test genmaptest mapover 5000 $cmds $expect $from

for ioargs in '' '-k' '-n -s'
do
    run_test hsmapread $ioargs $from `cat $cmds` >$new
    run_test cmp $expect $new
done

# the output files are pretty huge, so if we completed successfully
# delete them.  if we failed they're left behind so that you can find
# the cause of death.

run_test rm $expect $new
