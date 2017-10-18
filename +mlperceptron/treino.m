function resultadoTreino = treino(dados)

resultadoTreino = dados;

%% mlperceptron
% Parâmetros
epocas = dados.epocas;
txApr = dados.txApr;
numNeuronios = dados.numNeuronios;
precisao = dados.precisao;
epoca = 0;

% Dados de Entrada e Saída
cols = dados.cols;
x = dados.treino(:,cols);
yd = dados.treino(:,dados.colunasInput+1:end);

tam = size(dados.treino,1);
numSaidas = size(yd,2);

w1 = rand(length(cols),numNeuronios);
w2 = rand(numNeuronios,numSaidas);

resultadoTreino.acc = [];
resultadoTreino.contagem = [];
resultadoTreino.erros = [];

while epoca < epocas
    shuffle = randperm(tam);
    x = x(shuffle,:);
    yd = yd(shuffle,:);
    
    for i = 1:tam
        %% forward
        h = x(i,:)*w1;
        [u, u_d] = activation(h,'log');
        z = u*w2;
        [yHat, yHat_d] = activation(z,'log');
        sig1 = yd(i,:) - yHat;
        mse = 0.5*(yd(i,:)-yHat).^2;
        
        %% backpropagation
        sig3 = (-sig1).* yHat_d; % Derivada de y
        dw2 = u'*sig3;
        
        sig2 = (sig3*w2').*u_d; %Derivada de u
        dw1 = x(i,:)'*sig2;
        
        w1 = w1 - txApr*dw1;
        w2 = w2 - txApr*dw2;
        
        % Max - resultado: Índice do maior
        [~,indice] = max(yHat);
        if indice == 3
            indice = 4;
        end
        yt(i,:) = indice;
    end
    
    epoca = epoca +1;
    
    %% Resultados
    yt = de2bi(yt,size(yd,2));
    acc = mean(ones(size(shuffle)) == mean((yd == yt)'));
    resultadoTreino.contagem = epoca;
    resultadoTreino.acc = acc*100;
    resultadoTreino.contagem = epoca;
    resultadoTreino.erros(epoca) = sum(mse);
    
    % 2º condicional
    if abs(sum(mse)) < precisao
        break;
    end
    yt = [];
    
end
resultadoTreino.w1 = w1;
resultadoTreino.w2 = w2;
end