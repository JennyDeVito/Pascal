program ListaEncadeadaManipulacao;

// fix en_US language
// todo document what this program does and the usage
// todo link each program with the class where it were asked

// explanation: disabled 'cause the documentation said it doesn't like Linux
// uses crt;

// tsc funcions and procedures
{   Init
    IsEmpty
    IsFull
    Push
    Pop
    ImprimePilha
    ContaListaEncadeada
    ContaNegativosLista
    InsereNoFim
    InsereNoInicio
    InsereInicioFimConta
    InsereQuarta
    InsereAposPar
    ImprimeListaEncadeada
    EsvaziaPilhaParaLista
}

// explanation 1: fpc isn't accepting node and stack declared together
// explanation 1/2: this program is about nodes but it has a routine that uses
// explanation 2/2: uses stack
{TYPE - PascalCase}
type // node
    EnderecoNo = ^No;
    No = record
        Dado : integer;
        ProximoNo : EnderecoNo;
end;

type // stack
    Vetor = array[1..100] of integer;
    Pilha = record
        Posicao : integer;
        Elementos : Vetor;
end;

{VARIABLES TO USE IN THE PROGRAM - camelCase}
var
    lista: EnderecoNo;
    // tamanhoLista: integer;
    stack: Pilha;
    // stackSize, stackMaximumSize: integer;
    // stackDebbuger: boolean;
    // a: integer; // debug

{STACK - FUNCTIONS AND PROCEDURES - PascalCase}
{inicia pilha}
procedure Init(var p: Pilha);
begin
    p.Posicao := 0;
end;

function IsEmpty(p: Pilha): boolean;
begin
    if (p.Posicao = 0) then
        IsEmpty := true
    else
        IsEmpty := false;
end;

function IsFull(p: Pilha; n: integer): boolean;
begin
    if (p.Posicao = n) then
        IsFull := true
    else
        IsFull := false;
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

{LISTS - FUNCTIONS AND PROCEDURES - PascalCase}
{Aula 10 - return the amount of elements in the list}
function ContaListaEncadeada(listaEncadeada: EnderecoNo): integer;
var
    noAuxiliar: EnderecoNo;
    contador: integer;
begin
    noAuxiliar := listaEncadeada;
    contador := 0;
    if (noAuxiliar = nil) then
    begin
        ContaListaEncadeada := -1
        // writeln('A lista está vazia!')
    end
    else
    begin
        while (noAuxiliar^.ProximoNo <> nil) do
        begin
            contador := contador + 1;
            noAuxiliar := noAuxiliar^.ProximoNo;
        end;
        contador := contador + 1;
        ContaListaEncadeada := contador;
    end;
end;

{Conta a quantidade de nós cujo valor é negativo}
function ContaNegativosLista(listaEncadeada: EnderecoNo): integer;
var
    noAuxiliar : EnderecoNo;
    contador : integer;
begin
    noAuxiliar := listaEncadeada;
    contador := 0;
    if (noAuxiliar = nil) then
    begin
        ContaNegativosLista := -1
        // writeln('A lista está vazia!');
    end
    else
    begin
        while (noAuxiliar^.ProximoNo <> nil) do
        begin
            if (noAuxiliar^.Dado < 0) then
            begin
                contador := contador + 1;
            end;
            noAuxiliar := noAuxiliar^.ProximoNo;
        end;
        if (noAuxiliar^.Dado < 0) then
        begin
            contador := contador + 1;
        end;
        ContaNegativosLista := contador;
    end;
end;

{Aula 11 - insere no fim da lista encadeada}
procedure InsereNoFim(var listaEncadeada: EnderecoNo; n: integer);
var
    novoNo, noAuxiliar: EnderecoNo;
begin
    new(novoNo);
    novoNo^.Dado := n;
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

{Aula 12 - insere no inicio da lista encadeada}
procedure InsereNoInicio(var listaEncadeada: EnderecoNo; n: integer);
var
    novoNo: EnderecoNo;
