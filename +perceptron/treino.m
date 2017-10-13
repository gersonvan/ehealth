function resultadoTreino = treino(dados,epocas,cols,n)

%% perceptron
[tam, ~] = size(dados.treino);
x = dados.treino(:,cols);
yd = dados.treino(:,length(cols)+1:end);

[~,numSaidas] = size(yd);
w = rand(numSaidas,length(cols));

epoca = 0;

resultadoTreino.acc = [];
resultadoTreino.contagem = [];
resultadoTreino.yt = [];

while epoca < epocas
    shuffle = randperm(tam);
    x = x(shuffle,:);
    yd = yd(shuffle,:);
    
    for i = 1:dados.treino_inputs
        u = w*x(i,:)';
        
        % função degrau
        if u > 0
            y = 1;
        else
            y = 0;
        end
        
        resultadoTreino.yt(i,:) = (y);
        
        e = yd(i) - y;
        w = w+ n*e*x(i,:);
        
        resultadoTreino.erros(i) = sum(e);
    end
    epoca = epoca+1;
    
    resultadoTreino.w = w;
    mt = confusionmat(yd, resultadoTreino.yt);
    acc = trace(mt) / sum(mt(:));
    resultadoTreino.contagem = epoca;
    resultadoTreino.acc = acc*100;
    if acc == 1
        break;
    end
end
end