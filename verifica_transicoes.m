function possiveis = verifica_transicoes (fichas, entradas)
  possiveis = "";
 
  for x = 1:length(entradas)
    
    entrada_transicao = entradas(x);   %assume o valor de por exemplo t1-1 t2-1 t3-0 t4-1
    entrada_transicao = entrada_transicao{:}; %deixa de ser cell para ser string para conseguirmos operar com o strfind, achando o "-".
    pesos_entradas = entrada_transicao(strfind(entrada_transicao,"-")+1);  %depois dos traços na string está o peso de cada entrada.
   
    flag = 0;
    for y = 1:length(pesos_entradas)
      if ( fichas(y) >= str2num(pesos_entradas(y)) )
        flag++;  %flag está sendo somada para se certificar que TODAS as entradas estão habilitadas.
      endif
    endfor
    if (flag == length(pesos_entradas)) %se a quant de fichas das entradas for maior ou igual ao peso, essa transicao é possível
      possiveis = strcat(possiveis,"t",mat2str(x),"|");  %coloca a transicao nas possiveis - separando as transicoes por '|'
    endif
  endfor
  possiveis = possiveis(1:length(possiveis)-1);  % tira o ultimo | 
endfunction