% Plots Teste - KNN
f7 = figure; %Evolu��o Percentual e �pocas
movegui(f7,'northeast');
plot(accKs,'bo-');
title(['Ks: ' num2str(k) ...
    ' - Percentual M�dio dos ' k ' Ks: ' num2str(mean(accKs)) '%'])
xlabel('Ks')
ylabel('Percentual')