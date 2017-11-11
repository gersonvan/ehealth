function data = load_iris(filename)

tipo = 1;
delimiter = ',';
formatSpec = '%f%f%f%f%s';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter,...
    'MultipleDelimsAsOne', true,  'ReturnOnError', false);
fclose(fileID);

VarName1 = dataArray{:, 1};
VarName2 = dataArray{:, 2};
VarName3 = dataArray{:, 3};
VarName4 = dataArray{:, 4};

output = dataArray{:, 5};

if tipo == 0
    for i = 1:length(output)
        if strcmp(output(i), 'Iris-setosa')
            data.Output(i,:) = [1 0 0];
        else
            data.Output(i,:) = [0 0 1];
        end
    end
else
    for i = 1:length(output)
        if strcmp(output(i), 'Iris-setosa')
            data.Output(i,1:3) = [1 0 0];
        elseif strcmp(output(i), 'Iris-versicolor')
            data.Output(i,1:3) = [0 1 0];
        else
            data.Output(i,1:3) = [0 0 1];
        end
    end
end
data.Input = [VarName1, VarName2, VarName3, VarName4];

%% Clear temporary variables
clearvars filename delimiter formatSpec fileID dataArray ans;
clearvars VarName1 VarName2 VarName3 VarName4 output;
end