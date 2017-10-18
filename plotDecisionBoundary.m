classe1 = [];
classe2 = [];
classe3 = [];

x = dataset.teste(:,1:dataset.colunasInput);
y = dataset.teste(:,dataset.colunasInput+1:end);

if dataset.colunasInput == 3
    for c = 1:dataset.teste_count
        if y(c,:) == [1 0 0]
            classe1 = [classe1; x(c,:)];
        elseif y(c,:) == [0 1 0]
            classe2 = [classe2; x(c,:)];
        else
            classe3 = [classe3; x(c,:)];
        end
    end
    meanClasses = vertcat(mean(classe1),mean(classe2),mean(classe3));
else
    for c = 1:dataset.teste_count
        if y(c,:) == [1 0]
            classe1 = [classe1; x(c,:)];
        else
            classe2 = [classe2; x(c,:)];
        end
    end
    meanClasses = vertcat(mean(classe1),mean(classe2));
end

xrange = [-0.5 1.5];
yrange = [-0.5 1.5];

inc = 0.01;
[x1, y1] = meshgrid(xrange(1):inc:xrange(2), yrange(1):inc:yrange(2));
image_size = size(x1);

xy = [x1(:) y1(:)]; % make (x,y) pairs as a bunch of row vectors.

xy = [reshape(x1, image_size(1)*image_size(2),1) ...
    reshape(y1, image_size(1)*image_size(2),1)];

numxypairs = length(xy); % number of (x,y) pairs
dist = [];
for i=1:dataset.colunasOutput
    disttemp = sum(abs(xy - repmat(meanClasses(i,:), [numxypairs 1])), 2);
    dist = [dist disttemp];
end

% for each (x,y) pair, find the class that has the smallest distance.
% this will be the min along the 2nd dimension.
[m,idx] = min(dist, [], 2);

% reshape the idx (which contains the class label) into an image.
decisionmap = reshape(idx, image_size);
figure;

%show the image
imagesc(xrange,yrange,decisionmap);
hold on;
set(gca,'ydir','normal');

% colormap for the classes:
% class 1 = light red, 2 = light green, 3 = light blue
cmap = [1 0.8 0.8; 0.95 1 0.95; 0.9 0.9 1];
colormap(cmap);

% plot the class training data.
plot(classe1(:,1),classe1(:,2), 'r.');
plot(classe2(:,1),classe2(:,2), 'go');
if dataset.colunasInput == 3
    plot(classe3(:,1),classe3(:,2), 'b*');
end
% include legend
legend('Classe 1', 'Classe2', 'Classe 3','Location','NorthOutside', ...
    'Orientation', 'horizontal');

% label the axes.
title(['Acurácia: ' num2str(resultadoTeste.acc)]) %...
%' - Treinado em ' num2str(resultadoTreino.contagem) ' épocas']);
xlabel('x');
ylabel('y');
