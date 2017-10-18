%% Gráfico de análise dos Dados da Base de dados

labels = {'1','2','3','4','5','6','7','8','9','10','11','12','13','14'};

for i = 1:length(dat.Output)
    if dat.Output(i,:) == [1 0 0]
        dat.Label{i,1} = 'Vivo';
    else
        dat.Label{i,1} = 'Morto';
    end
end

figure(6)
parallelcoords(dat.Input,'Group',dat.Label,'Labels',labels,'quantile',.25)