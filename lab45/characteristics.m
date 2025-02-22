% %% wczytywanie sygnalu
[x, fs] = audioread("noised.wav");
% %% parametry filtrow
BW = 0.1;
% %% filtracja sygnalu
% sig = x;
% sig = conv(sig, create_band_stop(6000, 6250, BW, fs));
% sig = conv(sig, create_band_stop(4000, 4250, BW, fs));
% sig = conv(sig, create_high_pass(200, BW, fs));
% %% spektrogramy
% subplot(1, 2, 1); spectrogram(x, 'yaxis'); title('Original');
% subplot(1, 2, 2); spectrogram(sig, 'yaxis'); title('Filtered');
% %% zapisanie sygnalu i odsluchanie
% % audiowrite("denoised.wav", sig, fs);
% sound(sig, fs);

band_stop = create_high_pass(4000, BW, fs);
A = fft(band_stop);
A = abs(A);

L = length(band_stop);

T = 1/fs;
t = (0:L/2-1)*T;

t = (1:length(A)/2);
t = t * 8000/length(t);

% A = A / L;

A = A(1:L/2); % wycięcie istotnej części spektrum
% A(2:end-1) = 2*A(2:end-1);

figure; plot(t, abs(A));
