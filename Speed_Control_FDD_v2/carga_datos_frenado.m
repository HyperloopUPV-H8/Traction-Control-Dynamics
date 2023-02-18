%% Freno

datos=readtable("20230212_Barrido_DLIM_Freno_Resultados.xlsx");


slip_freno=1:0.1:2;
frecuencia_freno=-42:6:-6;
 
FuerzaX_freno=[];
FuerzaY_freno=[];
Flujo_freno=[];
valor=max(size(datos));

for i=1:max(size(slip_freno))
    for j=1:max(size(frecuencia_freno))
           FuerzaX_freno(i,j)=datos{valor,6};
           FuerzaY_freno(i,j)=datos{valor,7};
           Flujo_freno(i,j)=double(datos{valor,8});
           valor=valor-1;
    end
end



%% Graficas vel-fuerza
v_m_freno=[];
Force_freno=[];
maxForce_freno=[];
indicesSlip_freno=[];


figure
hold on
grid
for k=1:max(size(frecuencia_freno))
   v_ref_freno=7.2*0.114*frecuencia_freno(k);
    for i=1:max(size(slip_freno))
        v_m_freno(i,k)=v_ref_freno-slip_freno(i)*v_ref_freno;
        Force_freno(i,k)=FuerzaX_freno(i,k);
    end

    plotvalue_freno(k)=plot(v_m_freno(:,k),Force_freno(:,k),'DisplayName',string(frecuencia_freno(k))+'Hz');
end
legend
xlabel('Vel motor(Km/h)')
ylabel('F (N)')
hold off



v_motor_freno=linspace(0,35,max(size(slip_freno)));
td_freno = get(plotvalue_freno, 'XData');
tdm_freno = cell2mat(td_freno); 
yd_freno=get(plotvalue_freno,'YData');
ydm_freno = cell2mat(yd_freno);
newy_freno = zeros(size(tdm_freno,1), numel(v_motor_freno));

for k1 = 1:size(tdm_freno,1)
    newy_freno(k1,:) = interp1(tdm_freno(k1,:), ydm_freno(k1,:), v_motor_freno);   % Map Individual Curve Independent Variables To ‘allt’
end

vel_motor_max_f_freno=[];
freq_motor_max_f_freno=[];
for m=1:max(size(v_motor_freno))
    [minimo,indice]=min(newy_freno(:,m));
    vel_motor_max_f_freno(m)=v_motor_freno(m);
    frec_max_f_freno(m)=frecuencia_freno(indice);
end
frec_max_f_freno(m)=42;

figure
hold on
plot(vel_motor_max_f_freno,frec_max_f_freno,'.', 'markersize', 8)
hold off



