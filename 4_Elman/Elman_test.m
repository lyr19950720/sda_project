function [predict,mse_test]=Elman_test(x,y)
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
load water_net1.mat;

predict = sim(net,x);
error = predict - y;
mse_test = mse(error);
fprintf('error= %f\n', error);
plot(1:length(y),y,'b-',1:length(y),predict,'r-');
title(['ʹ�ò��Լ����ݲ���   mseֵΪ',num2str(mse_test)]);
legend('��ʵֵ','���Խ��');
end

