function resultadoTreino = treino(dados)

resultadoTreino = dados;

%% rede perceptron
% Parâmetros
epocas = dados.epocas;
txApr = dados.txApr;
numNeuronios = dados.numNeuronios;
precisao = dados.precisao;
epoca = 0;

% Dados de Entrada e saída
cols = dados.cols;
x = dados.treino(:,cols);
yd = dados.treino(:,dados.colunasInput+1:end);

tam = size(dados.treino,1);
numSaidas = size(yd,2);

w = rand(length(cols),numSaidas);

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