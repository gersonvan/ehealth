function resultadoTeste = teste(dados)

%% KNN
tam = dados.treino_count;
tamt = dados.teste_count;
cols = [1:dados.colunasInput];

x = dados.treino(:,cols);
xt = dados.teste(:,cols);

yd = dados.treino(:,length(cols)+1:end);
ydt = dados.teste(:,length(cols)+1:end);

resultadoTeste.acc = [];
categorias = [];

%% Distância - %calcdist Calcula distância e retorna o vencedor
for a = 1:tamt
    distancia = [];
    outputs = [];
    classe = [];
    
    for b = 1:tam
        euclidiana(b,:) = sqrt(sum((xt(a,:) - x(b,:)).^2));
    end
    
    distancia = horzcat(euclidiana,yd);
    distancia = sortrows(distancia);
    
    for c = 1:dados.k
        [~, classe(c,:)] = max(distancia(c,2:dados.colunasOutput+1),[],2);
        if classe(c) == 3
            classe(c) = 4;
        end
    end
    yHat(a,:) = de2bi(mode(classe),size(ydt,2));
end
acc = mean(ones(size(tamt)) == mean((ydt == yHat)'));
resultadoTeste.acc = [resultadoTeste.acc; acc*100];

figure (5)
plotconfusion(ydt',yHat')

% %% Classificação
% for c = 1:dataset.teste_count
%     if output(c) == categorias(c)
%         acerto = acerto +1;
%         x = dataset.teste.inputs(c,1);
%         y = dataset.teste.inputs(c,2);
%         %                 NUM_K = numel(unique(categorias));
%         %                 classifCerta = [classifCerta; x, y, categorias(c)];
%         if categorias(c) == 1
%             plot(x,y, 'b.');
%         elseif categorias(c) == 2
%             plot(x,y, 'k.');
%         else
%             plot(x,y, 'g.');
%         end
%     end
% end
% hold on
% acerto = (acerto/dataset.teste_count)*100;
% acertos = [acertos;acerto];
%
% for t = 1:dataset.teste_count % converter os valores das saídas de binário para decimal
%     saidasBin(t,:) = de2bi(categorias(t,:),3);
% end
% hold on
% k = k+1;
% media = mean(acertos);
% dsvpd = std(acertos);
% medias = [medias; dsvpd,media];
% mediaMedias = mean(medias);
%
% [per, per2] = max(medias);
%
% figure
% plot(medias, 'ko-')
% title(['KNN - 70 repetições ' ...
%     ' - Média Geral: ' num2str(mediaMedias(:,2)) '%'])
% xlabel('Número de Ks')
% ylabel('Média de percentual de 30 treinamentos em cada K:')
% figure
% plotconfusion(dataset.teste.outputs', saidasBin', 'Teste')

end