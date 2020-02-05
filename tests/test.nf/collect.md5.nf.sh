#!/bin/bash

dst="$1"

if [ "$dst" == '' ]
then
  echo "Error: missing analysis directory parameter"
  exit -1
fi


ofil="md5.nf"

function collect_md5()
{
  local ifil="$1"
  local ofil="$2"

  echo "====================" | tee -a $ofil
  echo "file: ${ifil}" | tee -a $ofil
  echo | tee -a $ofil
  awk 'BEGIN{flag=0}{if($1~/^BEGIN_TABLE/) { flag = 1 } else if( $1 ~ /^END_TABLE/ ) { flag = 0 } else if( flag == 1 ) { print }}' $ifil | tee -a $ofil
  echo | tee -a $ofil
}

fil=${dst}/align_reads/md5.nf.align_reads.out
collect_md5 $fil $ofil

fil=${dst}/call_cells/md5.nf.call_cells.out
collect_md5 $fil $ofil

fil=${dst}/call_peaks/md5.nf.call_peaks.out
collect_md5 $fil $ofil

fil=${dst}/get_unique_fragments/md5.nf.get_unique_fragments.out
collect_md5 $fil $ofil

fil=${dst}/make_matrices/md5.nf.make_matrices.out
collect_md5 $fil $ofil

fil=${dst}/merge_bams/md5.nf.merge_bams.out
collect_md5 $fil $ofil

fil=${dst}/per_base_tss_region_coverage/md5.nf.tss_region_coverage.out
collect_md5 $fil $ofil

fil=${dst}/summarize_cell_calls/md5.nf.summarize_cell_calls.out
collect_md5 $fil $ofil


