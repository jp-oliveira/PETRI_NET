function entradas_ve = verifica_entradas (transicao_ve, entradas) % o argumento é t3 ou t2 ou algo do tipo
  entradas_ve = entradas(str2num(transicao_ve(2)));  % será por exemplo "p1-2 p2-1 p3-0 p4-1"
endfunction
