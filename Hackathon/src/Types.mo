import HashMap "mo:base/HashMap";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Map "mo:map/Map";

module Variables {
    // ESPACIO PARA CREAR VARIABLES //
    public func MateriasCarrera1(): HashMap.HashMap<Text, Nat>{
        let ca1 = HashMap.HashMap<Text, Nat>(10, Text.equal, Text.hash);
        ca1.put("aa", 0);
        ca1.put("ab", 1);
        ca1.put("ac", 2);
        ca1.put("ad", 3);
        ca1.put("ae", 4);
        ca1.put("af", 5);
        ca1.put("ag", 6);
        ca1.put("ah", 7);
        ca1.put("ai", 8);
        ca1.put("aj", 9);
        return ca1;
    };
    public func MateriasCarrera2(): HashMap.HashMap<Text, Nat>{
        let ca2 = HashMap.HashMap<Text, Nat>(10, Text.equal, Text.hash);
        ca2.put("ba", 1);
        ca2.put("bb", 2);
        ca2.put("bc", 3);
        ca2.put("bd", 0);
        ca2.put("be", 4);
        ca2.put("bf", 5);
        ca2.put("bg", 6);
        ca2.put("bh", 7);
        ca2.put("bi", 8);
        ca2.put("bj", 9);
        return ca2;
    };
    public func MateriasCarrera3(): HashMap.HashMap<Text, Nat>{
        let ca3 = HashMap.HashMap<Text, Nat>(10, Text.equal, Text.hash);
        ca3.put("ca", 1);
        ca3.put("cb", 1);
        ca3.put("cc", 2);
        ca3.put("cd", 3);
        ca3.put("ce", 4);
        ca3.put("cf", 5);
        ca3.put("cg", 6);
        ca3.put("ch", 7);
        ca3.put("ci", 8);
        ca3.put("cj", 9);
        return ca3;
    };
    
    

    // ESPACIO DE LAS FUNCIONES DEL CANISTER DE ADMINISTRATIVOS //  
    public func CreateData(request: MatriculaRequest): Alumno {
        var data: Alumno = {
            nombreCompleto = request.nombreCompleto;
            carrera = request.carrera;
            generacion = request.generacion;
            historial = [""];
            promedio = 0;
            
        };
        return data;
    };

    public func CrearRecibo(request: PreRecibo, tipo: Text, nombre:Text): Recibo {
        let data: Recibo = {
            tipo = tipo;
            descripcion = request.descripcion;
            matricula = request.matricula;
            nombreCompleto = nombre;
        };
        return data;
    };

    public type GRequest = {
        materias: [Text];
        numeroGrupo: Text;
        carrera: Text;
        alumnos: [Nat];
    };
    public type Materia = {
        nombre: Text;
        valor: Nat;
    }; 
    public type InfoGrupo = {
        materias: [Text];
        alumnos: [Nat];
    };
    public type Grupo = Map.Map<Text, InfoGrupo>;

    public type MatriculaRequest = {
        generacion: Nat;
        nombreCompleto: Text;
        carrera: Text;
    };
    public type Alumno = {
        nombreCompleto: Text;
        carrera:Text;
        historial: [Text];
        promedio: Nat;
    };
    public type PreRecibo = {
        tipo: Nat;
        descripcion: Text;
        matricula: Text;
    };
    public type Recibo = {
        tipo: Text;
        descripcion: Text;
        matricula: Text;
        nombreCompleto: Text;
    };
};
