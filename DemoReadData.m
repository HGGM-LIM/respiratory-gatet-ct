% DemoReadData.m
% 
% Demo file to read data files used in the paper "Investigation of
% different sparsity transforms for the PICCS algorithm in small-animal
% respiratory gated CT", J F P J Abascal, M Abella, A Sisniega, J J
% Vaquero, M Desco. Accepted in Plos One   
% 
% It shows how to load data for all scenarios used in the paper (see paper
% and description below).  
%
% mail: mabella@hggm.es

% -------------------------------------------------------------------------
% READ TARGET IMAGE
%
% Read target image acquired from a high dose protocol (dosis four times
% the dosis used for static imaging)
load('image_HighDose');

% Display four respiratory gates
figure; 
for it = 1:4
    imagesc(u(:,:,it)); colormap gray; axis image; colorbar;
    title(['Gate ' num2str(it)]);
    pause(0.3);
end

% -------------------------------------------------------------------------
% READ SIMULATED DATA FOR DIFFERENT SCENARIOS
% 
%
% HIGH DOSE DATA
%
% High dose data simulated from images acquired using a high dose protocol
% (dose around four times the dose for static imaging (I0))
% Data has been simulated using Fessler's IRT software. 
% (J.A. Fessler, Image reconstruction toolbox (IRT), 2011, retrieved from
% <http://www.eecs.umich.edu/~fessler/code/index.html>). 
%
% The following lines provides the parameters used to generate the matrix
% operator, G (used for data simulation), using IRT: 
% n_m         = 1;
% numPerProj  = 350;
% N           = [350 350];
% n_x         = N(1);
% numProj     = [360] 
% totalAngle  = [360]; 
% binning     = 4;
% n_ang = numProj;       
% det_z_count = 1; detector_count= n_x; pixel_count=n_x*n_x;
% ds          = 50e-4*binning; % pixel sixe= min pixel*binning
% dx          = ds/1.6;
% cg          = sino_geom('fan','nb',n_x, 'na', n_ang, ...
%     'ds',ds, 'orbit',-totalAngle, ...   
%     'offset_s', 0.0, ...
%     'dsd', 35.2, 'dod', 13.2, 'dfs', inf);
% ig          = image_geom('nx', n_x, 'ny', n_x,'dx', dx); 
% G           = Gtomo2_dscmex(cg, ig);

modeIRT     = 'n'; % change to 'y' if IRT software is installed
if modeIRT     == 'y'
    % It requires IRT software
    % Load Forward Operator 
    %load('G_linux','geom'); % In Linux, file contains 'geom', 'cg', 'ig', 'G'
    load('G_win_geom','geom'); % In Windows, file contains 'geom', 'G' would occupy 5GBy
end

load('data_HighDose','dataAll0');

% We display the sinogram for the respiratory gate 1 for few scenarios
h=figure; 
subplot(2,2,1); 
imagesc(dataAll0(:,:,1)); title('Data for High dose'); colorbar; 

if modeIRT     == 'y'
    % FBP using IR software
    im      = fbp2(dataAll0(:,:,1), geom); im(im<0) = 0;
    h2=figure; 
    colormap gray; axis image; 
    subplot(2,2,1); 
    imagesc(im); title('FDK of High dose'); colorbar; axis image; 
end
% ---------------------------
% STANDARD DOSE FOR STAIC IMAGING
nameData    = 'data_I0_120p';
load(nameData,'dataAll');
figure(h);
subplot(2,2,2); 
imagesc(dataAll(:,:,1)); title('Data for 120p and I_0'); colorbar; 

if modeIRT     == 'y'
    % FBP using IR software
    im      = fbp2(dataAll(:,:,1), geom); im(im<0) = 0;
    figure(h2); 
    colormap gray; axis image; 
    subplot(2,2,2); 
    imagesc(im); title('FDK of 120p and I_0'); colorbar; axis image; 
end
% ---------------------------
% DIFFERENT FLUX
%
% Different flux, decreasing the original flux two, four and six times 
% (I0=4.5e4, I0/2, I0/4, and I0/6), for 120 projections (120p)
% 
% Substitute nameData by 'data_I0_120p', 'data_I0By2_120p',
% 'data_I0By4_120p' and 'data_I0By6_120p' to load data for different
% scenarios
nameData    = 'data_I0By6_120p';
load(nameData,'dataAll');

figure(h);
subplot(2,2,3); 
imagesc(dataAll(:,:,1)); title('Data for 120p and I_0/6'); colorbar; 

if modeIRT     == 'y'
    % FBP using IR software
    im      = fbp2(dataAll(:,:,1), geom); im(im<0) = 0;
    figure(h2); 
    colormap gray; axis image; 
    subplot(2,2,3); 
    imagesc(im); title('FDK of 120p and I_0/6'); colorbar; axis image; 
end

% ---------------------------
% DIFFERENT NUMBER OF PROJECTIONS
%
% Different the number of projections by two, four and six times 
% (120p, 80p, 60p and 40p), for a flux I0
% 
% Substitute nameData by 'data_I0_120p', 'data_I0_80p',
% 'data_I0_60p' and 'data_I0_40p' to load data for different
% scenarios
nameData    = 'data_I0_40p';
load(nameData,'dataAll');

figure(h);
subplot(2,2,4); 
imagesc(dataAll(:,:,1)); title('Data for I_0 and 40p'); colorbar; 

if modeIRT     == 'y'
    % FBP using IR software
    im      = fbp2(dataAll(:,:,1), geom); im(im<0) = 0;
    figure(h2); 
    colormap gray; axis image; 
    subplot(2,2,4); 
    imagesc(im); title('FDK of I_0 and 40p'); colorbar; axis image; 
end

if modeIRT     == 'n'
    uiopen('FDK_DifferentScenarios.fig',1);
end
% -------------------------------------------------------------------------