begin
    new(novoNo);
    novoNo^.Dado := n;
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

{Aula 12 - insere número dado no início e no fim da lista e conta os nós}
function InsereInicioFimConta(var listaEncadeada: EnderecoNo; n: integer): integer;
var
    // precisa criar mais um nó para não endereçar a lista em círculos
    novoNo, noAuxiliar, noSecundario: EnderecoNo;
    contador: integer;
begin
    // passa a head principal para a head auxiliar (lista de manipulação)
    noAuxiliar := listaEncadeada;
    // inicia o contador
    contador := 0;
    // cria os novos nós, atribui n para dado e nil para próximo nó
    // explicação 1/3: um nó deve ser o primeiro e outro deve ser o último da
    // explicação 2/3: lista se só criar um nó, a lista vai iniciar e terminar
    // explicação 3/3: no mesmo endereço de memória
    new(novoNo);
    novoNo^.Dado := n;
    novoNo^.ProximoNo := nil;
    new(noSecundario);
    noSecundario^.Dado := n;
    noSecundario^.ProximoNo := nil;
    // se a lista encadeada estiver vazia
    if (noAuxiliar = nil) then
    begin
        // o head auxiliar recebe o novo nó onde o proximo endereço é nil
        noAuxiliar := novoNo;
        // o segundo endereço do head recebe o novo nó
        noAuxiliar^.ProximoNo := noSecundario;
        // o head principal recebe a head auxiliar (lista de manipulação)
        listaEncadeada := noAuxiliar;
        contador := 2;
    end
        // else (noAuxiliar = nil) = false => lista já tem elementos
    else
    begin
        // passa pelos nós até que o último próximo endereço seja nil
        contador := 1;
        while (noAuxiliar^.ProximoNo <> nil) do
        begin
            noAuxiliar := noAuxiliar^.ProximoNo;
            contador := contador + 1;
        end;
        // o último nó da lista recebe um dos novos nós
        noAuxiliar^.ProximoNo := novoNo;
        contador := contador + 1;
        // coloca o head principal como segundo endereço no noSecundario
        noSecundario^.ProximoNo := listaEncadeada;
        // o head principal recebe o noSecundario para inserir o novo nó
        listaEncadeada := noSecundario;
        contador := contador + 1;
    end;
    InsereInicioFimConta := contador;
end;

{Aula 13 - insere na quarta posição ou antes - o que vier primeiro}
procedure InsereQuarta(var listaEncadeada: EnderecoNo; n: integer);
var
    novoNo, noAuxiliar, noSecundario: EnderecoNo;
    contador: integer;
begin
    // prepara os novos nós
    new(novoNo);
    novoNo^.Dado := n;
    novoNo^.ProximoNo := nil;
    new(noSecundario);
    noSecundario := nil;
    noAuxiliar := listaEncadeada;
    contador := 1;
    if (noAuxiliar = nil) then
    begin
        noAuxiliar := novoNo;
        listaEncadeada := noAuxiliar;
    end
    else
    begin
        // percorre a lista até chegar em nil ou no terceiro nó
        while (noAuxiliar^.ProximoNo <> nil) do
        begin
            if (contador = 3) then
            begin
                break;
            end;
            noAuxiliar := noAuxiliar^.ProximoNo;
            contador := contador + 1;
        end;
        if (noAuxiliar^.ProximoNo = nil) then
        begin
            noAuxiliar^.ProximoNo := novoNo
        end
        else
        begin
            // recebe o restante da lista
            noSecundario := noAuxiliar^.ProximoNo;
            // endereço do quarto nó recebe o novo nó
            noAuxiliar^.ProximoNo := novoNo;
            // novo nó recebe o restante da lista
            novoNo^.ProximoNo := noSecundario;
        end;
    end;
end;

{Aula 13 - Insere novo nó após primeiro nó cujo conteúdo seja par}
procedure InsereAposPar(var listaEncadeada: EnderecoNo; n: integer);
var
    novoNo, noAuxiliar, noSecundario: EnderecoNo;
