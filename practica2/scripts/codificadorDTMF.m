%Función codificadora de carácteres según el modo DTMF
function muestras = codificadorDTMF(caracter)


keys={'1','2','3','4','5','6','7','8','9','0','*','#','A','B','C','D'};
values={[1 5], [1 6], [1 7], [2 5], [2 6], [2 7], [3 5], [3 6], [3 7], [4 6],[4 5], [4 7], [1 8], [2 8], [3 8], [4 8]};
tabla = containers.Map(keys,values);


if(not(tabla.isKey(caracter)))
msg = 'No esta permitido el caracter.';
error(msg)
end

Fs=4000;
%tf = 2*pi*5/697;
tf=0.5;
t=0:1/Fs:tf;
A=0.3;
frecuencias=[697,770,852,941,1209,1336,1477,1633];
senales = frecuencias(tabla(caracter));

dtmf = @(x,y,t) A*sin(x*t) + A*sin(y*t);
muestras=dtmf(senales(1),senales(2),t);
