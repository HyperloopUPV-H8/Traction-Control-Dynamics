%% Carga datos Drag

datos=readtable("Estudio drag 3D.xlsx");

vel_drag=0:5:35;
airgap_drag=8:5:23;
valor=1;
Force_drag=[];

for i=1:max(size(vel_drag))
    for j=1:max(size(airgap_drag))
        Force_drag(i,j)=datos{valor,2};
        valor=valor+1;
    end
end

figure
hold on
xlabel('Velocidad Mecánica (km/h)')
ylabel('Fuerza Resistencia (N)')
hold on
plot(vel_drag,Force_drag(:,1),'DisplayName','Altura 8 mm')
plot(vel_drag,Force_drag(:,2),'DisplayName','Altura 13 mm')
plot(vel_drag,Force_drag(:,3),'DisplayName','Altura 18 mm')
plot(vel_drag,Force_drag(:,4),'DisplayName','Altura 23 mm')
ylim([0 250])

