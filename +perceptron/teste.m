function resultadoTeste = teste(dados,w,cols)

%% perceptron
[tam, ~] = size(dados.teste);
xt = dados.teste(:,cols);
ydt = dados.teste(:,length(cols)+1:end);
w = w.w;
resultadoTeste.teste = [];

for it = 1:tam

    ut = w*xt(it,:)';
    % função degrau
    if ut > 0
        yt(it,:) = 1;
    else
        yt(it,:) = 0;
    end
end
mt = confusionmat(ydt', yt);
resultadoTeste.acc = (trace(mt) / sum(mt(:)))*100;
figure (5)
plotconfusion(ydt',yt')
end