function caracter = decodificadorDTMF(muestra)
%Originalmente hecho con Fs=8000 si cambiamos la frecuencia de muestreo no pasa nada
Fs=8000;
k=8000/Fs;
L=length(muestra);
fs=Fs/L*(0:L-1);

f=fftPDS(muestra);

figure
%Los valores que buscamos suceden a una frecuencia DTS inferior de 550
tam=find(fs<=550,1,'last');
ini = find(fs>=100,1);
%plot(fs(ini:tam),abs(f(ini:tam)));

%Buscamos en dos regiones ya que hay dos frecuencias en la señal seno
%Hasta 350 es una de las frecuancias bajas y a partir de ahi, son altas

%Límite entre frecuencias bajas y altas
l=305/k;
limite = find(fs >= l,1);

%Vemos que frecuencia baja ha sido elegida
pos1 =  find(abs(f(1:limite)) == max(abs(f(1:limite))));

%Vemos que frecuencia alta ha sido elegida
pos2 =  find(abs(f(limite:tam)) == max(abs(f(limite:tam))));

pos2=limite+pos2-1;

valor1=fs(pos1)*k;
valor2=fs(pos2)*k;


%Vemos la frecuencia baja a la que corresponde y después la alta

%697Hz
if valor1>200 & valor1 <230

  %1209Hz
  if valor2>350 & valor2 < 400
    caracter='1';
  %1336Hz
  elseif valor2>=400 & valor2 < 450
    caracter = '2';
  %1477Hz
  elseif valor2 >= 450 & valor2 < 500
    caracter = '3';
  %1633Hz
  else
    caracter = 'A';
  end

%770Hz
elseif valor1>=230 & valor1 < 255

  if valor2>350 & valor2 < 400
    caracter='4';
  elseif valor2>=400 & valor2 < 450
    caracter = '5';
  elseif valor2 >= 450 & valor2 < 500
    caracter = '6';
  else
    caracter = 'B';
  end

%852Hz
elseif valor1 >=255 & valor1 < 275

  if valor2>350 & valor2 < 400
    caracter='7';
  elseif valor2>=400 & valor2 < 450
    caracter = '8'
  elseif valor2 >= 450 & valor2 < 500
    caracter = '9';
  else
    caracter = 'C';
  end

%941Hz
else
  if valor2>350 & valor2 < 400
    caracter='*';
  elseif valor2>=400 & valor2 < 450
    caracter = '0';
  elseif valor2 >= 450 & valor2 < 500
    caracter = '#';
  else
    caracter = 'D';
  end
end




end
