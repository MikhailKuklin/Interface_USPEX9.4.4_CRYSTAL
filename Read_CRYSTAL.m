function target = Read_CRYSTAL(flag, ID)
Ha = 27.211385;
if flag == 0
  [nothing, results] = unix('cat CRYSTAL.o | grep -E "FINAL OPTIMIZED GEOMETRY" | awk ''{print $0}''');
  if isempty(results)
    disp('CRYSTAL optimization is not finished succesfully');
    target = 0;
  else
    target = 1;  
  end
elseif flag == 1
  [nothing, results] = unix('cat CRYSTAL.o | grep -E "* OPT END" | tail -n 1 | awk ''{print $8}''');
  energy = str2num(results);
  target = energy * Ha;
  disp('CRYSTAL optimization is finished');
  end
end
