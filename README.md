# respiratory-gatet-ct

This repository contains the data files used in the paper: 
**“Investigation of different sparsity transforms for the PICCS algorithm in small-animal respiratory gated CT”. J F P J Abascal, M Abella, A Sisniega, J J Vaquero, and M Desco. 
Plos One (accepted 2015).** 
DOI: http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0120140

Small-animal respiratory gated-CT data, with four respiratory gates. We provide data files for the different scenarios used in the paper. 

![Image of Yaktocat](https://github.com/HGGM-LIM/respiratory-gatet-ct/blob/master/image_HighDose.gif)

The repository contains the following files:

- **image_HighDose.mat:** Target images acquired using a high dose protocol(around four times the dose for static imaging, I0)

- **image_HighDose.gif:** Video of images for high dose that shows respiratory motion

- **data_HighDose.mat:** Data for the high dose protocol, it corresponds to image_HighDose.mat.

- **data_I0_120p.mat, data_I0_80p.mat, data_I0_60p.mat, data_I0_40p.mat:** Data for different number of projections (120, 80, 60 and 40, respectively) for a dose I0

- **data_I0_120p.mat, data_I0_120p.mat, data_I0By2_120p.mat, data_I0By4_120p.mat, data_I0By6_120p.mat:** Data for different flux obtained by decreasing flux two, four and six times (I0=4.5e4, I0/2, I0/4, and I0/6), for 120 projections

- **data_HighDose.mat:** Data for the high dose protocol, it corresponds to image_HighDose.mat.

- **G_linux.mat, G_win_geom.mat:** objects from IRT software required for FDK reconstruction, for linux and windows, respectively. These files are intended as a guide to use IRT although IRT software is not required to run the demo

- **DataDifferentScenarios.fig:** Figure that shows the sinogram for respiratory phase one for several scenarios

- **FDK_DifferentScenarios.fig:** FDK reconstructions of data shown in DataDifferentScenarios.fig

- **DemoReadData.m:** This demo loads data for all scenarios that have been used in the paper

Data has been saved using MATLAB R2012b.

If you need to contact the author, please do so at mabella (AT) mce (DOT) hggm (DOT) es.
