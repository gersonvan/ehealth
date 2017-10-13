classdef dsmortalidade<handle
    properties
    end
    
    methods
        function data = ratear(~, dados, holdout)
            
            [linhas, ~] = size(dados);
            n = round(linhas/2);
            treinamento = round(ceil(holdout * n));
                         
            %% Classe 1 e 2
            classe1 = dados(1:n,:);
            classe1 = classe1(randperm(n),:);
            
            classe2 = dados(n+1:end,:);
            classe2 = classe2(randperm(n),:);
            
            %% Dados de Treino e Teste
            data.treino = vertcat(classe1(1:treinamento,:), ...
                classe2(1:treinamento,:));
            data.teste = vertcat(classe1(treinamento+1:end,:), ...
                classe2(treinamento+1:end,:));
            
            %% Mix
            data.treino = data.treino(randperm(length(data.treino)),:);
            data.teste = data.teste(randperm(length(data.teste)),:);
            
            %% Tamanhos
            %Treino
            [data.treino_inputs, ~] = size(data.treino);
            %Teste
            [data.teste_count, ~] = size(data.teste);
            
            %% Normalização
            data.treino(:,1:14) = normalizacao(data.treino(:,1:14));
            data.teste(:,1:14) = normalizacao(data.teste(:,1:14));
            
            %% Bias
            data.treino = [ones(data.treino_inputs,1)*-1 data.treino];
            data.teste = [ones(data.teste_count,1)*-1 data.teste];
        end
    end
end