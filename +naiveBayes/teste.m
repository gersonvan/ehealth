function resultadoTeste = teste(dados)

%% Naive Bayes
qntClasses = size(dados.parametros.media,1);
cols = dados.cols;

x = dados.treino(:,cols);
yd = dados.treino(:,dados.colunasInput+1:end);

tam = dados.treino_count;
media = dados.parametros.media;
varian = dados.parametros.var;
priClasse1 = dados.parametros.prioriC1;
priClasse2 = dados.parametros.prioriC2;
if dados.colunasOutput == 3
    priClasse3 = dados.parametros.prioriC3;
end
resultadoTeste.acc = [];
probs = [];
postNum = [];
yHat = [];

% Criar probabilidades do dado a ser classificado
for a = 1:tam % a = linha da base a ser classificada
    for b = 1:qntClasses % i = linha da media e variancia (cada linha é uma classe)
        for c = 1:size(cols,2) % coluna de atributo
            postXY = 1/sqrt(2*pi*varian(b,c))...
                *exp(-((x(a,c)-media(b,c)).^2)/...
                (2*(varian(b,c))));
            probs(b,c) = postXY;
        end
    end

    postNum(1,1) = priClasse1*prod(probs(1,:),2);
    postNum(2,1) = priClasse2*prod(probs(2,:),2);
    if dados.colunasOutput == 3
        postNum(3,1) = priClasse3*prod(probs(3,:),2);
    end
    [~,classe(a,:)] = max(postNum);
    if classe(a,:) == 3
        classe(a,:) = 4;
    end
end
% %% Teste do teste
% classe1 = 0;
% classe2 = 0;
% classe3 = 0;
%
% for i = 1:dados.treino_count
%     if classe(i) == 1
%         classe1 = classe1 + 1;
%     elseif classe(i) == 2
%         classe2 = classe2 + 1;
%     else
%         classe3 = classe3 + 1;
%     end
% end
%
% classe1
% classe2
% classe3

%% Resultados
yHat = de2bi(classe,size(yd,2));
acc = mean(ones(size(tam)) == mean((yd == yHat)'));
resultadoTeste.acc = [resultadoTeste.acc; acc*100];

figure(8)
plotconfusion(yd',yHat')
end