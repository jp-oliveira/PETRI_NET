%{
  fazer as transi��es que n�o foram escolhidas pelo usuario
%}
function retval = resto_arvore (transicao_primeira, config_fichas)
  %primeiro devemos checar se h� mais de uma transicao possivel em transicao_primeira
  %se houver, comece pela primeira.
  %quando gerar, checar se as fichas t�m a mesma configura��o que a anterior. se sim, o elemento igual vira w e paremos de gerar.
  transicao_primeira = transicao_primeira(1:length(transicao_primeira)-1);
  config_fichas;
  %faz_transicao(transicao_primeira)
endfunction