begin
    // prepara os novos nós
    new(novoNo);
    novoNo^.Dado := n;
    novoNo^.ProximoNo := nil;
    new(noSecundario);
    noSecundario := nil;
    noAuxiliar := listaEncadeada;
    if (noAuxiliar = nil) then
    begin
        noAuxiliar := novoNo;
        listaEncadeada := noAuxiliar;
    end
    else
    begin
        // percorre a lista dos nós cujo endereço seguinte não seja nil
        while (noAuxiliar^.ProximoNo <> nil) do
        begin
            // sai do loop se o conteúdo do nó for par
            if ((noAuxiliar^.Dado Mod 2) = 0) then
            begin
                break;
            end;
            noAuxiliar := noAuxiliar^.ProximoNo;
        end;
        // após o fim do loop, o nó auxiliar é o nó procurado?
        if ((noAuxiliar^.Dado Mod 2) = 0) then
        begin
            // True! recebe novo nó: Próximo nó é nil => recebe o novo nó
            if (noAuxiliar^.ProximoNo = nil) then
            begin
                noAuxiliar^.ProximoNo := novoNo
            end
            else
            begin
                // Próximo nó não é nil => nó secundário recebe o restante da
                // lista
                noSecundario := noAuxiliar^.ProximoNo;
                // nó referência recebe o novo nó
                noAuxiliar^.ProximoNo := novoNo;
                // novo nó recebe o restante da lista
                novoNo^.ProximoNo := noSecundario;
            end;
        end
        else
        begin
            writeln('A lista não tem nós com valores pares.');
            writeln('Nada foi acrescentado.');
            writeln();
        end;
    end;
end;

{Aula 14 - Exclui o último nó da lista encadeada}
procedure ExcluiFinalLista(var listaEncadeada: EnderecoNo);
var
    inicioLista, noAuxiliar, noSecundario: EnderecoNo;
begin
    inicioLista := listaEncadeada;
    if (inicioLista = nil) then
    begin
        writeln('A lista já está vazia - não há o que apagar!')
    end
    else
    begin
        // se o primeiro nó for o único da lista eu apago
        if (iniciolista^.ProximoNo = nil) then
        begin
            dispose(inicioLista);
            inicioLista := nil;
            // e devolvo para a lista original - IMPORTANTE!
            listaEncadeada := inicioLista;
        end
        // senão jogo no nó auxiliar
        else
        begin
            noAuxiliar := iniciolista^.ProximoNo;
            // se o segundo nó for o último
            if (noAuxiliar^.ProximoNo = nil) then
            begin
                iniciolista^.ProximoNo := nil;
                dispose(noAuxiliar);
            end
            else
            begin
                noSecundario := noAuxiliar^.ProximoNo;
                // se o terceiro nó for o último
                if (noSecundario^.ProximoNo = nil) then
                begin
                    noAuxiliar^.ProximoNo := nil;
                    dispose(noSecundario);
                end
                else
                begin
                    // se o terceiro não for o último um laço percorre a lista
                    while (noSecundario^.ProximoNo <> nil) do
                    begin
                        noSecundario := noSecundario^.ProximoNo;
                        noAuxiliar := noAuxiliar^.ProximoNo;
                    end;
                    // o laço termina quando noSecundario^.ProximoNo = nil, então
                    // o penúltimo nó perde a referência para o último nó
                    noAuxiliar^.ProximoNo := nil;
                    // o último nó é apagado
                    dispose(noSecundario);
                end;
            end;
        end;
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

{STACK + LISTS - FUNCTIONS AND PROCEDURES - PascalCase}
{procedure that empties a stack to fill a list}
procedure EsvaziaPilhaParaLista(var p: Pilha; listaEncadeada: EnderecoNo);
var
    novoNo, noAuxiliar: EnderecoNo;
