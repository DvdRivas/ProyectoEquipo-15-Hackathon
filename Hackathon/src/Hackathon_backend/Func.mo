import Text "mo:base/Text";
import Array "mo:base/Array";
import HashMap "mo:base/HashMap";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Map "mo:map/Map";


module Funciones {
    public func CleanText(text: Text): Text {
        return Text.trim(Text.toLowercase(text), #char ' ');
    };
    public func ValidarCarrera(car: Text): Bool {
        let carrera: Text = CleanText(car);
        let carreras: [Text] = ["carrera1", "carrera2", "carrera3"];
        for (cont in carreras.vals()) {
           if (cont == carrera){
            return false;
           };
        };
        return true;
    };
    public func ValidarMateria(materias:[Text], map: HashMap.HashMap<Text, Nat>): Bool {
        for (materia in materias.vals()) {
            if (map.get(materia) == null) {
                Debug.print("La materia: "# materia # " no existe, favor de corregir el error e intentarlo nuevamente");
                return false;
            };
        };
        return true;
    };
    public func GetPadding(counter: Nat): Text{
    let counterText = Nat.toText(counter);
      let padding = 4 - counterText.size();
      var i: Nat = 0;
      var zeroPadding: Text = "";
      while (i < padding) {
        zeroPadding #= "0";
        i += 1;
      };
    return zeroPadding # counterText;
    };

};