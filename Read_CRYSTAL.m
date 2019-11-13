function target = Read_CRYSTAL(flag, ID)
Ha = 27.211385;
if flag == 0
%checks if calculation was finished succesfully or unsuccesfully
  [nothing, results] = unix('cat CRYSTAL.o | grep -E "FINAL OPTIMIZED GEOMETRY" | awk ''{print $0}''');
  if isempty(results)
    disp('CRYSTAL optimization is not finished succesfully');
    target = 0;
  else
    target = 1;  
  end
elseif flag == 1
%finds energy of the optimized structure and transforms from  hartree to eV
  [nothing, results] = unix('cat CRYSTAL.o | grep -E "* OPT END" | tail -n 1 | awk ''{print $8}''');
  %rename outputs files
  [nothing, nothing] = unix(['cp CRYSTAL.o CRYSTAL-`date +"%b%d-%T"`-' ID '.o']);
  energy = str2num(results);
  target = energy * Ha;
  disp('CRYSTAL optimization is finished');
  end
end
