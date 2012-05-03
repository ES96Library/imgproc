clear all
close all
clc
%%
    cd 'C:\Users\ES 96\Desktop\Archivist Speedster\New';
    while 1==1
        files=dir('*jpg');
        if ~isempty(files)
           [qrBox, qrFolder] = getQR();
        end
        for j=1:length(files)
            Image = imread(files(j).name); 
            disp('processing file')
            Image = subtractBackground1(Image);
            cd('C:\Users\ES 96\Desktop\Archivist Speedster\Out');
            imwrite(Image,files(j).name,'jpg');
            toc
            cd('C:\Users\Dario\Desktop\imageland\Images');
        end
        pause(1)
    end
end