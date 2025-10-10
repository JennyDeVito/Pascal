program Hello;
TYPE vetor = array[1..4] OF INTEGER;
    PILHA = record
       OBJ: vetor;
       TOPO: INTEGER;
    end;
    ENDNODO = ^NODO;
    NODO = record
        DADO: INTEGER;
        PROX: ENDNODO;
END;
// ------------ PROCEDURES DADAS NA PROVA ------------
// ------------ PILHAS
PROCEDURE INIT (var X: PILHA);
begin
    X.TOPO := 0;
end;
PROCEDURE PUSH ( var X: PILHA; Y: INTEGER);
begin
    X.TOPO := X.TOPO + 1;
    X.OBJ[X.TOPO] := Y;
end;
PROCEDURE POP(var pi: PILHA);
begin
    pi.TOPO := pi.TOPO - 1;
end;
FUNCTION ISFULL(pi: PILHA; N: INTEGER) : boolean;
begin
    if(pi.TOPO = N) then
        ISFULL := true
    else
        ISFULL := false;
end;
FUNCTION ISEMPTY(pi: PILHA) : boolean;
begin
    if(pi.TOPO = 0) then
        ISEMPTY := true
    else 
        ISEMPTY := false;
end;

// ------------ FUNÇÕES FEITAS TIPICAS DE PROVA --------------
// ------------ PILHAS
PROCEDURE PRINT_PILHA(var pi: PILHA);
// printa todas os elementos da pilha enquanto a descarrega
begin
    if (ISEMPTY(pi)) then
        writeln('A pilha já estava vazia')
    else
    begin
        while(ISEMPTY(pi) <> true) do
        begin
            writeln(pi.OBJ[pi.TOPO]);
            POP(pi);
        end;
    end;
end;
PROCEDURE PREENCHE_PILHA_ATE_TOPO(var pi: PILHA; max: INTEGER);
var num: INTEGER;
begin
    INIT(pi);
    while(ISFULL(pi, max) <> true) do
    begin
        writeln('Escreva um numero: ');
        readln(num);
        PUSH(pi,num);
    end;
end;
FUNCTION QTE_ELEMENTOS_PILHA(pi: PILHA) : INTEGER;
begin
    QTE_ELEMENTOS_PILHA := pi.TOPO;
end;
FUNCTION QTE_NUM_NEG_PILHA(var pi: PILHA) : INTEGER;
var count: INTEGER;
begin
    count := 0;
    if ISEMPTY(pi) then
        QTE_NUM_NEG_PILHA := count
    else
    begin
        while(ISEMPTY(pi) <> true) do
        begin
            if pi.OBJ[pi.TOPO] < 0 then
                count := count + 1;
            POP(pi);
        end;
    end;
    QTE_NUM_NEG_PILHA := count;
end;
// ------------ LISTAS
PROCEDURE INSERE_NODO_FIM(var head: ENDNODO; valor: INTEGER);
VAR q, aux : ENDNODO;
begin
    new(q);
    q^.DADO := valor;
    q^.PROX := nil;
    if(head = nil) then
        head := q
    else
    begin
        aux := head;
        while(aux^.PROX <> nil) do
            aux := aux^.PROX;
        aux^.PROX := q;
    end;
end;
PROCEDURE INSERE_NODO_INICIO(var head : ENDNODO; valor : INTEGER);
var q : ENDNODO;
begin
    new(q);
    q^.DADO := valor;
    q^.PROX := nil;
    if(head = nil) then
        head := q
    else
    begin
        q^.PROX := head;
        head := q;
    end;
end;
PROCEDURE PRINT_LISTA(head: ENDNODO);
var q: ENDNODO;
begin
    if(head = nil) then
        writeln('A lista está vazia')
    else
    begin
        q := head;
        while (q^.PROX <> nil) do
        begin
            writeln(q^.DADO);
            q := q^.PROX;
        end;
        writeln(q^.DADO);
    end;
end;
PROCEDURE PREENCE_LISTA_COM_PILHA (var pi: PILHA; var head: ENDNODO);
// a lista recebida deve estar vazia
var q, aux: ENDNODO;
begin
    new(head);
    q := head;
    if (ISEMPTY(pi)) then 
        writeln('A pilha está vazia')
    else
    begin
        q^.DADO := pi.OBJ[pi.TOPO];
        q^.PROX := nil;
        POP(pi);
        while(ISEMPTY(pi) <> true) do
        begin
            new(aux);
            aux^.DADO := pi.OBJ[pi.TOPO];
            aux^.PROX := nil;
            POP(pi);
            q^.PROX := aux;
            q := aux;
        end;
    end;
end;

FUNCTION NUM_NEG_LISTA(head: ENDNODO) : INTEGER;
var count : INTEGER;
    aux: ENDNODO;
begin
    count := 0;
    if(head = nil) then
        NUM_NEG_LISTA := count
    else
    begin
        aux := head;
        while(aux^.PROX <> nil) do
        begin
            if(aux^.DADO < 0) then
                count := count + 1;
            aux := aux^.PROX;
        end;
        if(aux^.DADO < 0) then //tem q verificar o ultimo nodo pq ele nao entrou no while
                count := count + 1;
        NUM_NEG_LISTA := count;
    end;
end;
FUNCTION INSERE_NO_FIM_SOMA_ELEMENTOS(var head: ENDNODO; num: INTEGER) : INTEGER;
//a lista pode estar vazia
var soma: INTEGER;
    q, aux: ENDNODO;
begin
    soma := 0;
    soma := soma + num;
    new(aux);
    aux^.DADO := num;
    aux^.PROX := nil;
    if(head = nil) then
        head := aux
    else
    begin
        q := head;
        while(q^.PROX <> nil) do
        begin
            soma := soma + q^.DADO;
            q := q^.PROX;
        end;
        soma := soma + q^.DADO;
        q^.PROX := aux;
        q := aux;
    end;
    INSERE_NO_FIM_SOMA_ELEMENTOS := soma;
end;
// ------------ FUNÇÃO PRINCIPAL ------------
// ------------ VARIAVEIS
VAR p : PILHA;
    li : ENDNODO;
    num, max: INTEGER;
begin
    INIT(p);
    li := nil;
    INSERE_NODO_FIM(li, 1);
    INSERE_NODO_FIM(li, 1);
    INSERE_NODO_FIM(li, 1);
    //PRINT_LISTA(li);
    writeln('A soma dos elementos da lista eh ', INSERE_NO_FIM_SOMA_ELEMENTOS(li, 5));
    //PRINT_LISTA(li);
end.