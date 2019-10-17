function [predict_train , mse_train, predict_test, mse_test] = Elman(x_train,y_train,x_test,y_test)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

% ���õ�������
net=elmannet;
net.trainParam.epochs=2000;
% ��ʼ��
net=init(net); 
net=train(net,x_train,y_train,'useGPU','only');
save water_net net

%% ʹ��ѵ�����ݲ���һ��
predict_train=sim(net,x_train);
error=predict_train-y_train;
mse_train=mse(error);
fprintf('error= %f\n', error);
subplot(2,1,1);
plot(1:length(y_train),y_train,'b-',1:length(y_train),predict_train,'r-');
title(['ʹ��ѵ�������ݲ���   mseֵΪ',num2str(mse_train)]);
legend('��ʵֵ','���Խ��');

%% ʹ�ò������ݲ���
predict_test=sim(net,x_test);
error=predict_test-y_test;
mse_test=mse(error);
fprintf('error= %f\n', error);
subplot(2,1,2);
plot(1:length(y_test),y_test,'b-',1:length(y_test),predict_test,'r-');
title(['ʹ�ò��Լ����ݲ���   mseֵΪ',num2str(mse_test)]);
legend('��ʵֵ','���Խ��');
end

