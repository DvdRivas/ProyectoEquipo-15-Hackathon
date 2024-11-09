// import CanisterAlums "canister:CanisterAlumnos";
// import CanisterMts "canister:CanisterMaestros";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Funciones "../Func";
import Map "mo:map/Map";
import Types "../Types";
import { thash } "mo:map/Map";


actor {
    //          ESPACIO PARA ASIGNAR VARIABLES          //
    var grupos: Map.Map<Text, Types.InfoGrupo> = Map.new<Text, Types.InfoGrupo>();
    var transacciones: Map.Map<Text, Types.Recibo> = Map.new<Text, Types.Recibo>();
    stable var counter_c1: Nat = 0;
    stable var counter_c2: Nat = 0;
    stable var counter_c3: Nat = 0;
    let ca1 = Types.MateriasCarrera1();
    let ca2 = Types.MateriasCarrera2();
    let ca3 = Types.MateriasCarrera3();
    var alumnos = Map.new<Text, Types.Alumno>();
    var alumnos_c1 = Map.new<Text, Types.Alumno>();
    var alumnos_c2 = Map.new<Text, Types.Alumno>();
    var alumnos_c3 = Map.new<Text, Types.Alumno>();
    var numeroTransaccion: Nat = 0;
    
    //          ESPACIO PARA IMPORTAR FUNCIONES DE OTROS CANISTERS          //
    // public func getFromAlums() : async Text {
    //     return await CanisterAlums.getSome();
    // };
    // public func getFromMtos(): async Text {
    //     return await CanisterMts.getSome()
    // };

    //         ESPACIO PARA CREAR FUNCIONES PROPIAS DEL CANISTER            //
    public func CrearGrupo(request: Types.GRequest): async Text {
        if (Funciones.ValidarCarrera(request.carrera)) {
            return "Error!. Favor de escribir la carrera nuevamente e intentar de nuevo";
        } else {
            switch (request.carrera) {
            case ("carrera1"){
                if (Funciones.ValidarMateria(request.materias, ca1)) {
                // CREAR FUNCION PARA AGREGAR LOS GRUPOS A UN MAP
                let info: Types. InfoGrupo = {
                    materias = request.materias;
                    alumnos = request.alumnos;
                };
                Map.set(grupos, thash, request.numeroGrupo, info);
                } else {
                return "Error!. Una materia esta mal escrita favor de escribir la carrera nuevamente e intentar de nuevo";
                };
                return "Grupo " # request.numeroGrupo # " Registrado Exitosamente en la carrera 1!"
            };
            case ("carrera2"){
                if (Funciones.ValidarMateria(request.materias, ca2)) {
                // CREAR FUNCION PARA AGREGAR LOS GRUPOS A UN MAP
                let info: Types. InfoGrupo = {
                    materias = request.materias;
                    alumnos = request.alumnos;
                };
                Map.set(grupos, thash, request.numeroGrupo, info);
                } else {
                return "Error!. Una materia esta mal escrita favor de escribir la carrera nuevamente e intentar de nuevo";
                };
                return "Grupo " # request.numeroGrupo # " Registrado Exitosamente en la carrera 2!"
            };
            case ("carrera3") {
                if (Funciones.ValidarMateria(request.materias, ca3)) {
                // CREAR FUNCION PARA AGREGAR LOS GRUPOS A UN MAP
                let info: Types. InfoGrupo = {
                    materias = request.materias;
                    alumnos = request.alumnos;
                };
                Map.set(grupos, thash, request.numeroGrupo, info);
                } else {
                return "Error!. Una materia esta mal escrita favor de escribir la carrera nuevamente e intentar de nuevo";
                };
                return "Grupo " # request.numeroGrupo # " Registrado Exitosamente en la carrera 3!"
            };
            case _ {
                return "Encontraste un bug"
            };
            };
        };
        };


    public func GenerarMatricula(request: Types.MatriculaRequest): async Text{
        let initial: Text = Nat.toText(request.generacion%2000%100);
        switch (request.carrera) {
            case ("carrera1") {
                counter_c1 += 1;
                let matricula: Text = initial # "01" # Funciones.GetPadding(counter_c1);
                Map.set(alumnos_c1, thash, matricula, Types.CreateData(request));
                Map.set(alumnos, thash, matricula, Types.CreateData(request));
                return matricula;
            };
            case ("carrera2"){
                counter_c2 += 1;
                let matricula: Text = initial # "02" # Funciones.GetPadding(counter_c2);
                Map.set(alumnos_c2, thash, matricula, Types.CreateData(request));
                Map.set(alumnos, thash, matricula, Types.CreateData(request));
                return matricula;
            };
            case ("carrera3"){
                counter_c3 += 1;
                let matricula: Text = initial # "03" # Funciones.GetPadding(counter_c3);
                Map.set(alumnos_c3, thash, matricula, Types.CreateData(request));
                Map.set(alumnos, thash, matricula, Types.CreateData(request));
                return matricula;
            };
            case (_) {
            return "Error, carrera no valida"
            };
        };
    };
    public query func InfoAlumno(matricula: Text): async ?Types.Alumno {
        return Map.get(alumnos, thash, matricula);
    };
    public func Transaccion(data: Types.PreRecibo): async Text{
        numeroTransaccion += 1;
        let nombre = Funciones.ObtenerNombre(data.matricula, alumnos);
        switch (nombre) {
            case (null) {
                return "Error: No se pudo obtener el nombre del alumno. Corrige la matricula e intentalo nuevamente";
            };
            case (?nombreEncontrado) {
                if (nombre == null) {
                    return "Error: No se pudo obtener el nombre del alumno. Corrige la matricula e intentalo nuevamente";
        }; 
                switch (data.tipo) {
                    case 1 { // Solicitud de una constancia de estudios

                        let recibo: Types.Recibo = Types.CrearRecibo(data, "Solicitud de una constancia de estudios", nombreEncontrado);
                        Map.set(transacciones, thash, Nat.toText(numeroTransaccion), recibo);
                        return "Transaccion creada, pasa a pagar $50 a caja con la referencia #" # Nat.toText(numeroTransaccion);
                    };
                    case 2 { // Solicitud de un historial academico
                        return "Transaccion creada, pasa a pagar $50 a caja con la referencia #" # Nat.toText(numeroTransaccion);
                    };
                    case 3 { // Pago por una materia reprobada 
                        return "Transaccion creada, pasa a pagar $100 a caja con la referencia #" # Nat.toText(numeroTransaccion);
                    };
                    case _ {
                        numeroTransaccion -= 1;
                        return "Concepto no valido, intenta nuevamente";
                    };
                };
            };
        }; 
    };
    public func VerTransaccion(id:Text): async ?Types.Recibo {
        return Map.get(transacciones, thash, id);
    };       
};
