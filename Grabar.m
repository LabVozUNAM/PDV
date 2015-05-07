function Grabar(nombre,veces)
%Grabar un archivo de audio de 2 segundos n veces bajo el formato
%"nombre(n).wav"
n= 0;

    while (n<veces)
        Fs = 8000;                    %# Frecuencia de muestreo en Hz
        T = 2;                        %# Tamaño de un intervalo de la señal en segundos.

        %# preparando para guardar audio
        recObj = audiorecorder(Fs,16,1);

        %# Guarda 2 segundo de audio
        disp('Iniciando grabacion...')
        disp('Pulsa Enter cuando este listo para grabar')
        pause;
            recordblocking(recObj, T);
            x = getaudiodata(recObj);

        plot(x)
        disp('Listo.')

        
        soundsc(x,8000)
        str1 = num2str(n);
        ext= '.wav';
        filename = [nombre str1 ext] ;
        audiowrite(filename,x,Fs)
        n=n+1;
    end
end
