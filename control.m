clear all
close all
clc
%%
    cd 'C:\Users\ES 96\Desktop\Archivist Speedster\Out';
    while 1==1
        files=dir('*.jpg');
        for j=1:length(files)
            tic
            Image = imread(files(j).name); 
            disp('processing file')
            Image = subtractBackground1(Image);
            if isempty(Image)
                msgbox('Image was empty, try again.');
                delete(files(j).name);
                break;
            end
            delete(files(j).name);
            disp('posting file to website');
            imwrite(Image,files(j).name,'jpg');
            
            boxname = strcat('box',files(j).name,'.txt');
            QRcode_data_box = char(textread(boxname, '%s'));
            
            foldername = strcat('folder',files(j).name,'.txt');
            QRcode_data_folder = char(textread(foldername, '%s'));
            
            f = fopen(files(j).name);
            image = fread(f, Inf, '*uint8');
            fclose(f);
            str = urlreadpost('http://www.hollre.com/items.json', {'item[image]', image, 'item[values_attributes][0][name]', QRcode_data_box, 'item[values_attributes][0][property_attributes][name]', 'Box QR code',  'item[values_attributes][1][name]', QRcode_data_folder,  'item[values_attributes][1][property_attributes][name]', 'Folder QR code'});
            cd 'C:\Users\ES 96\Desktop\Archivist Speedster\Out'
            delete(files(j).name);
            delete(foldername);
            delete(boxname);
            toc
            disp('----------------------');
            
        end
        pause(1)
    end