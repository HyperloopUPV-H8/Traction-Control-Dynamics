datos=readtable("20230421_DLIM_Estimacion_Inductancia.xlsx");

corriente_inductancia=datos{1:4,4};
valores_inductancia=datos{1:4,11};

% plot(corriente_inductancia,valores_inductancia)

% p1_induc =  -8.492e-10;
% p2_induc =   6.342e-08;
% p3_induc =  -1.036e-06;
% p4_induc =    0.003454;