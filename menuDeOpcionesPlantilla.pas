program plantilla;
const
    dir = '';{ Ingrese el directorio donde esté trabajando }
    cantOpciones = 0;{ Ingrese acá el número de opciones que su menú va a tener }
type
    tipoVectorDeOpciones = array [1..cantOpciones] of string;

procedure inicializarVectorDeOpciones(var vector: tipoVectorDeOpciones);
begin
    vector[1] := '';{ Ingrese acá la o las opciones que quiere mostrar al usuario }
end;

procedure mostrarTodasLasOpciones(vectorDeOpciones: tipoVectorDeOpciones);
var
    i: integer;
begin
    for i := 1 to cantOpciones do
        writeln(i , ') ' ,vectorDeOpciones[i]);
end;

procedure menu(var opcion: integer);
var
    vectorDeOpciones: tipoVectorDeOpciones;
begin
    inicializarVectorDeOpciones(vectorDeOpciones);
    writeln('Elija una de las siguientes opciones:');
    mostrarTodasLasOpciones(vectorDeOpciones);
    readln(opcion);
end;

function esUnaOpcionValida(opcion: integer):boolean;
begin
    esUnaOpcionValida := ((opcion > 0) and (opcion <= cantOpciones));
end;

procedure procesarOpcionValida(opcion: integer);
begin
    case opcion of
        1: { ingrese acá la subrutina donde quiere resolver el problema basado en el valor de la opcion };
    end;
end;

procedure procesarOpcion(opcion: integer);
begin
    if esUnaOpcionValida(opcion) then
        procesarOpcionValida(opcion)
    else
        writeln('No ingresaste una opción válida, por favor, inténtalo de nuevo.');
end;

var
    opcion: integer;
begin
    repeat
        menu(opcion);
        procesarOpcion(opcion);
    until (esUnaOpcionValida(opcion));
end.