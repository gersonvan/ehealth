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

% % Valor dos erros por realização
% f3 = figure;
% movegui(f3,'northeast');
% plot(erros,'k-');
% title(['Média do Erros das Realizações: ' num2str(mean(erros))])
% xlabel('Realizações')
% ylabel('Percentual')

%% Plots Teste
f4 = figure; %Evolução Percentual e épocas
movegui(f4,'southeast');
plot(accTeste,'bo-');
title(['Testes: ' num2str(numRealizacoes) ...
    ' - Percentual Médio: ' num2str(mean(accTeste)) '%'])
xlabel('Realizações')
ylabel('Percentual')

%% Gráfico de análise dos Dados da Iris
labels = {'1','2','3','4','5','6','7','8','9','10','11','12','13','14'};

for i = 1:length(dat.Output)
    if dat.Output(i,:) == [1 0 0]
        dat.Label{i,1} = 'Vivo';
    else
        dat.Label{i,1} = 'Morto';
    end
end

figure(6)
parallelcoords(dat.Inputs,'Group',dat.Label,'Labels',labels,'quantile',.25)