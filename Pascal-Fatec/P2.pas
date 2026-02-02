program P2;

type
    Vetor = array[1..10] of integer;
    Pilha = record
        Posicao : integer;
        Elementos : Vetor;
end;

type // nodo
    EnderecoNo = ^No;
    No = record
        Dado : integer;
        ProximoNo : EnderecoNo;
end;

// starts a new stack
procedure Init(var p: Pilha);
begin
    p.Posicao := 0;
end;

{insere inteiro na pilha}
procedure Push(var p: Pilha; n: integer);
begin
    p.Posicao := p.Posicao + 1;
    p.Elementos[p.Posicao] := n;
end;

{retira elemento da pilha}
procedure Pop(var p: Pilha);
begin
    p.Posicao := p.Posicao - 1;
end;

// T if the stack is empty
// idea: return a sentence (create a procedure? add or turn it into one?)
function IsEmpty(p: Pilha): boolean;
begin
    if (p.Posicao = 0) then
        IsEmpty := true
    else
        IsEmpty := false;
end;

// T if the stack is full
// doubt 1/3: I don't get how to use this function right - seems like it will
// doubt 2/3: always return True - where do I get the 'n' from?!
// doubt 3/3: maybe the function shoud also use the max value used in the array?
// idea: return a sentence (create a procedure? add or turn it into one?)
function IsFull(p: Pilha; n: integer): boolean;
begin
    if (p.Posicao = n) then
        IsFull := true
    else
        IsFull := false;
end;

{recebe vetor e preenche uma pilha}
Procedure NovaPilha(var p: pilha; v: vetor);
var contadorador : integer;
begin
    contadorador := 1;
    Init(p);
    while ((IsFull(p, 10) <> true) and (contadorador < 11)) do
    begin
	    Push (p, v[contadorador]);
        contadorador := contadorador + 1;
    end;
end;

{Sequencia de Fibonacci}
function Fibonacci(x: longint): longint;
begin
    if ((x = 1) OR (x = 2)) then
    begin
        Fibonacci := 1
    end
    else
    begin
	    Fibonacci := Fibonacci (x - 2) + Fibonacci (x-1);
    end;
end;

{3) (3,0) DESENVOLVA UMA PROCEDURE QUE RECEBA QUE RECEBA UM VETOR v DE 10 ELEMENTOS CONTENDO NÚMEROS INTEIROS E UMA LISTA ENCADEADA SIMPLES. A ROTINA DEVE INCLUIR OS ELEMENTOS DO VETOR NA LISTA, CASO EXISTA.
USEM O TYPE ABAIXO:
        TYPE VETOR = ARRAY [1 .. 10] OF INTEGER;
             ENDNODO = ^NODO;
             NODO = RECORD
		     INFO : INTEGER;
		     PROX : ENDNODO;
        END;
        VAR P: ENDNODO;}

Procedure NovaLista(v: vetor; var p: EnderecoNo);
var
    q, r: EnderecoNo;
    contador: integer;
begin
    contador := 1;
    if (p = nil) then
    begin
        new(p);
        p^.Dado := v[contador];
        p^.ProximoNo := nil;
        q := p;
        contador := contador + 1;
    end;
    q := p;
    while (q^.ProximoNo <> nil) do
    begin
        q := q^.ProximoNo;
    end;
    while (contador < 11) do
    begin
        new(r);
        r^.Dado := v [contador];
        r^.ProximoNo := nil;
        q^.ProximoNo := r;
        q := r;
        contador := contador + 1;
    end;
end;

{4) (3,0) DESENVOLVA UMA FUNÇÃO QUE RECEBA UMA ABB E DEVOLVA O NÚMERO DE FOLHAS EXISTENTES NESSA ABB.}
function ContaFolhasArvore(node: arvore): integer;
begin
    // se não tem nós não tem folhas
    if (node = nil) then
    begin
        FolhasArvore := 0;
    end
    else
    begin
        // se não tem nó na esquerda nem na direita só tem um ramo principal
        if (node^.esquerda = nil) and (node^.direita = nil) then
        begin
            FolhasArvore := 1;
        end
        else
        begin
            // recursão para contar as folhas da árvore binária
            FolhasArvore := FolhasArvore(node^.esquerda) + FolhasArvore(node^.direita);
    end;
end;