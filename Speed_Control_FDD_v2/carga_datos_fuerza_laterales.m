%% Carga datos motor
datos=readtable("20230208_Barrido_DLIM_Resultados.xlsx",'Sheet','Barrido Desalineamiento');

Desalineamiento=(0:1:6);
Ipeak=(10:10:100);
valor=1;

FuerzaX=[];
Fuerza1_X=[];
Fuerza2_X=[];
FuerzaRail_Y=[];
Fuerza1_Y=[];
Fuerza2_Y=[];

Dif_X=[];
Dif_Y=[];

Relacion_XY=[];

for i=1:max(size(Desalineamiento))
    for j=1:max(size(Ipeak))
           FuerzaX(i,j)=datos{valor,7};
           Fuerza1_X(i,j)=datos{valor,8};
           Fuerza2_X(i,j)=datos{valor,9};

           Dif_X(i,j)=(Fuerza1_X(i,j)-Fuerza2_X(i,j))/FuerzaX(i,j);
           
           FuerzaRail_Y(i,j)=datos{valor,10};
           Fuerza1_Y(i,j)=datos{valor,11};
           Fuerza2_Y(i,j)=datos{valor,12};
           
           Dif_Y(i,j)=(Fuerza1_Y(i,j))/Fuerza1_X(i,j);

           valor=valor+1;
    end
end



