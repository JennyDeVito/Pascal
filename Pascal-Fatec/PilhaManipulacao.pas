program PilhaManipulacao;

// fix: translate to en_US
// todo document what this program does and the usage
// todo link each program with the class where it were asked

// explanation: seems this crt library has issues on Linux so I'm not using it
// uses crt;

// tsc functions and procedures:
{   Init
    Push
    Pop
    IsEmpty
    IsFull
    ContaPositivosPilha
    ContaNegativosPilha
    ContaZerosPilha
    ImprimePilha
    EsvaziaPilha
    ProcuraValorPilha
    ContaPilha
}

{PascalCase}
type
    Vetor = array[1..20] of integer;
    Pilha = record
        Posicao : integer;
        Elementos : Vetor;
end;

{camelCase}
var
    stack: Pilha;
    stackSize, stackMaximum, stackLastPosition, entrada: integer;
    // stackDebbuger: boolean; // debug to use with IsEmpty() and IsFull()

{PascalCase}
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

// return the amount of greater-than-zero elements in the stack
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

// return the amount of less-than-zero elements in the stack
function ContaNegativosPilha(p: Pilha): integer;
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
            if ((p.Elementos[p.Posicao]) < 0) then
                contador := contador + 1;
            p.Posicao := p.Posicao - 1;
        end;
    end;
    ContaNegativosPilha := contador;
end;

// return the amount of zero elements in the stack
function ContaZerosPilha(p: Pilha): integer;
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
            if ((p.Elementos[p.Posicao]) = 0) then
                contador := contador + 1;
            p.Posicao := p.Posicao - 1;
        end;
    end;
    ContaZerosPilha := contador;
end;

// prints all the elements in the stack from last to first
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

// empties the stack
procedure EsvaziaPilha(var p: Pilha);
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
            write('Sai posição: ');
            write(p.Posicao);
            write(' - Valor: ');
            writeln(p.Elementos[p.Posicao]);
            Pop(p);
        end;
    end;
end;

procedure ProcuraValorPilha(p: Pilha; n: integer);
var
    tamanhoPilha, foundCount, foundInPosition, i: integer;
begin
    if (IsEmpty(p) = true) then
    begin
        writeln('A pilha está vazia!')
    end
    else
    begin
        tamanhoPilha := p.Posicao;
        foundCount := 0;
        foundInPosition := 0;
        for i := tamanhoPilha downto 1 do
        begin
            if ((p.Elementos[p.Posicao]) = n) then
            begin
                foundCount := foundCount + 1;
                foundInPosition := p.Posicao;
                writeln('O número está na posição ', foundInPosition);
            end;
            p.Posicao := p.Posicao - 1;
        end;
        if (foundCount = 0) then
        begin
            writeln('O número procurado não foi encontrado');
        end;
    end;
end;

function ContaPilha(p: Pilha): integer;
begin
    if (IsEmpty(p) = true) then
    begin
        writeln('A pilha está vazia!')
    end
    else
    begin
        ContaPilha := p.Posicao;
    end;
end;

// MAIN PROGRAM
// todo: interactive menu
Begin
    Init(stack);
    stackSize := 0;
    stackMaximum := 20;
    // laço 'for...to' para fazer o empilhamento
    for stackSize := 1 to stackMaximum do
    begin
        writeln('Digite o elemento ', stackSize, ' ou');
        writeln('999 para SAIR: ');
        readln(entrada);
        if (entrada = 999) then
        begin
            // explanation: stackSize is always 1 upfront
            stackLastPosition := stack.Posicao;
            writeln('Empilhamento finalizado com ', stackLastPosition, ' elementos.');
            break;
        end;
        Push(stack, entrada);
    end;
    writeln();

    ImprimePilha(stack);
    writeln();

    write('A pilha possui ', ContaPositivosPilha(stack));
    writeln(' elementos positivos.');
    write('A pilha possui ', ContaNegativosPilha(stack));
    writeln(' elementos negativos.');
    write('A pilha possui ', ContaZerosPilha(stack));
    writeln(' elementos nulos.');
    writeln();

    writeln('Procura número 2');
    ProcuraValorPilha(stack, 2);
    writeln('Procura número 7');
    ProcuraValorPilha(stack, 7);
    writeln();

    EsvaziaPilha(stack);
    writeln();

    ImprimePilha(stack);
    writeln();

    // debug start
    // dúvida: como usar essa função? porque, do modo como eu a usei aqui sempre será true
    // stackDebbuger := IsFull(stack, stackSize);
    // writeln(stackDebbuger);
    // debug end

    // debug testing 'for...downto' command with a countdown
    // for a := 10 downto 1 do
    //     writeln('Counting down: ', a);
    // debug testing 'for...downto' command ends
End.