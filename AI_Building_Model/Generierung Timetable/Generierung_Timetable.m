%Einlesen der Daten

T_amb = readtable("Wetter.txt");
Q_heat = readtable("Qdot.txt");
Q_sol = readtable("Qsol.txt");
Q_int = readtable("Qint.txt");
T_in = readtable("Ti.txt");
T_wohn = readtable("Twohn.txt");
T_hall = readtable("T_Hall.txt");

%Anpassung der Tabellen auf gleiche Höhe 23231
%T_amb(23232,:) = [30-04-2024 00:00:00 12.1 0 0]

Q_heat(23232:end,:) = [];
Q_sol(23232:end,:) = [];
T_in(23232:end,:) = [];
T_wohn(23232:end,:) = [];
T_hall(23232:end,:) = [];

%Entfernung der timestamps

Q_sol(:,1) = [];
Q_int(:,1) = [];
T_in(:,1) = [];
T_wohn(:,1) = [];
T_hall(:,1) = [];

%Entfernung unwichtiger Größen

T_amb = removevars(T_amb,"Irr_glob_Wm2");
T_amb = removevars(T_amb,"relHumididy_percent");


%Einbetten der richtigen Wohnzimmer und Flur Temperatur in T_in

T_in = removevars(T_in,"EG_LivingKitchen_degC");
T_in = addvars(T_in,T_wohn,'Before','EG_Utilities_degC');
T_in = removevars(T_in,"EG_HallwayEntrance_degC");
T_in = addvars(T_in,T_hall,'Before','EG_Utilities_degC');
T_in = splitvars(T_in,"T_wohn");
T_in = splitvars(T_in,"T_hall");

%sinnvolle Bennenung der Variablen

T_in = renamevars(T_in,"Var1","EG_LivingKitchen_degC");
T_in = renamevars(T_in,"eg_flur_pm_t","EG_HallwayEntrance_degC");
Q_heat = renamevars(Q_heat,"Var1","Q_heat");
Q_sol = renamevars(Q_sol,"inverter_production","Q_sol");
Q_int = renamevars(Q_int,"Qint","Q_int");

%Zusammenfügen in Rechenmatrix

data = [T_amb Q_heat Q_sol Q_int T_in] %[output:87794da3]

%Ausgeben der Rechenmatrix

writetable(data,"Measurements")

%[appendix]
%---
%[metadata:view]
%   data: {"layout":"onright","rightPanelPercent":40}
%---
%[output:87794da3]
%   data: {"dataType":"tabular","outputData":{"columnNames":["timestamps","T_Amb_degC","Q_heat","Q_sol","Q_int","EG_LivingKitchen_degC","EG_HallwayEntrance_degC","EG_Utilities_degC","EG_Dressing_degC","EG_Sleeping_degC","EG_Bath_degC","EG_GuestBath_degC","EG_Server_degC","OG_Office_degC","OG_Sleeping_degC","OG_Bath_degC"],"columns":16,"dataTypes":["datetime","double","double","double","double","double","double","double","double","double","double","double","double","double","double","double"],"header":"23231×16 table","name":"data","rows":23231,"type":"table","value":[["01-Sep-2023 00:15:00","15.2000","0","0","100","21.2200","23.8600","23.2400","22.4000","22.9400","22.5000","23.8400","28.1800","21.8600","21.4400","23.3200"],["01-Sep-2023 00:30:00","15.0667","0","0","129.5850","21.1409","23.8600","23.2000","22.4333","23.0067","22.4600","23.8467","28.1800","21.8800","21.4267","23.3067"],["01-Sep-2023 00:45:00","14.7000","0","0","249.9800","21.0804","23.8798","23.2133","22.4333","23.0200","22.4467","23.8667","26.8600","21.8600","21.3867","23.3000"],["01-Sep-2023 01:00:00","14.5000","0","0","437.8537","20.9405","23.8403","23.1667","22.4200","23","22.4400","23.8400","26.2000","21.8533","21.3733","23.2933"],["01-Sep-2023 01:15:00","14.1333","0","0","452.0200","20.9203","23.8597","23.1600","22.4267","23.0133","22.4467","23.8533","26.2000","21.8467","21.3267","23.2800"],["01-Sep-2023 01:30:00","13.8667","0","0","247.6013","20.8405","23.8603","23.1133","22.4267","23.0600","22.4333","23.8400","26.2000","21.8533","21.3067","23.2733"],["01-Sep-2023 01:45:00","13.7667","0","0","206.5033","20.8600","23.8795","23.1067","22.4467","23.0667","22.4333","23.8333","26.2000","21.8400","21.2800","23.2733"],["01-Sep-2023 02:00:00","13.8000","0","0","193.5414","20.8200","23.8403","23.0867","22.4333","23.0733","22.4067","23.8267","26.2000","21.8333","21.2467","23.2600"],["01-Sep-2023 02:15:00","13.9667","0","0","194.0634","20.7803","23.8595","23.0600","22.4200","23.0867","22.4133","23.8067","26.2000","21.8267","21.2400","23.2600"],["01-Sep-2023 02:30:00","14.0333","0","0","191.8704","20.7995","23.8597","23.0600","22.4400","23.0867","22.4267","23.8200","26.2000","21.8000","21.2200","23.2467"],["01-Sep-2023 02:45:00","14.2000","0","0","198.3935","20.8200","23.8797","23.0200","22.4267","23.0533","22.4133","23.8000","26.2000","21.8000","21.2267","23.2333"],["01-Sep-2023 03:00:00","14.7333","0","0","200.1096","20.8400","23.9000","23.0267","22.4200","23.0467","22.4000","23.8067","26.2000","21.7867","21.2133","23.2333"],["01-Sep-2023 03:15:00","14.3333","0","0","197.7338","20.8795","23.9000","23.0067","22.4200","23.0467","22.4000","23.7933","26.2000","21.8000","21.2200","23.2267"],["01-Sep-2023 03:30:00","14.2667","0","0","196.6035","20.8404","23.9400","23.0067","22.4133","23.0533","22.4067","23.8067","26.2000","21.8000","21.2267","23.2200"]]}}
%---
