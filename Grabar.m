function Grabar(varargin)
%GRABAR Alamcena un archivo de audio.
%GRABAR(nombre,n,p,r) Almacenar un archivo de audio de 2 segundos n veces bajo el formato
%"nombre(n).wav" si p = 1 grafica la señal, si r = 1 reproduce la señal
%GRABAR(nombre,n,p,r,m) Almacena o sobre escribe un archivo de 2 segundos
%iniciando desde "nombre(m).wav" hasta nombre(m + (n-1)).wav"
%Ejemplo
%1.- Almacenar 5 veces con el nombre 'saludo' graficando la señal y
%   reproduciendola:
%       Grabar('Saludo',5,1,1)
%2.- Almacenar 2 veces con el nombre 'saludo' solo graficando la señal
%       Grabar('Saludo',5,1,0)
%3.- Almacenar 2 veces con el nombre 'saludo' desde la muestra (n) = 6 
%   solo graficando la señal
%       Grabar('Saludo',2,1,0,6)
if nargin<1, error(message('MATLAB:parametros insuficientes')); end

switch nargin
    case 5
        n = varargin{5};
    otherwise
        n = 0;
end
        Fs = 8000;                    %# Frecuencia de muestreo en Hz
        T = 2;                        %# Tamaño de un intervalo de la señal en segundos.
        nombre = varargin{1};
        limite = (n + varargin{2});
        while (n < limite)

            %# preparando para guardar audio
            recObj = audiorecorder(Fs,16,1);
            %# Guarda 2 segundo de audio
            str1 = num2str(n);
            ext= '.wav';
            filename = [nombre str1 ext] ;
            fprintf('Iniciando grabacion de %s ...\n',filename)
            fprintf('Pulsa Enter cuando este listo para grabar\n')
            pause;
            recordblocking(recObj, T);
            x = getaudiodata(recObj);
            disp('Listo.')
            
if varargin{3} == 1,plot(x);end

if varargin{4} == 1,sound(x,Fs);end

            audiowrite(filename,x,Fs);
            n=n+1;
            clc
        end
        fprintf('Fin de grabacion\n')
end
