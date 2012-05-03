function procQueue
    cd 'C:\Users\Dario\Desktop\ArchivistSpeedster\';
    cd 'Images\';
    disp('Initializing Processing Queue');
    while 1==1
        files=dir('*.jpg');
        if ~isempty(files)
            for j=1:length(files)
                disp(strcat('processing image ', int2str(j)));
                Image = imread(files(j).name);
                Iamge = subtractBackground2(Image);
                newName = strcat('../../', int2str(j), '_new.jpg');
                imwrite(Image, newName);
            end
        end
        pause(3)
    end
end