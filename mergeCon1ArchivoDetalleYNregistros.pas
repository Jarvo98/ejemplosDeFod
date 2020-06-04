{ Ajustar identación antes de copiar para evitar perder tiempo mientras se copia y pega }
procedure merge(var maestro: { tipoDeArchivoMaestro };var detalle: { tipoDeArchivoDetalle });
                
    procedure leer(var archivoLogico: tipoArchivoDeDetalleAlumno;var registro: detalleAlumno);
    begin
        if (not eof(archivoLogico)) then
            read(archivoLogico, registro)
        else
            registro.cod := valorAlto;{valorAlto es una constante}
    end;

    procedure inicializar(var maestro: { tipoDeArchivoMaestro };var registroMaestro: { tipoRegistroMaestro };var detalle: { tipoDeArchivoDetalle };var registroDetalle: { tipoRegistroDetalle });
    begin
        read(maestro, registroMaestro);
        leer(detalle, registroDetalle);
    end;

    procedure procesar(var maestro: { tipoDeArchivoMaestro };var registroMaestro: { tipoRegistroMaestro };var detalle: { tipoDeArchivoDetalle };var registroDetalle: { tipoRegistroDetalle });
    
        procedure buscarRegistroMaestroAModificar(var maestro: { tipoDeArchivoMaestro };var registroMaestro: { tipoRegistroMaestro };aux: { Declarar basándose en qué forma están ordenados físicamente los registros en ambos archivos });
        begin
            while (registroMaestro <> aux { Hay que rellenar este boolean basado en qué ordenación tiene el archivo maestro y qué estructura tiene los registros maestros } ) do
                read(maestro, registroMaestro);
        end;

        procedure totalizarCambiosSobreRegistroMaestroBasadoEnArchivoDetalle(var detalle: { tipoDeArchivoDetalle };var registroDetalle: { tipoRegistroDetalle };var registroMaestro: { tipoRegistroMaestro };aux: { Declarar basándose en qué forma están ordenados físicamente los registros en ambos archivos });

            procedure inicializar(var total: { Rellenar con el tipo de dato que se requiera dependiendo de la situación });
            begin
                { Inicializar basado en la situación y el tipo de dato de total }
            end;

            procedure totalizar(var registroDetalle: { tipoRegistroDetalle };var total: { Rellenar con el tipo de dato que se requiera dependiendo de la situación });
            begin
                { Totalizar dependerá de cada situación, llenar basado en uso }
            end;

            procedure actualizarRegistroMaestro(var registroMaestro: { tipoRegistroMaestro };total: { Rellenar con el tipo de dato que se requiera dependiendo de la situación });
            begin
                { actualizarRegistroMaestro dependerá de la estructura del registro maestro y el tipo de dato que sea total }
            end;

        var
            total: { Rellenar con el tipo de dato que se requiera dependiendo de la situación };
        begin
            inicializar(total);

            while (aux = registroDetalle { Hay que rellenar este boolean basado en qué ordenación tiene el archivo detalle y qué estructura tiene los registros detalle }) do begin
                totalizar(registroDetalle, total);
                leer(detalle, registroDetalle);
            end;

            actualizarRegistroMaestro(registroMaestro, total);
        end;

        procedure actualizarMaestro(var maestro: { tipoDeArchivoMaestro };var registroMaestro: { tipoRegistroMaestro });
        begin
            seek(maestro, (filepos(maestro) - 1));
            write(maestro, registroMaestro);
        end;

    var
        aux: { Declarar basándose en qué forma están ordenados físicamente los registros en ambos archivos };
    begin
        aux := { Inicializar basándose en qué forma están ordenados físicamente los registros en ambos archivos };

        buscarRegistroMaestroAModificar(maestro, registroMaestro, aux);

        totalizarCambiosSobreRegistroMaestroBasadoEnArchivoDetalle(detalle, registroDetalle, registroMaestro, aux);

        actualizarMaestro(maestro, registroMaestro);

        if (not eof(maestro)) then read(maestro, registroMaestro);
    end;
var
    registroMaestro: { tipoRegistroMaestro };
    registroDetalle: { tipoRegistroDetalle };
begin
    inicializar(maestro, registroMaestro, detalle, registroDetalle);

    while (registroDetalle.cod <> valorAlto) do procesar(maestro, registroMaestro, detalle, registroDetalle);
end;