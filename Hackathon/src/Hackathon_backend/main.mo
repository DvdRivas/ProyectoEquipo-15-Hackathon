import HashMap "mo:base/HashMap";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Funciones "Func";
import Map "mo:map/Map";
import Types "Types";
import { thash } "mo:map/Map";
actor {
  
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

let ca2 = HashMap.HashMap<Text, Nat>(10, Text.equal, Text.hash);
ca2.put("ba", 1);// Sistemas
ca2.put("bb", 2);
ca2.put("bc", 3);
ca2.put("bd", 0);
ca2.put("be", 4);
ca2.put("bf", 5);
ca2.put("bg", 6);
ca2.put("bh", 7);
ca2.put("bi", 8);
ca2.put("bj", 9);

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


var grupos: Map.Map<Text, Types.InfoGrupo> = Map.new<Text, Types.InfoGrupo>();
stable var counter_c1: Nat = 0;
stable var counter_c2: Nat = 0;
stable var counter_c3: Nat = 0;

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
        return "Grupo " # request.numeroGrupo # " Registrado Exitosamente en la carrera 2!"
      };
      case ("carrera3") {
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
      return initial # "01" # Funciones.GetPadding(counter_c1);
    };
    case ("carrera2"){
      counter_c2 += 1;
      return initial # "02" # Funciones.GetPadding(counter_c2);
    };
    case ("carrera3"){
      counter_c3 += 1;
      return initial # "03" # Funciones.GetPadding(counter_c3);

    };
    case (_) {
      return "Error, carrera no valida"
    };
  };

};

 
};
