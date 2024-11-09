import CanisterAdmins "canister:CanisterAdmins";
import Types "../Types";

actor {
    public func InformacionDelAlumno(matricula: Text): async ?Types.Alumno {
        let info =  await CanisterAdmins.InfoAlumno(matricula);
        return  info;
    };
};