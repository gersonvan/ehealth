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

% % Valor dos erros por realiza��o
% f3 = figure;
% movegui(f3,'northeast');
% plot(erros,'k-');
% title(['M�dia do Erros das Realiza��es: ' num2str(mean(erros))])
% xlabel('Realiza��es')
% ylabel('Percentual')

%% Plots Teste
f4 = figure; %Evolu��o Percentual e �pocas
movegui(f4,'southeast');
plot(accTeste,'bo-');
title(['Testes: ' num2str(numRealizacoes) ...
    ' - Percentual M�dio: ' num2str(mean(accTeste)) '%'])
xlabel('Realiza��es')
ylabel('Percentual')

%% Gr�fico de an�lise dos Dados da Iris
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