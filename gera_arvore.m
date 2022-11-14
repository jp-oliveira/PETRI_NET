function retval=gera_arvore(transicoes_ga,fichas,entradas,saidas)
  
  no_pai = no_arvore(fichas,verifica_transicoes(fichas{1}, entradas),"t0",0,0);
  help = no_pai.possiveis;
  nos_totais = {};
  nos_totais{1} = no_pai;
  cont_geracao = 0;
  acabou = 0;
  if (length(help) > 0)  %caso haja transi��es poss�veis
    
    disp("Estamos come�ando a fazer a �rvore! Estamos na gera��o 1!\n")
    printf("A(s) seguinte(s) transi��o(�es) �(s�o) poss�vel(is): %s \n",help)
    
    while(acabou == 0)
      cont_geracao++;  
      trans_possiveis = "";    %referentes ao pai da proxima gera��o
      fichas_trans = {};       %referentes ao pai da proxima gera��o
      aux = strfind(no_pai.possiveis,";");
      
      for j = 1:length(aux)+1   %come�amos do n� mais � esquerda. o j conta o n� que estamos.
        if (j == 1)
          inicio = 1;
        else
          inicio = 1 + aux(j - 1);
        endif
        if (j == length(aux)+1)
          final = length(no_pai.possiveis);
        else
          final = aux(j);
        endif
        
        if (index(no_pai.possiveis(inicio:final),"t0") == 0)  %se � t0, quer dizer que n�o h� transi��es para esse n�.
          for i = 1:length(strfind(no_pai.possiveis(inicio:final),"|"))+1  %percorrendo as transic�es de cada n�          
            nos_totais{1+length(nos_totais)} = no_arvore("nd","nd","nd","nd","nd");% valores devem ser inicializados, n�o podem come�ar vazios.
            nos_totais{length(nos_totais)}.transicao = strsplit(no_pai.possiveis(inicio:final),"|"){i};
            
            nos_totais{length(nos_totais)}.pai = no_pai.geracao + j;
            nos_totais{length(nos_totais)}.fichas = faz_transicao(strsplit(no_pai.possiveis(inicio:final),"|"){i}, no_pai.fichas{j}, entradas, saidas);
            nos_totais{length(nos_totais)}.geracao = cont_geracao;
            nos_totais{length(nos_totais)}.possiveis = verifica_transicoes(nos_totais{length(nos_totais)}.fichas, entradas);
            
            fichas_trans(length(fichas_trans)+1)= nos_totais{length(nos_totais)}.fichas;
            trans_possiveis = strcat(trans_possiveis,nos_totais{length(nos_totais)}.possiveis); %transicoes possiveis para as proximas iteracoes
            trans_possiveis = strcat(trans_possiveis,";");
          endfor
        endif
      endfor
      
      trans_possiveis = trans_possiveis(1:length(trans_possiveis)-1); % � por exemplo 't1|t2;t2|t3;t1|t3;'. tira o ultimo ';'
      
      if(trans_possiveis(1) == ";")   %evita por exemplo ;t1|t3;t2|t3
        trans_possiveis = strcat("t0",trans_possiveis);
      elseif(trans_possiveis(length(trans_possiveis)) == ";") %evita por exemplo 't2|t3;t1|t2;'
        trans_possiveis = strcat(trans_possiveis,"t0");
      endif
  
      while(index(";;",trans_possiveis)> 0) %caso 2 n�s em sequ�ncia n�o tenham filhos, haver�;;. esse while bota um t0 entre eles.
        ajuda = trans_possiveis(1:index(";;",trans_possiveis));
        ajuda = strcat(ajuda,"t0");
        trans_possiveis = strcat(ajuda,trans_possiveis(index(";;",trans_possiveis)+1:length(trans_possiveis)));
      endwhile
    
      if (length(trans_possiveis)== 0)  %verificar se ainda h� transi��es a serem feitas  
        acabou = 1;
      elseif(cont_geracao == 6)    %ESCOLHA O TAMANHO DA REDE DE PETRI AQUI.
        acabou = 1;
      else
        printf("\nVamos continuar a montar a �rvore! Estamos na gera��o %d\n",cont_geracao+1)
        printf("\nA(s) seguinte(s) transi��o(�es) ainda �(s�o) poss�vel(is):%s\n\n",trans_possiveis)
        no_pai = no_arvore(fichas_trans,trans_possiveis,"",cont_geracao,cont_geracao)
      endif
    endwhile  %DIZER O TIPO DA REDE DE PETRI
    
    disp("\nN�o h� mais transi��es a fazer. O programa acabou.\n")
    disp("Aguarde a impress�o da �rvore de alcan�abilidade.\n")
    faz_arvore(nos_totais);
  else
    disp("Essa configura��o de rede n�o tem transi��es poss�veis.\n")
  endif
endfunction