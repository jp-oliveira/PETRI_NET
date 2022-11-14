function fichas_vf = faz_arvore(nos_totais)
  nos_totais{1}.fichas = nos_totais{1}.fichas{:};
  vetor_pai = [];
  
  for i = 1:length(nos_totais)
    vetor_pai(i) = nos_totais{i}.pai;
  endfor
  
  treeplot(vetor_pai)
  [x,y] = treelayout(vetor_pai);
  title ("Rede de Petri gerada:","FontSize",20);
  
  for cont=2:length(nos_totais) %legenda a transi��o que cada n� se originou.Come�a do 2 porque o 1 n� nao se originou de transicao alguma.
    text( x(cont) + 0.05, y(cont)+ 0.2,nos_totais{cont}.transicao,"FontSize",15);  
  endfor
  
  for cont=1:length(nos_totais) %legenda as fichas presentes em cada n�.
    text( x(cont) + 0.05, y(cont), mat2str(nos_totais{cont}.fichas),"FontSize",15);  
  endfor
  
  xlabel("Marca��o das fichas","FontSize",17);
  ylabel("Transi��es feitas","FontSize",17); 
endfunction