procedure leer(var archivoLogico: {tipoArchivoDeRegistros};var registro: {tipoDeRegistros});
begin
    if (not eof(archivoLogico)) then
        read(archivoLogico, registro)
    else
        registro.cod := valorAlto;{valorAlto es una constante}
end;