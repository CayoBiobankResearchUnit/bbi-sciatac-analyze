#!/bin/bash

outf='md5.ajh.summarize_cell_calls.out'
rm -f $outf

echo '** unsorted' | tee -a $outf

echo 'BEGIN_TABLE' | tee -a $outf
lfil=`ls called_cells_summary.stats.txt`
for fil in $lfil
do
  echo $fil | tee -a $outf
  md5sum $fil | tee -a $outf
  echo | tee -a $outf
done
echo 'END_TABLE' | tee -a $outf


