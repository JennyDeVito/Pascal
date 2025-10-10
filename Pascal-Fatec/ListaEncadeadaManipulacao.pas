program TotalNodosNegativos;

uses crt;

type 
    EnderecoNo = ^No;
    No = record
        Dado = integer;
        ProximoNo = EnderecoNo;
    Vetor = array[1..100] of integer;
    Pilha = record
        Posicao = integer;
        Elementos = Vetor;
end;

{declarar variaveis} {camelCase}
var
    inicioLista: EnderecoNo;
    stack: Pilha;
    entrada: integer;

// PROCEDURES {PascalCase}
{inicial pilha}
procedure Init(var p1: Pilha);
begin
    p1.Posicao := 0;
end;

{insere inteiro na pilha}
procedure Push(var p2: Pilha; numero1: integer);
begin
    p2.Posicao := p2.Posicao + 1;
    p2.Elementos[p2.Posicao] := numero1;
end;

{retira elemento da pilha}
procedure Pop(var p3: Pilha);
begin
    p3.Posicao := p3.Posicao - 1;
end;

{insere no fim da lista encadeada}
procedure InsereNoFim(var listaEncadeada: EnderecoNo; numero2: integer);
var
    novoNo, noAuxiliar: EnderecoNo;
begin
    new(novoNo);
    novoNo^.Dado := numero2;
    novoNo^.ProximoNo := nil;
    if (listaEncadeada = nil) then
        listaEncadeada := novoNo
    else
    begin
        noAuxiliar := listaEncadeada;
        while(noAuxiliar^.ProximoNo <> nil) do
        begin
            noAuxiliar := noAuxiliar^.ProximoNo;
        end;
        noAuxiliar^.ProximoNo := novoNo;
    end;
end;

{preenche lista com pilha}
procedure PreencheListaComPilha(var p: Pilha; listaEncadeada: EnderecoNo);
var
    novoNo, noAuxiliar: EnderecoNo;
begin
    new(listaEncadeada);
    novoNo := listaEncadeada;
    if(IsEmpty(p)) then
        writeln('A pilha está vazia!')
    else
    begin
        novoNo^.Dado := p.Elementos[p.Posicao];
        novoNo^.ProximoNo := nil;
        Pop(p);
        while(IsEmpty(p) <> true) do
        begin
            new(noAuxiliar);
            noAuxiliar^.Dado := p.Elementos[p.Posicao];
            noAuxiliar^.ProximoNo := nil;
            Pop(p);
            novoNo^.ProximoNo := noAuxiliar;
            novoNo := noAuxiliar;
        end;
    end;
end;

{insere no inicio da lista encadeada}
procedure InsereNoInicio(var listaEncadeada: EnderecoNo; numero3: integer);
var
    novoNo: EnderecoNo;
begin

    new(novoNo);
    novoNo^.Dado := numero3;
    novoNo^.ProximoNo := listaEncadeada;

end;

// FUNCTIONS {PascalCase}
function IsEmpty(p4: Pilha): boolean;
begin
    if (p4.Posicao = 0) then
        IsEmpty := true
    else
        IsEmpty := false;
end;

function IsFull(p5: Pilha, numeron: integer): boolean;
begin
    if (p5.Posicao = numeron) then
        IsFull := true
    else
        IsFull := false;
end;

{Conta os nós com dados negativos}
function ContaNegativos(listaEncadeada: EnderecoNo):integer;
var
    noAuxiliar: EnderecoNo;
    contador: integer;
begin
    noAuxiliar := listaEncadeada;
    contador := 0;
    while(noAuxiliar <> nil) do
    begin
        if (noAuxiliar^.Dado < 0) then
            contador := contador + 1;
        noAuxiliar := noAuxiliar^.ProximoNo;
    end;
    ContaNegativos := contador;
end;

// MAIN PROGRAM
Begin
    
End;