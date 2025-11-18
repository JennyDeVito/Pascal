program PilhaContaElementos;
{recebe os elementos de uma pilha e retorna seu tamanho}

// uses crt;

{cria a pilha}
type
    vetor = array[1..100] of integer;
    pilha = record
        posicao : integer;
        elementos : vetor;
end;

// VARIAVEIS
var
    stack : pilha;
    contador, entrada : integer;

// FUNCOES E PROCEDURES
{inicia a pilha}
procedure Init(var p1 : pilha);
begin
    p1.posicao := 0;
end;

{adiciona elementos na pilha}
procedure Push(var p2 : pilha; numero1 : integer);
begin
    p2.posicao := p2.posicao + 1;
    p2.elementos[p2.posicao] := numero1;
end;

{retira elementos da pilha}
procedure Pop(p3 : pilha);
begin
    p3.posicao := p3.posicao - 1;
end;

{verifica se a pilha esta cheia}
function IsFull(p4 : pilha; numero2 : integer) : boolean;
begin
    if(p4.posicao = numero2) then
    begin
        IsFull := true;
    end
    else
    begin
        IsFull := false;
    end;
end;

{verifica se a pilha esta vazia}
function IsEmpty(p5 : pilha) : boolean;
begin
    if(p5.posicao = 0) then
    begin
        IsEmpty := true;
    end
    else
        begin
            IsEmpty := false;
        end;
    end;

{retorna o total de elementos da pilha}
function ContaPilha(p6 : pilha) : integer;
begin
    ContaPilha := p6.posicao;
end;

// PROGRAMA PRINCIPAL
Begin
    {inicia as variaveis}
    init(stack);
    contador := 1;

    {laco for que adiciona 100 elementos na pilha, exceto zero}
    for contador := 1 to 100 do
    begin
        writeln('Digite o elemento número ', contador, 'ou');
        writeln('0 para SAIR:');
        readln(entrada);
        if (entrada = 0) then
        begin
            writeln('Empilhamento finalizado antes da pilha chegar ao topo');
            break;
        end;
        Push(stack, entrada);
    end;

    writeln('A lista tem ', ContaPilha(stack), ' elementos.');
End.