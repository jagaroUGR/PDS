%Función que devuelve la señal DTMF decodificada
function decodificacion = decodificadorSecuencia(muestra)
L=2001;
tam = length(muestra);

if mod(tam,L)>0
  error('Debe tener 2001 puntos cada señal')
end

senales = length(muestra)/L
decodificacion=[];
for i=1:senales
  ini = 1 + L*(i-1);
  fin = L*i -1;
  salida = decodificadorDTMF(muestra(ini:fin));
  decodificacion=[decodificacion,salida ];
end
