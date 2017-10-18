clc; clear;
tic

%% Arquivo para execu��o
holdout = 0.7;
numRealizacoes = 10;

%% Dados
base = 'iris'; %'iris' e 'mortalidade'
baseDados()

%% Execu��o
for i = 1:numRealizacoes
    %% Dataset normalizado
    dataset = data.ratear(dat,holdout);
    %configs iniciais
    dataset.epocas = 200;
    dataset.txApr = 0.1;
    dataset.numNeuronios = 8;
    dataset.precisao = 0.01;
    
    %% Treino
    resultadoTreino = redePerceptron.treino(dataset);
    
    % dados para gr�ficos
    epoca(i) = resultadoTreino.contagem;
    accTreino(i) = mean(resultadoTreino.acc);
    erros(i) = mean(resultadoTreino.erros);
    i
    %% Teste
    resultadoTeste = redePerceptron.teste(resultadoTreino);
    
    % dados para gr�ficos
    accTeste(i) = resultadoTeste.acc;
%         plotDecisionBoundary()
end

plotTreino()
plotTeste()

codeelapsed_time = toc
% gaussianGraph(classifCerta, parametro, tipo);