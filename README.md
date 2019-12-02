# Interface_USPEX9.4.4_CRYSTAL
USPEX 9.4.4/CRYSTAL interface

Please, note that you can also cite this interface. DOI number created by Zenodo repository can be found here: 10.5281/zenodo.3559474. DOI number of original publications can be found here: 10.1021/acs.jpcc.8b08238.

Interface is written for CRYSTAL17, but should be suitable at least for CRYSTAL14. To use CRYSTAL, specify "20" as the code number in the USPEX input file.

To use the interface:

1) Copy to directory src/FunctionFolder/AbinitCode the following files:

Clean_AbinitCode.m
Read_AbinitCode.m
Read_CRYSTAL.m
Read_CRYSTAL_Structure.m
Read_Structure.m
Write_AbinitCode.m
Write_CRYSTAL.m

2) Copy Create_CalcFolder.m file to directory src/FunctionFolder/sys 

3) Copy change_atoms file to src/FunctionFolder/Tool

4) Copy Initialize.m file to src/FunctionFolder/USPEX/src (it will create CRYSTAL_OUTPUTS folder where outputs files will be saved)

Don't forget to make all of the script executable (chmod+x).

USPEX will automatically create folder "CRYSTAL_OUTPUTS" with all output files from CRYSTAL.

In order to get correct space group of the magnetic systems (keyword SPIN is used in the CRYSTAL input file), you have to have the word "SPIN" in the first line of the CRYSTAL input file followed by the atomic number of the element (see example folder). In the USPEX input file you have to specify "He" for atoms with opposite spins (-1). If you do not want to use such option for magnetic systems with specified spins, do not forget to turn off symmetry in USPEX input file (0  : doSpaceGroup). 

More information with examples can be found from https://wiki.aalto.fi/display/IMM/USPEX+guide. Guide is especially recommended if you use the interface for calculation of magnetic structures.
