data=rawData(:,2:10);
class=rawData(:,11);

%Experiment 1   80% Training 20% Testing
trainInputData=data(1:546,:);
trainClassData=class(1:546,:);
testData=data(547:683,:);
testClass=class(547:683,:);


% %Experiment 2   70% Training 30% Testing
% trainInputData=data(1:478,:);
% trainClassData=class(1:478,:);
% testData=data(479:683,:);
% testClass=class(479:683,:);

% %Experiment 3   60% Training 40% Testing
% trainInputData=data(1:410,:);
% trainClassData=class(1:410,:);
% testData=data(411:683,:);
% testClass=class(411:683,:);

%Experiment 4   50% Training 50% Testing
% trainInputData=data(1:341,:);
% trainClassData=class(1:341,:);
% testData=data(342:683,:);
% testClass=class(342:683,:);

%Experiment 5   40% Training 60% Testing
% trainInputData=data(1:273,:);
% trainClassData=class(1:273,:);
% testData=data(274:683,:);
% testClass=class(274:683,:);


%Experiment 6   30% Training 70% Testing
% trainInputData=data(1:205,:);
% trainClassData=class(1:205,:);
% testData=data(206:683,:);
% testClass=class(206:683,:);

% %Experiment 7   20% Training 80% Testing
% trainInputData=data(1:137,:);
% trainClassData=class(1:137,:);
% testData=data(138:683,:);
% testClass=class(138:683,:);


%Experiment 8   5% Training 95% Testing
% trainInputData=data(1:35,:);
% trainClassData=class(1:35,:);
% testData=data(36:683,:);
% testClass=class(36:683,:);



%Network information
net = newff(trainInputData',trainClassData',50, {'tansig' 'tansig'}, 'trainr', 'learngd', 'mse');
net.trainParam.goal = 0.01;
net.trainParam.epochs = 100;
net.trainParam.max_fail=100;
net.trainParam.lr = 0.001;
net = train(net, trainInputData',trainClassData');      %Training of the network

result=net(testData');                                  %Testing of the network

%Accuracy percentage calculation
error=0;
for i=1:size(result,2)
    if((result(i)<3 && testClass(i)~=2) || (result(i)>3 && testClass(i)~=4))
        error=error+1;
        disp(i);
    end;
end;
percentageError=((error(1))/size(testClass,1))*100;
percentageAccuracy=100-percentageError;