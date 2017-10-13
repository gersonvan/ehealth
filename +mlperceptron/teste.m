function resultadoTeste = teste(dados, w,cols)

%% perceptron
[tam, ~] = size(dados.teste);
xt = dados.teste(:,cols);
ydt = dados.teste(:,length(cols)+1:end);

w1 = w.w1;
w2 = w.w2;

resultadoTeste = [];
resultadoTeste.acc = [];

for it = 1:tam

    %% forward
        h = xt(it,:)*w1;
        [u, ~] = activation(h,'log');
        z = u*w2;
        [yHat, ~] = activation(z,'log');
        sig1 = ydt(it,:) - yHat;
        mse = 0.5*(ydt(it,:)-yHat).^2;
        
        [~,indice] = max(yHat);
    if indice == 3
        indice = 4;
    end
    
    yt(it,:) = indice;
    resultadoTeste.erros(it,:) = sum(mse);
        
end
yt = de2bi(yt,size(ydt,2));
acc = mean(ones(size(tam)) == mean((ydt == yt)'));
resultadoTeste.acc = [resultadoTeste.acc; acc*100];

figure (5)
plotconfusion(ydt',yt')
end