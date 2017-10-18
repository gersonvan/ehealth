classdef dataset_3C<handle
    properties
    end
    
    methods
        function data = ratear(~, dados, holdout)
            
            % Número de atributos passados
            data.cols = [1:4];
%             data.cols = [1:14];
            
            x = dados.Input(:,data.cols);
            yd = dados.Output;
            
            %Atributos
            [linhasInputs, data.colunasInput] = size(x);
            data.colunasOutput = size(yd,2);
                        
            linhasClasses = round(linhasInputs/3);
            treinamento = round(ceil(holdout * linhasClasses));
            
            %% Classe 1, 2 e 3 mix
            classe1 = [x(1:linhasClasses,:),...
                yd(1:linhasClasses,:)];
            classe1 = classe1(randperm(linhasClasses),:);
            
            classe2 = [x(linhasClasses+1:2*linhasClasses,:),...
                yd(linhasClasses+1:2*linhasClasses,:)];
            classe2 = classe2(randperm(linhasClasses),:);
            
            classe3 = [x(2*linhasClasses+1:end,:),...
                yd(2*linhasClasses+1:end,:)];
            classe3 = classe3(randperm(linhasClasses),:);
            
            %% Dados de Treino e Teste
            data.treino = vertcat(classe1(1:treinamento,:), ...
                classe2(1:treinamento,:), classe3(1:treinamento,:));
            data.teste = vertcat(classe1(treinamento+1:end,:), ...
                classe2(treinamento+1:end,:), classe3(treinamento+1:end,:));
            
            %% Tamanhos
            %Treino
            data.treino_count = size(data.treino,1);
            %Teste
            data.teste_count = size(data.teste,1);
            
            %% Mix - Classe 1, 2 e 3 juntas
            data.treino = data.treino(randperm(data.treino_count),:);
            data.teste = data.teste(randperm(data.teste_count),:);
            
            %% Normalização
            data.treino(:,1:data.colunasInput) = ...
                normalizacao(data.treino(:,1:data.colunasInput));
            data.teste(:,1:data.colunasInput) = ...
                normalizacao(data.teste(:,1:data.colunasInput));
            
            %% Bias
%             data.treino = [ones(data.treino_count,1)*-1 data.treino];
%             data.teste = [ones(data.teste_count,1)*-1 data.teste];
            
            % Número de atributos passados com Bias
%             data.cols = [1:5];
            
            %Atributos com Bias
%             data.colunasInput = size(x,2)+1;
        end
    end
end