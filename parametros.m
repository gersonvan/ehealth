function parametro = parametros(dados)

classe1 = [];
classe2 = [];
classe3 = [];
cols = [1:dados.colunasInput];

if dados.colunasOutput == 2
    for i = 1:size(dados.treino,1)
        if dados.treino(i,size(cols,2)+1:end) == [1 0]
            classe1 = [classe1; dados.treino(i,1:dados.colunasInput)];
        else
            classe2 = [classe2; dados.treino(i,1:dados.colunasInput)];
        end
    end
    parametro.media = vertcat(mean(classe1),mean(classe2));
    parametro.var = vertcat(std(classe1),std(classe2));
    % parametro.covar = vertcat(cov(classe1),cov(classe3));
    parametro.prioriC1 = size(classe1,1)/dados.treino_count;
    parametro.prioriC2 = size(classe2,1)/dados.treino_count;
else
    for i = 1:size(dados.treino,1)
        if dados.treino(i,size(cols,2)+1:end) == [1 0 0]
            classe1 = [classe1; dados.treino(i,1:dados.colunasInput)];
        elseif dados.treino(i,size(cols,2)+1:end) == [0 1 0]
            classe2 = [classe2; dados.treino(i,1:dados.colunasInput)];
        else
            classe3 = [classe3; dados.treino(i,1:dados.colunasInput)];
        end
    end
    parametro.media = vertcat(mean(classe1),mean(classe2),mean(classe3));
    parametro.var = vertcat(std(classe1),std(classe2),std(classe3));
    % parametro.covar = vertcat(cov(classe1),cov(classe2),cov(classe3));
    parametro.prioriC1 = size(classe1,1)/dados.treino_count;
    parametro.prioriC2 = size(classe2,1)/dados.treino_count;
    parametro.prioriC3 = size(classe3,1)/dados.treino_count;
end

end