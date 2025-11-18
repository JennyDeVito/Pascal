program ListaEncadeadaEPilha;

// fix OBSOLETO: PROGRAMA FOI SEPARADO EM PILHA E LISTA ENCADEADA
// uses crt;



//todo lista de functions e procedures
// tsc functions and procedures
{   Order of appearance
}

// TIPOS {PascalCase}
type
    EnderecoNo = ^No;
    No = record
        Dado : integer;
        ProximoNo : EnderecoNo;
end;

// o compilador não está aceitando as duas estruturas no mesmo type
type
    Vetor = array[1..100] of integer;
    Pilha = record
        Posicao : integer;
        Elementos : Vetor;
end;

// VARIÁVEIS {camelCase}
var
    inicioLista: EnderecoNo;
    stack: Pilha;
    stackSize, stackMaximumSize: integer;
    stackDebbuger: boolean;
    // a: integer; { debug }

// FUNCTIONS {PascalCase}
function IsEmpty(p4: Pilha): boolean;
begin
    if (p4.Posicao = 0) then
        IsEmpty := true
    else
        IsEmpty := false;
end;

function IsFull(p5: Pilha; numero4: integer): boolean;
begin
    if (p5.Posicao = numero4) then
        IsFull := true
    else
        IsFull := false;
end;

{Conta a quantidade de nós cujo valor é negativo}
function ContaNegativos(listaEncadeada: EnderecoNo): integer;
var
    noAuxiliar : EnderecoNo;
    contador : integer;
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

{imprime a quantidade de positivos na pilha sem esvaziá-la}
function ContaPositivosPilha(p: Pilha): integer;
var
    i, tamanhoPilha, contador: integer;
begin
    contador := 0;
    if (IsEmpty(p) = true) then
    begin
        writeln('A pilha está vazia!')
    end
    else
    begin
        tamanhoPilha := p.Posicao;
        for i := tamanhoPilha downto 1 do
        begin
            if ((p.Elementos[p.Posicao]) > 0) then
                contador := contador + 1;
            p.Posicao := p.Posicao - 1;
        end;
    end;
    ContaPositivosPilha := contador;
end;

// PROCEDURES {PascalCase}
{inicia pilha}
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
    novoNo^.ProximoNo := nil;
    if (listaEncadeada = nil) then
    begin
        listaEncadeada := novoNo
    end
    else
    begin
        novoNo^.ProximoNo := listaEncadeada;
        listaEncadeada := novoNo;
    end;
end;

{imprime lista encadeada}
procedure ImprimeListaEncadeada(listaEncadeada: EnderecoNo);
var
    noAuxiliar : EnderecoNo;
    contador : integer;
begin
    noAuxiliar := listaEncadeada;
    contador := 0;
    if (noAuxiliar = nil) then
    begin
        writeln('A lista está vazia!');
    end
    else
    begin
        while (noAuxiliar^.ProximoNo <> nil) do
        begin
            contador := contador + 1;
            write('Nó ');
            write(contador);
            write(': ');
            writeln(noAuxiliar^.Dado);
            noAuxiliar := noAuxiliar^.ProximoNo;
        end;
        contador := contador + 1;
        write('Nó ');
        write(contador);
        write(': ');
        writeln(noAuxiliar^.Dado);
        writeln('Fim da lista encadeada.');
        writeln();
    end;
end;

{imprime toda a pilha sem esvaziá-la}
procedure ImprimePilha(p: Pilha);
var
    i, tamanhoPilha: integer;
begin
    if (IsEmpty(p) = true) then
    begin
        writeln('A pilha está vazia!')
    end
    else
    begin
        tamanhoPilha := p.Posicao;
        for i := tamanhoPilha downto 1 do
        begin
            write('Posição: ');
            write(p.Posicao);
            write(' - Valor: ');
            writeln(p.Elementos[p.Posicao]);
            p.Posicao := p.Posicao - 1;
        end;
    end;
end;

// MAIN PROGRAM
Begin
    InicioLista := nil;
    InsereNoFim(InicioLista, 42);
    InsereNoFim(InicioLista, 63);
    ImprimeListaEncadeada(InicioLista);
    InsereNoFim(InicioLista, -17);
    InsereNoFim(InicioLista, -2);
    ImprimeListaEncadeada(InicioLista);
    InsereNoInicio(InicioLista, 5);
    InsereNoInicio(InicioLista, 25);
    ImprimeListaEncadeada(InicioLista);
    write('A lista encadeada possui ');
    write(ContaNegativos(InicioLista));
    writeln(' nós cujo valor é negativo.');
    writeln();
    Init(stack);
    stackSize := 0;
    stackMaximumSize := 100;
    Push(stack, 8);
    Push(stack, 12);
    Push(stack, 46);
    Push(stack, 98);
    Push(stack, 0);
    Push(stack, 21);
    Push(stack, 9);
    Push(stack, -11);
    Push(stack, -1);
    Push(stack, -3);
    stackSize := stack.Posicao;
    writeln('Tamanho da pilha: ', stackSize);
    ImprimePilha(stack);
    write('A pilha possui ', ContaPositivosPilha(stack));
    writeln(' elementos positivos.');

    // debug start
    // dúvida: como usar essa função? porque, do modo como eu a usei aqui sempre será true
    // stackDebbuger := IsFull(stack, stackSize);
    // writeln(stackDebbuger);
    // debug end

    // debug testing 'for...downto' command
    // for a := 10 downto 1 do
    //     writeln('Counting down: ', a);
    // debug testing 'for...downto' command ends
End.