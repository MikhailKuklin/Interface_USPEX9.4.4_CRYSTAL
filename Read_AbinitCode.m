function target = Read_AbinitCode(code, flag, ID)
if code == 1
target = Read_VASP(flag, ID);  
elseif code ==2
target = Read_SIESTA(flag); 
elseif code ==3
target = Read_GULP(flag, ID);  
elseif code ==4
target = Read_LAMMPS(flag); 
elseif code ==5
target = Read_NeurNetw(flag); 
elseif code ==6
target = Read_DMACRYS(flag); 
elseif code ==7
target = Read_CP2K(flag); 
elseif code ==8
target = Read_QE(flag, ID); 
elseif code ==9
target = Read_FHIaims(flag, ID); 
elseif code ==10
target = Read_ATK(flag); 
elseif code ==11
target = Read_CASTEP(flag); 
elseif code == 12
target = Read_Tinker(flag); 
elseif code == 13
target = Read_MOPAC(flag, ID); 
elseif code == 20
target = Read_CRYSTAL(flag, ID);
elseif code == 14 
if flag == 1
target = Read_VASP(flag, ID);   
else
target = Read_BoltzTraP(flag, ID);  
end
end
