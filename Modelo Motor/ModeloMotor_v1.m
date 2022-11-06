load('datos_total.mat');

motor.forceX = Fx_idq(:,:,1);
motor.forceY = Fy_idq(:,:,1);
motor.id = id;
motor.iq = iq;

motor.tableFx = Fx_idq;
motor.tableFy = Fy_idq;

motor.angle = angle;
motor.currentATable = current_a;
motor.currentBTable = current_b;
motor.currentCTable = current_c;
