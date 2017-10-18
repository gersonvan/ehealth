clc; clear;

%% Arquivo para execução
tic
%configs iniciais
holdout = 0.7;
numRealizacoes = 20;

%vetores de dados para gráficos
accTeste = [];

%% Dados
%% Dados
base = 'mortalidade'; %'mortalidade'
baseDados()

%% Execução
for i = 1:numRealizacoes
    %% Dataset normalizado
    dataset = data.ratear(dat,holdout);
    
    %% Treino
    resultadoTreino = naiveBayes.treino(dataset);
    
    %% Teste
    resultadoTeste = naiveBayes.teste(resultadoTreino);
    
    % dados para gráficos
    accTeste(i) = resultadoTeste.acc;
end

plotTeste()

codeelapsed_time = toc
% gaussianGraph(classifCerta, parametro, tipo);