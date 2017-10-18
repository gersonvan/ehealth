classdef dataset_2C<handle
    properties
    end
    
    methods
        function data = ratear(~, dados, holdout)
            
            x = dados.Input;
            yd = dados.Output;
            
            [linhasInputs, data.colunasInput] = size(x);
            data.colunasOutput = size(yd,2);
                        
            linhasClasses = round(linhasInputs/2);
            treinamento = round(ceil(holdout * linhasClasses));
            
            data.cols = [1:data.colunasInput];

            %% Classe 1 e 2 mix
            classe1 = [x(1:linhasClasses,:), yd(1:linhasClasses,:)];
            classe1 = classe1(randperm(linhasClasses),:);
            
            classe2 = [x(linhasClasses+1:end,:), yd(linhasClasses+1:end,:)];
            classe2 = classe2(randperm(linhasClasses),:);
            
            %% Dados de Treino e Teste
            data.treino = vertcat(classe1(1:treinamento,:), ...
                classe2(1:treinamento,:));
            data.teste = vertcat(classe1(treinamento+1:end,:), ...
                classe2(treinamento+1:end,:));
            
            %% Tamanhos
            %Treino
            data.treino_count = size(data.treino,1);
            %Teste
            data.teste_count = size(data.teste,1);
            
            %% Mix - Classe 1 e 2 juntas
            data.treino = data.treino(randperm(data.treino_count),:);
            data.teste = data.teste(randperm(data.teste_count),:);
            
            %% Normalização
            data.treino(:,data.cols) = normalizacao(data.treino(:,data.cols));
            data.teste(:,data.cols) = normalizacao(data.teste(:,data.cols));
        end
    end
end