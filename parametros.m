function parametro = parametros(dataset)

parametro.media = mean(dataset.treino(:));
parametro.var1 = std(dataset.treino(:));
parametro.covar1 = cov(dataset.treino(:));

end