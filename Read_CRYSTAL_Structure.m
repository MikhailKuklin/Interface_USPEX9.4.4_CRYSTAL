function [coor, lat] = Read_CRYSTAL_Structure()
%read lattice and coordinates
[nothing, lattice] = unix('awk ''/DIRECT LATTICE VECTORS CARTESIAN COMPONENTS/ {f=NR} {a[NR]=$0} END {while(i++<NR) if (i>f-0 && i<f+100) print a[i]}'' CRYSTAL.o | grep -B 100 "CARTESIAN COORDINATES - PRIMITIVE CELL" | tail -n +2 | head -n -3');
[nothing,fraccoordinates]=unix('awk ''/ATOMS IN THE ASYMMETRIC UNIT/ {f=NR} {a[NR]=$0} END {while(i++<NR) if (i>f-0 && i<f+500) print a[i]}'' CRYSTAL.o |  grep -B 500  "DIRECT LATTICE VECTORS" | tail -n +3 | head -n -5 | awk ''{print $5, $6, $7}''');  
coor = str2num(fraccoordinates);
lat = str2num(lattice);
