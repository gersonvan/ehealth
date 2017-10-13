function resultadoTreino = treino(dados,epocas,cols,txApr)

%% perceptron
numNeuronios = 8;
epoca = 0;
precisao = 0.01;

x = dados.treino(:,cols);
yd = dados.treino(:,length(cols)+1:end);

[tam, ~] = size(dados.treino);
[~,numSaidas] = size(yd);

w1 = rand(length(cols),numNeuronios);
w2 = rand(numNeuronios,numSaidas);

resultadoTreino.acc = [];
resultadoTreino.contagem = [];

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
        
        % Índice para transformação em binário
        [~,indice] = max(yHat);
        if indice == 3
            indice = 4;
        end
        yt(i,:) = indice;

        resultadoTreino.erros(i,:) = sum(mse);
    end
    
    epoca = epoca +1;
    
    yt = de2bi(yt,size(yd,2));
    acc = mean(ones(size(shuffle)) == mean((yd == yt)'));
    resultadoTreino.contagem = epoca;
    resultadoTreino.acc = acc*100;
    resultadoTreino.contagem = epoca;
    
    if abs(sum(mse)) < precisao
        break;
    end
    
    yt = [];
end
resultadoTreino.w1 = w1;
resultadoTreino.w2 = w2;
end