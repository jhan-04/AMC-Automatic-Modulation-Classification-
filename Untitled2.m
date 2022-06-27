clear all


%%%%%%%%%%%%% rayChannel
sampleRate500kHz = 500e3;    % Sample rate of 500K Hz
sampleRate20kHz  = 20e3;     % Sample rate of 20K Hz
maxDopplerShift  = 200;      % Maximum Doppler shift of diffuse components (Hz)
delayVector = (0:5:15)*1e-6; % Discrete delays of four-path channel (s)
gainVector  = [0 -3 -6 -9];  % Average path gains (dB)
Channel = comm.RayleighChannel( ...
    'SampleRate',          sampleRate500kHz, ...
    'PathDelays',          delayVector, ...
    'AveragePathGains',    gainVector, ...
    'MaximumDopplerShift', maxDopplerShift, ...
    'RandomStream',        'mt19937ar with seed', ...
    'Seed',                10, ...
    'PathGainsOutputPort', true);


%%%%%%%%%%%%%%%%%AWGN Channel
% SNR = 10;
% std = sqrt(10.^(-SNR/10));
% Channel = comm.AWGNChannel(...
%     'NoiseMethod', 'Signal to noise ratio (SNR)', ...
%     'SignalPower', 1, ...
%     'SNR', SNR);


%bpskModulator([0 1])1,qpskModulator([0 3])2,pam4Modulator([0 3])3, qam16Modulator([0 15])4

hold on
sample_train=1000;%%%%%각 모듈레이션당 trainin sample 수
sample_test=100;%%%각 모듈레이션당 test sample 수

ind_data_train=0;%number of training sample data
ind_data_test=0;%number of test sample data


%%%%%%%%%%%%%%%%%%%traininig data sample
%BPSK =1
for i=1:sample_train
    
    % Random bits
    
    d_bpsk = randi([0 1], 1024, 1);
    
    tx =bpskModulator(d_bpsk);
    rx=Channel(tx);
    [c20,c21,c40,c41,c42,c60,c63,c80]=feature_extraction(rx);
    %plot3(c20,c21,c40,'b*')
    plot3(abs(c20),abs(c21),abs(c40),'b*')
    
    ind_data_train=ind_data_train+1;
    data_train(ind_data_train,:)=[c20,c21,c40,c41,c42,c60,c63,c80];
    
    label_train(ind_data_train)=1;
    
end
%QPSK =2
for i=1:sample_train
    
    % Random bits
    
    d_qpsk = randi([0 3], 1024, 1);
    
    tx =qpskModulator(d_qpsk);
    rx=Channel(tx);
    [c20,c21,c40,c41,c42,c60,c63,c80]=feature_extraction(rx);
    % plot3(c20,c21,c40,'mo')
    plot3(abs(c20),abs(c21),abs(c40) ,'mo')
    
    ind_data_train=ind_data_train+1;
    data_train(ind_data_train,:)=[c20,c21,c40,c41,c42,c60,c63,c80];
    
    label_train(ind_data_train)=2;
end
% PAM4 =3
for i=1:sample_train
    % Random bits
    
    d_pam4 = randi([0 1], 1024, 1);
    
    tx =pam4Modulator(d_pam4);
    rx=Channel(tx);
    [c20,c21,c40,c41,c42,c60,c63,c80]=feature_extraction(rx);
    %   plot3(c20,c21,c40,'c^')
    plot3(abs(c20),abs(c21),abs(c40),'c^')
    
    ind_data_train=ind_data_train+1;
    data_train(ind_data_train,:)=[c20,c21,c40,c41,c42,c60,c63,c80];
    
    label_train(ind_data_train)=3;
end
 % QAM 16 =4
for i=1:sample_train
    % Random bits
   
    d_qam16 = randi([0 15], 1024, 1);
    
    tx =qam16Modulator(d_qam16);
    rx=Channel(tx);
    [c20,c21,c40,c41,c42,c60,c63,c80]=feature_extraction(rx);
    %  plot3(c20,c21,c40,'y+')
    plot3(abs(c20),abs(c21),abs(c40),'y+')
    
    ind_data_train=ind_data_train+1;
    data_train(ind_data_train,:)=[c20,c21,c40,c41,c42,c60,c63,c80];
    
    label_train(ind_data_train)=4;
    
end





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%training data sample

 %BPSK =1
for i=1:sample_test
    
    % Random bits
   
    d_bpsk = randi([0 1], 1024, 1);
    
    tx =bpskModulator(d_bpsk);
    rx=Channel(tx);
    [c20,c21,c40,c41,c42,c60,c63,c80]=feature_extraction(rx);
    %plot3(c20,c21,c40,'b*')
    plot3(abs(c20),abs(c21),abs(c40),'b*')
    
    ind_data_test=ind_data_test+1;
    data_test(ind_data_test,:)=[c20,c21,c40,c41,c42,c60,c63,c80];
    
    
    label_test(ind_data_test)=1;
end
%QPSK =2
for i=1:sample_test
    
    % Random bits
    
    d_qpsk = randi([0 3], 1024, 1);
    
    tx =qpskModulator(d_qpsk);
    rx=Channel(tx);
    [c20,c21,c40,c41,c42,c60,c63,c80]=feature_extraction(rx);
    % plot3(c20,c21,c40,'mo')
    plot3(abs(c20),abs(c21),abs(c40) ,'mo')
    
    ind_data_test=ind_data_test+1;
    data_test(ind_data_test,:)=[c20,c21,c40,c41,c42,c60,c63,c80];
    
    label_test(ind_data_test)=2;
    
end
 % PAM4 =3
for i=1:sample_test
    % Random bits
   
    d_pam4 = randi([0 1], 1024, 1);
    
    tx =pam4Modulator(d_pam4);
    rx=Channel(tx);
    [c20,c21,c40,c41,c42,c60,c63,c80]=feature_extraction(rx);
    %   plot3(c20,c21,c40,'c^')
    plot3(abs(c20),abs(c21),abs(c40),'c^')
    
    ind_data_test=ind_data_test+1;
    data_test(ind_data_test,:)=[c20,c21,c40,c41,c42,c60,c63,c80];
    
    label_test(ind_data_test)=3;
end
% QAM 16 =4
for i=1:sample_test
    % Random bits
    
    d_qam16 = randi([0 15], 1024, 1);
    
    tx =qam16Modulator(d_qam16);
    rx=Channel(tx);
    [c20,c21,c40,c41,c42,c60,c63,c80]=feature_extraction(rx);
    %  plot3(c20,c21,c40,'y+')
    plot3(abs(c20),abs(c21),abs(c40),'y+')
    
    ind_data_test=ind_data_test+1;
    data_test(ind_data_test,:)=[c20,c21,c40,c41,c42,c60,c63,c80];
    
    label_test(ind_data_test)=4;
    
end



hold off







[predicted_labels,accuracy] = KNN_classifier(3,data_train,label_train,data_test,label_test);


accuracy



% Plot transmitted and received signals
% scope = dsp.TimeScope(2,200e3,'YLimits',[-2 2],'ShowGrid',true,...
%     'LayoutDimensions',[2 1],'TimeSpan',45e-3);
% scope(tx,rx)










