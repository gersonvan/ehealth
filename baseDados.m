if strcmp(base, 'iris')
    filename = 'dados/iris.data';
    dat = load_iris(filename);
    data = dataset_3C();
elseif strcmp(base,'mortalidade')
    filename = 'dados/mortalidade.csv';
    dat = load_mortalidade(filename);
    data = dataset_2C();
end