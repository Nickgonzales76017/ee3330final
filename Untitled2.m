%*******************************
% Nicholas Gonzales
% 1000985705
% nicholas.gonzales3@mavs.uta.edu
% 1/27/2021
% HW_1 
% ******************************


% ------------------------------
% Variables
% ------------------------------
fs = 44100;
N = 145000;
n = 0:N-1;
M = 4;
% ------------------------------
% recording block
% ------------------------------
% recObj = audiorecorder(fs,16,1)
% disp('Start speaking.')
% recordblocking(recObj, 3);
% disp('End of Recording.');
% y = getaudiodata(recObj);
% sound(y,fs);
% pause(5)
% ------------------------------
% Y.mat
% Student saying "Alas, Poor Yorick!"
% ------------------------------
load y.mat
S  = length(y);
Alasy = 2*y(1:5*S/12);
Poory = 2*y(5*S/12:9*S/17);
Yoricky = 2*y(9*S/17:S);
% ------------------------------
% hamlet.mat
% Dr. Baraniuks saying "Alas, Poor Yorick!"
% ------------------------------
load hamlet.mat
hamlet = 2*alas(1:N);
Alas = 2*alas(1:5*N/9);
Poor = 2*alas(5*N/9:2*N/3);
Yorick = 2*alas(2*N/3:N);
% ------------------------------
% chirp signal
% ------------------------------
chirp = flipud(0.3*cos(2*pi/3000000 * n.^(2))');
% ------------------------------
%  IF else statment UI
% ------------------------------
W = input('Do you want 1)audio signal or 2)chirp signal [enter just the number]');
if W == 1
%  Audio signal
    subplot(3,3,1)
    stem(Alasy,'b','Marker','none','LineWidth',2)
    title('Alas - Nicholas')
    subplot(3,3,2)
    stem(Poory,'b','Marker','none','LineWidth',2)
    title('Poor - Nicholas')
    subplot(3,3,3)
    stem(Yoricky,'b','Marker','none','LineWidth',2)
    title('Yorick - Nicholas')
    subplot(3,3,4)
    stem(Alas,'b','Marker','none','LineWidth',2)
    title('Alas - Dr. Baraniuks')
    subplot(3,3,5)
    stem(Poor,'b','Marker','none','LineWidth',2)
    title('Poor - Dr. Baraniuks')
    subplot(3,3,6)
    stem(Yorick,'b','Marker','none','LineWidth',2)
    title('Yorick - Dr. Baraniuks')
    while 1
        H = input('Do you want 1)Nicholas or 2)Dr. Baraniuks audio [enter just the number]');
        if H == 1 
%       Nicholas's audio
            J = input('Do you want 1)drunk or 2)Chipmunk [enter just the number]');
            if J == 1
%           drunk audio
                sound(y,fs/2);
                R = input('Would you like to pick a new audio 1)yes 2)no?[enter just the number]');
%               While loop controls
                if R == 1
                    continue
                elseif R == 2
                    break
                end
            elseif J == 2
%           Chipmunk audio
                sound(y,fs*2);
                R = input('Would you like to pick a new audio 1)yes 2)no?[enter just the number]');
%               While loop controls
                if R == 1
                    continue
                elseif R == 2
                    break
                end
            end
        elseif H == 2
%       Dr. Baraniuk's audio
            J = input('Do you want 1)drunk or 2)Chipmunk [enter just the number]');
            if J == 1
%           drunk audio
                sound(hamlet,fs/2);
                R = input('Would you like to pick a new audio 1)yes 2)no?[enter just the number]');
%               While loop controls
                if R == 1
                    continue
                elseif R == 2
                    break
                end
            elseif J == 2
%           Chipmunk audio
                sound(hamlet,fs*2);
                R = input('Would you like to pick a new audio 1)yes 2)no?[enter just the number]');
%               While loop controls
                if R == 1
                    continue
                elseif R == 2
                    break
                end
            end
        end
    end
elseif W == 2
%  Audio signal
    sound(chirp,fs);
    chirp = chirp';
    stem(n(130000:length(chirp)),chirp(130000:length(chirp)),'b','Marker','none','LineWidth',2)
    title('Chirp signal plot');
end



