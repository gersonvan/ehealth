function resultadoTreino = treino(dados,epocas,cols,txApr)

%% rede perceptron
[tam, ~] = size(dados.treino);
x = dados.treino(:,cols);
yd = dados.treino(:,length(cols)+1:end);

[~,numSaidas] = size(yd);
w = rand(length(cols),numSaidas);

epoca = 0;
precisao = 0.01;

resultadoTreino.acc = [];
resultadoTreino.contagem = [];
resultadoTreino.erros = [];

while epoca < epocas
    shuffle = randperm(tam);
    x = x(shuffle,:);
    yd = yd(shuffle,:);
    
    for i = 1:tam
        u = x(i,:)*w;
        % função ativação
        [y, ~] = activation(u,'log');
        
        e = yd(i,:) - y;
        w = w + txApr*x(i,:)'*e;
        
        % Índice para transformação em binário
        [~,indice] = max(y);
        if indice == 3
            indice = 4;
        end
        yt(i,:) = indice;
        
        resultadoTreino.erros(i) = sum(e);
        
    end
    
    epoca = epoca +1;
    
    %% Dados para gráficos
    yt = de2bi(yt,size(yd,2));
    acc = mean(ones(size(shuffle)) == mean((yd == yt)'));
    resultadoTreino.contagem = epoca;
    resultadoTreino.acc = acc*100;
    
    %% 2º condicional de parada
    if abs(e) < precisao
        break;
    end
    
    yt = [];
end
resultadoTreino.w = w;
end