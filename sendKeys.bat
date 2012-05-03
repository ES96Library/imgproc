:REPEAT
for /F %%i in ('dir /b "c:\Users\ES 96\Desktop\Archivist Speedster\New\*.jpg"') do (
    cd "c:\Users\ES 96\Desktop\Archivist Speedster"
    CommandCam.exe /devnum 1
    java -cp "c:\Users\ES 96\Desktop\Archivist Speedster\javase.jar";"c:\Users\ES 96\Desktop\Archivist Speedster\core.jar" com.google.zxing.client.j2se.CommandLineRunner image.bmp --dump_results --brief
    move "image.txt" ".\Out\box"%%i".txt"
    CommandCam.exe /devnum 2
    java -cp "c:\Users\ES 96\Desktop\Archivist Speedster\javase.jar";"c:\Users\ES 96\Desktop\Archivist Speedster\core.jar" com.google.zxing.client.j2se.CommandLineRunner image.bmp --dump_results --brief
    move "image.txt" ".\Out\folder"%%i".txt"
    move 
    del "image.jpg"
    cd "c:\Users\ES 96\Desktop\Archivist Speedster\New\"
    move %%i "..\Out"
)
ping 123.45.67.89 -n 1 -w 500 > nul
goto REPEAT