begin
    if(IsEmpty(p)) then
        writeln('A pilha está vazia!')
    else
    begin
        // enquanto a pilha tiver elementos, faça
        while (IsEmpty(p) <> true) do
        begin
            // crie um novo nó, acrescente o topo da pilha e nil no próximo nó
            new(novoNo);
            novoNo^.Dado := p.Elementos[p.Posicao];
            novoNo^.ProximoNo := nil;
            // nó auxiliar recebe o head da lista principal
            noAuxiliar := listaEncadeada;
            // se a lista estiver vazia ela recebe o novo nó
            if (noAuxiliar = nil) then
                noAuxiliar := novoNo
                // se já tiver elementos busca o próximo nó = nil
            else
            begin
                while (noAuxiliar^.ProximoNo <> nil) do
                begin
                    noAuxiliar := noAuxiliar^.ProximoNo;
                end;
                // quando próximo nó = nil recebe o novo nó
                noAuxiliar^.ProximoNo := novoNo;
            end;
            // retira o último elemento da pilha
            Pop(p);
        end;
    end;
end;

// MAIN PROGRAM
Begin
    lista := nil;
    InsereNoFim(lista, 51);
    InsereNoFim(lista, 61);
    // // ImprimeListaEncadeada(lista);
    InsereNoFim(lista, -17);
    InsereNoFim(lista, -2);
    // ImprimeListaEncadeada(lista);
    InsereNoInicio(lista, 5);
    InsereNoInicio(lista, 25);
    InsereNoInicio(lista, 0);
    InsereNoFim(lista, 1);
    InsereNoFim(lista, 5);
    InsereNoFim(lista, 205);
    // ImprimeListaEncadeada(lista);
    // writeln();

    // if ((ContaNegativosLista(lista) = -1)) then
    // begin
    //     writeln('A lista está vazia!');
    //     writeln();
    // end
    // else if ((ContaNegativosLista(lista) = 0)) then
    // begin
    //     writeln('A lista não tem nós negativos.');
    //     writeln();
    // end
    // else
    // begin
    //     write('A lista possui: ');
    //     writeln(ContaNegativosLista(lista), ' nós negativos.');
    //     writeln();
    // end;

    // if ((ContaListaEncadeada(lista) = -1)) then
    // begin
    //     writeln('A lista está vazia!');
    //     writeln();
    // end
    // else
    // begin
    //     write('A lista possui: ');
    //     writeln(ContaListaEncadeada(lista), ' nós.');
    //     writeln();
    // end;

    // tamanhoLista := InsereInicioFimConta(lista, 18);

    // ImprimeListaEncadeada(lista);
    // writeln();

    // writeln('Após inserir 18 no inicio e no fim a lista tem  ', tamanhoLista, ' nós.');
    // writeln();

    Init(stack);
    // stackSize := 0;
    // stackMaximumSize := 100;
    // Push(stack, 8);
    // Push(stack, 12);
    // Push(stack, 46);
    // Push(stack, 98);
    // Push(stack, 0);
    // Push(stack, 21);
    // Push(stack, 9);
    // Push(stack, -11);
    // Push(stack, -1);
    // Push(stack, -3);
    // stackSize := stack.Posicao;
    // writeln('Tamanho da pilha: ', stackSize);
    // writeln();

    // ImprimePilha(stack);
    // writeln();

    // EsvaziaPilhaParaLista(stack, lista);

    // ImprimeListaEncadeada(lista);
    // writeln();

    // ImprimePilha(stack);
    // writeln();

    // InsereQuarta(lista, 1023);

    InsereAposPar(lista, 48);

    ImprimeListaEncadeada(lista);
    writeln();

    ExcluiFinalLista(lista);

    ImprimeListaEncadeada(lista);
    writeln();

    // debug start
    // dúvida: como usar essa função? porque, do modo como eu a usei aqui sempre será true
    // stackSize := stack.Posicao; // sempre aponta o topo!
    // stackDebbuger := IsFull(stack, stackSize);
    // writeln(stackDebbuger);
    // debug end

    // debug testing 'for...downto' command
    // for a := 10 downto 1 do
    //     writeln('Counting down: ', a);
    // debug testing 'for...downto' command ends
End.