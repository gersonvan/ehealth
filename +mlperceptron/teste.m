function resultadoTeste = teste(dados)

cols = dados.cols;

%% perceptron
tam = dados.teste_count;
xt = dados.teste(:,cols);
ydt = dados.teste(:,length(cols)+1:end);

w1 = dados.w1;
w2 = dados.w2;

resultadoTeste = [];
resultadoTeste.acc = [];

for it = 1:tam

    %% forward
        h = xt(it,:)*w1;
        [u, ~] = activation(h,'log');
        z = u*w2;
        [yHat, ~] = activation(z,'log');
        
        [~,indice] = max(yHat);
    if indice == 3
        indice = 4;
    end
    
    yt(it,:) = indice;
        
end
yt = de2bi(yt,size(ydt,2));
acc = mean(ones(size(tam)) == mean((ydt == yt)'));
resultadoTeste.acc = [resultadoTeste.acc; acc*100];

figure (5)
plotconfusion(ydt',yt')
end