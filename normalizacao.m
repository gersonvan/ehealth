function dados = normalizacao(dados)

%% normaliza��es
maximo = max(dados);
minimo = min(dados);

dados = bsxfun(@rdivide,bsxfun(@minus,dados,minimo),...
    bsxfun(@minus,maximo,minimo));

end