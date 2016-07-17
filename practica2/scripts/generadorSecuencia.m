%Generador secuencia para cadena de caracteres permitidos en dtmf
function muestra = generadorSecuencia(caracteres)

muestra=[];
for i =1:length(caracteres)
  salida=codificadorDTMF(caracteres(i));
  muestra=[muestra,salida];
end
