function Grabar(nombre,veces)
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

        [~, ~, ~, ~ ,~, ~, ~, ~, ~,  ~, ~, ~, z, ~, ~]  = FunIniFin(x,128);


        soundsc(z,8000)
        figure
        plot(z);
        str1 = num2str(n);
        ext= '.wav';
        filename = [nombre str1 ext] ;
        audiowrite(filename,z,Fs)
        n=n+1;
    end
end
