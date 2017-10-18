% Plots Teste - KNN
f7 = figure; %Evolução Percentual e épocas
movegui(f7,'northeast');
plot(accKs,'bo-');
title(['Ks: ' num2str(k) ...
    ' - Percentual Médio dos ' k ' Ks: ' num2str(mean(accKs)) '%'])
xlabel('Ks')
ylabel('Percentual')