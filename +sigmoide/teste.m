function resultadoTeste = teste(dados, w,cols)

%% perceptron
[tam, ~] = size(dados.teste);
xt = dados.teste(:,cols);
ydt = dados.teste(:,length(cols)+1:end);
w = w.w;
resultadoTeste.teste = [];

for it = 1:tam
    
    ut = w*xt(it,:)';
    
    % função sigmoide
    yt(it) = 1./(1+exp(-ut));
    yt(it) = 1*(yt(it) >= 0.5);
end
mt = confusionmat(ydt', yt);
resultadoTeste.acc = (trace(mt) / sum(mt(:)))*100;
figure (5)
plotconfusion(ydt',yt)
end