%% Plots Teste
f4 = figure; %Evolu��o Percentual e �pocas
movegui(f4,'southeast');
plot(accTeste,'bo-');
title(['Testes: ' num2str(numRealizacoes) ...
    ' - Percentual M�dio: ' num2str(mean(accTeste)) '%'])
xlabel('Realiza��es')
ylabel('Percentual')