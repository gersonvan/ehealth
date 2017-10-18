%% Plots Treino
% Percentual por realização
f1 = figure;
movegui(f1,'southwest');
plot(accTreino,'ko-');
title(['Média percentual dos treinos:' num2str(mean(accTreino)) '%'])
xlabel('Realizações')
ylabel('Percentual')

% Número de epocas por percentual
f2 = figure;
movegui(f2,'center');
plot(epoca,accTreino,'ko');
title(['Média de épocas: ' num2str(mean(epoca))])
xlabel('Épocas Realizadas')
ylabel('Percentual')

% Valor dos erros por realização
f3 = figure;
movegui(f3,'northeast');
plot(erros,'k-');
title(['Média do Erros das Realizações: ' num2str(mean(erros))])
xlabel('Realizações')
ylabel('Percentual')
