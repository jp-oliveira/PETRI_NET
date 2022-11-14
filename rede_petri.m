disp("Bem vindo(a) ao construtor de rede de Petri.\n");
%lugares = input("Primeiro informe os lugares que voce deseja na sua rede. ex: p1 p2 p3 etc\n","s"); %vetor com os lugares
lugares = "p1 p2 p3 p4";
%transicoes = input("Agora informe as transicoes. ex: t1 t2 t3 etc\n","s"); %vetor com as transicoes
transicoes = "t1 t2 t3";

%entradas = input("Agora informe os lugares de entrada de cada transicao e seus respectivos pesos.\n", "s");
entradas = "p1-1 p2-1 p3-1 p4-0;p1-0 p2-0 p3-0 p4-1;p1-0 p2-0 p3-1 p4-0";
entradas = strsplit(entradas,";");
%escrever assim: "p1-1 p2-1 p3-1 p4-2;p1-1 p2-2 p3-3 p4-1"  entradas(1) = entradas de t1// entradas(2) = entradas de t2
%caso um lugar não entre numa transicao, colocar por exemplo p2-0 

%saidas = input("Agora informe os lugares de saida de cada transicao.\n", "s");
%escrever da mesma forma que a acima
saidas   = "p1-1 p2-0 p3-0 p4-0;p1-0 p2-1 p3-1 p4-0;p1-0 p2-0 p3-0 p4-1";
saidas = strsplit(saidas,";");

%fichas = input("Por fim, informe a marcacao inicial das fichas. ex: [2,3,4,1]\n");
fichas = {[1,0,1,0]};
gera_arvore(transicoes,fichas, entradas, saidas);
%{
entradas = p1-1 p2-0 p3-0;p1-1 p2-0 p3-0;p1-0 p2-1 p3-1
saidas = p1-1 p2-1 p3-0;p1-0 p2-1 p3-1;p1-0 p2-0 p3-1
fichas = [1,0,0] 
%} 