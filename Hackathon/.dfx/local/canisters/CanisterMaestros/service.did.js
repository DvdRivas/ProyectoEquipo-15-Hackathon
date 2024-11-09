export const idlFactory = ({ IDL }) => {
  const Alumno = IDL.Record({
    'historial' : IDL.Vec(IDL.Text),
    'nombreCompleto' : IDL.Text,
    'carrera' : IDL.Text,
    'promedio' : IDL.Nat,
  });
  return IDL.Service({
    'InformacionDelAlumno' : IDL.Func([IDL.Text], [IDL.Opt(Alumno)], []),
  });
};
export const init = ({ IDL }) => { return []; };
