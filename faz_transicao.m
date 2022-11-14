function retorno = faz_transicao(transicao_ft,fichas,entradas,saidas)
  
  entradas_ft = verifica_entradas(transicao_ft, entradas);  %entradas_ft agora é por exemplo "p1-2 p2-1 p3-0 p4-1"
  entradas_ft = entradas_ft{:};
  saidas_ft = verifica_saidas(transicao_ft, saidas); %saidas_ft agora é por exemplo "p1-2 p2-1 p3-0 p4-1"
  saidas_ft = saidas_ft{:}; %tanto essa operação quanto a de cima são para operarmos com strfind, a variavel deixa de ser cell e vira string.
  
  pesos_ft = entradas_ft(strfind(entradas_ft,"-")+1); %pesos_ft agora é uma string com os pesos. exemplo "1101"
  pesos_saidas_ft = saidas_ft(strfind(saidas_ft,"-")+1);
  
  for x = 1:length(pesos_ft)
    fichas(x) -= str2num(pesos_ft(x));  %tira as fichas das entradas
  endfor

  for y = 1:length(pesos_saidas_ft)
    fichas(y) += str2num(pesos_saidas_ft(y)); %coloca as fichas nas saídas
  endfor
  
  retorno = fichas;
endfunction