function resultadoTeste = teste(dados)

%% perceptron
[tam, ~] = size(dados.teste);
cols = dados.cols;

xt = dados.teste(:,cols);
ydt = dados.teste(:,length(cols)+1:end);
w = dados.w;

resultadoTeste.teste = [];
resultadoTeste.acc = [];

for it = 1:tam
    
    ut = xt(it,:)*w;
    [yt, ~] = activation(ut,'log');
    
    [~,indice] = max(yt);
    if indice == 3
        indice = 4;
    end
    
    yHat(it,:) = indice;
    
end
yHat = de2bi(yHat,size(ydt,2));
acc = mean(ones(size(tam)) == mean((ydt == yHat)'));
resultadoTeste.acc = [resultadoTeste.acc; acc*100];

figure (5)
plotconfusion(ydt',yHat')
end