%% Plots Teste
f4 = figure; %Evolução Percentual e épocas
movegui(f4,'southeast');
plot(accTeste,'bo-');
title(['Testes: ' num2str(numRealizacoes) ...
    ' - Percentual Médio: ' num2str(mean(accTeste)) '%'])
xlabel('Realizações')
ylabel('Percentual')