import Types "../Types";
import CanisterAdmins "canister:CanisterAdmins";


actor {
     public func GenerarTransaccion(data: Types.PreRecibo): async Text {
        return await CanisterAdmins.Transaccion(data);
    };
    public func Informacion(matricula: Text): async ?Types.Alumno {
        let info =  await CanisterAdmins.InfoAlumno(matricula);
        return  info;
    };
};