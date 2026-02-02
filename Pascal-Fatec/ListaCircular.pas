program ListaCircular;

type
    NodeType = ^Node;
    Node = record
        Number: integer;
        NodeAdress: NodeType;
end;

// variables that belongs to the program
var
    list: NodeType;
    // amount: integer;

procedure CountCircleList(circleList: NodeType);
var
    auxNode: NodeType;
    counter, value: integer;
begin
    if (circleList = nil) then
    begin
        writeln('Empty list');
        exit;
    end;
    auxNode := circleList;
    counter := 0;
    repeat
        counter := counter + 1;
        value := auxNode^.Number;
        writeln(counter, ' - Value: ', value);
        auxNode := auxNode^.NodeAdress;
    until (auxNode = circleList);
    writeln('List`s end');
    writeln();
    writeln('List has ', counter, ' nodes.');
end;

procedure EndNode(var circleList: NodeType; insert: integer);
var
    auxNode, newNode: NodeType;
begin
    new(newNode);
    newNode^.Number := insert;
    newNode^.NodeAdress := nil;
    if (circleList = nil) then
    begin
        newNode^.NodeAdress := newNode;
        circleList := newNode;
        exit;
    end;
    auxNode := circleList;
    while (auxNode^.NodeAdress <> circleList) do
    begin
        auxNode := auxNode^.NodeAdress;
    end;
    auxNode^.NodeAdress := newNode;
    newNode^.NodeAdress := circleList;
end;

Begin
    list := nil;

    CountCircleList(list);

    EndNode(list, 5);
    EndNode(list, 53);
    EndNode(list, 15);
    EndNode(list, 9);
    EndNode(list, 2);

    CountCircleList(list);
End.