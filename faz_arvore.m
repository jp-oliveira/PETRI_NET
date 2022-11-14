function fichas_vf = faz_arvore(nos_totais)
  nos_totais{1}.fichas = nos_totais{1}.fichas{:};
  vetor_pai = [];
  
  for i = 1:length(nos_totais)
    vetor_pai(i) = nos_totais{i}.pai;
  endfor
  
  treeplot(vetor_pai)
  [x,y] = treelayout(vetor_pai);
  title ("Rede de Petri gerada:","FontSize",20);
  
  for cont=2:length(nos_totais) %legenda a transição que cada nó se originou.Começa do 2 porque o 1 nó nao se originou de transicao alguma.
    text( x(cont) + 0.05, y(cont)+ 0.2,nos_totais{cont}.transicao,"FontSize",15);  
  endfor
  
  for cont=1:length(nos_totais) %legenda as fichas presentes em cada nó.
    text( x(cont) + 0.05, y(cont), mat2str(nos_totais{cont}.fichas),"FontSize",15);  
  endfor
  
  xlabel("Marcação das fichas","FontSize",17);
  ylabel("Transições feitas","FontSize",17); 
endfunction