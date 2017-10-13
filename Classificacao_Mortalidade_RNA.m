clc; clear;

%% Arquivo para execu��o
tic

%configs iniciais
holdout = 0.7;
numRealizacoes = 30;
epocas = 200;
txApr = 0.1;
filename = 'dados/mortalidade.csv';

%vetores de dados para gr�ficos
epoca = [];
accTreino = [];
accTeste = [];
erros = [];

%% carrega Mortalidade
data = dsmortalidade();

%% Dados
saida = 'hotone';
if strcmp(saida,'hotone')
    dat = load_mortalidade_hotone(filename);
else
    dat = load_mortalidade(filename);
end
rawData = [dat.Inputs, dat.Output];

%% Execu��o
for i = 1:numRealizacoes
    %% Dataset normalizado
    dataset = data.ratear(rawData,holdout);
    cols = [1:15];
    %% Treino
    resultadoTreino = mlperceptron.treino(dataset,epocas,cols,txApr);
    
    % dados para gr�ficos
    epoca(i) = resultadoTreino.contagem;
    accTreino(i) = mean(resultadoTreino.acc);
    erros(i) = mean(resultadoTreino.erros);
    
    %% Teste
    resultadoTeste = mlperceptron.teste(dataset,resultadoTreino,cols);
    
    % dados para gr�ficos
    accTeste(i) = resultadoTeste.acc;
end

plotagens()

codeelapsed_time = toc 
% gaussianGraph(classifCerta, parametro, tipo);