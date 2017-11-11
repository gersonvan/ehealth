clc; clear;
%% Arquivo para execu��o
tic
%configs iniciais
holdout = 0.7;
numRealizacoes = 20;
k = 5;
ks = 5
%vetores de dados para gr�ficos
accTeste = [];
accTestes = [];

%% Dados
base = 'iris'; % 'iris' e 'mortalidade'
baseDados()

%% Execu��o
for a = 1:ks
    for i = 1:numRealizacoes
        %% Dataset normalizado
        dataset = data.ratear(dat,holdout);
        
        %% Treino
        resultadoTreino = knn.treino(dataset);
        resultadoTreino.k = ks;
        %% Teste
        resultadoTeste = knn.teste(resultadoTreino);
        
        % dados para gr�ficos
        accTeste(i) = resultadoTeste.acc;
    end
    accKs(a) = mean(accTeste);
    k = k+1;
    plotDecisionBoundary()
end

plotKNN()
plotTeste()

codeelapsed_time = toc
% gaussianGraph(classifCerta, parametro, tipo);