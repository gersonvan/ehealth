%% Plots Treino
% Percentual por realiza��o
f1 = figure;
movegui(f1,'southwest');
plot(accTreino,'ko-');
title(['M�dia percentual dos treinos:' num2str(mean(accTreino)) '%'])
xlabel('Realiza��es')
ylabel('Percentual')

% N�mero de epocas por percentual
f2 = figure;
movegui(f2,'center');
plot(epoca,accTreino,'ko');
title(['M�dia de �pocas: ' num2str(mean(epoca))])
xlabel('�pocas Realizadas')
ylabel('Percentual')

% Valor dos erros por realiza��o
f3 = figure;
movegui(f3,'northeast');
plot(erros,'k-');
title(['M�dia do Erros das Realiza��es: ' num2str(mean(erros))])
xlabel('Realiza��es')
ylabel('Percentual')
