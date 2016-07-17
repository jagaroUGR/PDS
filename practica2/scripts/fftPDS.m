%Script función FFT para Matlab
function valoresFFT = fftPDS(muestras)
  N=length(muestras);
  valoresFFT=[];
  for i=0:N-1
    valoresFFT(i+1)= sum(muestras.*exp(-j*2*pi/N*(0:N-1)*i));
  end
  valoresFFT(valoresFFT<10^-10)=0;
end
