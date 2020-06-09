function Write_CRYSTAL(Ind_No)
global POP_STRUC
global ORG_STRUC
numIons     = POP_STRUC.POPULATION(Ind_No).numIons;
Step        = POP_STRUC.POPULATION(Ind_No).Step;
COORDINATES = POP_STRUC.POPULATION(Ind_No).COORDINATES;
LATTICE     = POP_STRUC.POPULATION(Ind_No).LATTICE;
atomType    = ORG_STRUC.atomType;
try
  [nothing, nothing] = unix(['cat ../CRYSTAL_options_' num2str(Step) ' > CRYSTAL.d12']);
catch
  error = ['CRYSTAL_options is not present for step ' num2str(Step)];
  quit
end
%disp(LATTICE)
%write ext file
fp=fopen('fort2.34', 'w');
fprintf(fp, '3 1 1\n');
LATTICE = LATTICE;
%manipulation with lattice for fract-cart transformation
fprintf(fp, '%8.4f %8.4f %8.4f\n', LATTICE(1,:));
fprintf(fp, '%8.4f %8.4f %8.4f\n', LATTICE(2,:));
fprintf(fp, '%8.4f %8.4f %8.4f\n', LATTICE(3,:));
fprintf(fp, '1\n');
fprintf(fp, '1.00 0.00 0.00\n');
fprintf(fp, '0.00 1.00 0.00\n');
fprintf(fp, '0.00 0.00 1.00\n');
fprintf(fp, '0.00 0.00 0.00\n');
number = sum(numIons);
fprintf(fp, '%d\n', number);
coordLoop = 1;
for i = 1 : length(numIons)
  for j = 1 : numIons(i);
    cartcoord = COORDINATES(coordLoop, :) * LATTICE;
    %disp(COORDINATES(coordLoop, :));
    fprintf(fp, '%4d  %12.6f %12.6f %12.6f\n', ORG_STRUC.atomType(i), cartcoord);
    coordLoop = coordLoop + 1;
  end
end
%disp(cartcoord);
fclose(fp);
fp = fopen('CRYSTAL.d12','a+');
fprintf(fp, 'SHRINK\n');
[Kpoints, Error] = Kgrid(LATTICE, ORG_STRUC.Kresol(Step), ORG_STRUC.dimension);
if Error == 1
POP_STRUC.POPULATION(Ind_No).Error = POP_STRUC.POPULATION(Ind_No).Error + 4;
else
POP_STRUC.POPULATION(Ind_No).K_POINTS(Step,:)=Kpoints;
end
fprintf(fp, '0 %1d\n', Kpoints(1, 1));
fprintf(fp, '%1d %1d %1d\n', Kpoints(1,:));
fprintf(fp, 'END\n');
fclose(fp);
%checks if structure is magnetic
[nothing, HAVESPIN] =unix('head -n 1 CRYSTAL.d12 | grep SPIN');
if isempty(HAVESPIN);
[nothing, nothing] = unix(['mv fort2.34 fort.34']);
else
[nothing, nothing] = unix('./change_atoms > fort.34');
end
