{ Ajustar identación antes de copiar para evitar perder tiempo mientras se copia y pega }
procedure manejoDeArchivoCompleto(var archivo: { tipoDeArchivo });

    procedure inicializar(var archivo: { tipoDeArchivo });
    
        procedure asignar(var archivo: { tipoDeArchivo });
        begin
            assign(archivo, { Dirección física del archivo });
        end;

        procedure conectar(var archivo: { tipoDeArchivo });
        begin
            { Hacer reset o rewrite dependiendo de la situación }
            // reset(archivo);
            // rewrite(archivo);
        end;
    
    begin
        asignar(archivo);
        conectar(archivo);
    end;

    procedure procesar(var archivo: { tipoDeArchivo });
    begin
        {
            Aquí va a ir el código que 
            procese el/los archivos, esta parte
            es completamente dependiente del 
            ejercicio que toque hacer
        }
    end;

    procedure cerrar(var archivo: { tipoDeArchivo });
    begin
        close(archivo);
    end;

begin
    inicializar(archivo);
    procesar(archivo);
    cerrar(archivo);
end;