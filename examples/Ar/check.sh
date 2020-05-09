#!/usr/bin/env bash

function compare {
  a=$2
  b=$3
  diff=$(echo $a $b | awk '{print $1-$2}')
  lp=$(echo $diff $a | awk '{printf "%.4e",$1/$2}')
  ld=$(echo $diff $b | awk '{printf "%.4e",$1/$2}')
  echo "$1: $a $b - diff: $diff - relative: $lp $ld"
}


lla="lmp/log.lammps"
ldlp="dlp/STATIS"
odlp="dlp/OUTPUT"
dline=( $(grep -A 8 "^[ ]*0 " $ldlp | tail -n 8  | xargs) )
etail=$(grep "vdw ene" $odlp | awk '{print $3}')
lline=( $(grep -A 1 TotEng $lla | tail -n 1) )

lee=${lline[5]}
dee=${dline[4]}
lesrc=${lline[4]}
desrc=${dline[3]}
lecfg=${lline[3]}
decfg=${dline[2]}
leto=${lline[1]}
deto=${dline[0]}
leb=${lline[6]}
deb=${dline[5]}
lea=${lline[7]}
dea=${dline[6]}
ltail=${lline[10]}
lpr=${lline[11]}
dpr=$(echo ${dline[26]} | awk '{print $1*1000.0}')
compare "esrc" "$lesrc" "$desrc"
compare "ecfg" "$lecfg" "$decfg"
compare "etot" "$leto" "$deto"
compare "etail" "$ltail" "$etail"
compare "pressure"  "$lpr" "$dpr"
