classdef no_arvore < handle
  
  properties
    fichas 
    transicao
    possiveis
    geracao
    pai
  endproperties
  
  methods
    function ret = no_arvore(fichas, possiveis, transicao, geracao,pai)
      ret.fichas = fichas;
      ret.possiveis = possiveis;
      ret.transicao = transicao;
      ret.geracao = geracao;
      ret.pai = pai;
    endfunction
    
  endmethods
endclassdef