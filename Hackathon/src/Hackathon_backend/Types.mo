import HashMap "mo:base/HashMap";
import Text "mo:base/Text";
import Map "mo:map/Map";


module Variables {
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
};