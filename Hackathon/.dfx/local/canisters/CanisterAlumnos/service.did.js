export const idlFactory = ({ IDL }) => {
  const PreRecibo = IDL.Record({
    'tipo' : IDL.Nat,
    'descripcion' : IDL.Text,
    'matricula' : IDL.Text,
  });
  const Alumno = IDL.Record({
    'historial' : IDL.Vec(IDL.Text),
    'nombreCompleto' : IDL.Text,
    'carrera' : IDL.Text,
    'promedio' : IDL.Nat,
  });
  return IDL.Service({
    'GenerarTransaccion' : IDL.Func([PreRecibo], [IDL.Text], []),
    'Informacion' : IDL.Func([IDL.Text], [IDL.Opt(Alumno)], []),
  });
};
export const init = ({ IDL }) => { return []; };
