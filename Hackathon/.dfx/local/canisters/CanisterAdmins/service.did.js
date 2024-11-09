export const idlFactory = ({ IDL }) => {
  const GRequest = IDL.Record({
    'alumnos' : IDL.Vec(IDL.Nat),
    'numeroGrupo' : IDL.Text,
    'carrera' : IDL.Text,
    'materias' : IDL.Vec(IDL.Text),
  });
  const MatriculaRequest = IDL.Record({
    'generacion' : IDL.Nat,
    'nombreCompleto' : IDL.Text,
    'carrera' : IDL.Text,
  });
  const Alumno = IDL.Record({
    'historial' : IDL.Vec(IDL.Text),
    'nombreCompleto' : IDL.Text,
    'carrera' : IDL.Text,
    'promedio' : IDL.Nat,
  });
  const PreRecibo = IDL.Record({
    'tipo' : IDL.Nat,
    'descripcion' : IDL.Text,
    'matricula' : IDL.Text,
  });
  const Recibo = IDL.Record({
    'tipo' : IDL.Text,
    'descripcion' : IDL.Text,
    'nombreCompleto' : IDL.Text,
    'matricula' : IDL.Text,
  });
  return IDL.Service({
    'CrearGrupo' : IDL.Func([GRequest], [IDL.Text], []),
    'GenerarMatricula' : IDL.Func([MatriculaRequest], [IDL.Text], []),
    'InfoAlumno' : IDL.Func([IDL.Text], [IDL.Opt(Alumno)], ['query']),
    'Transaccion' : IDL.Func([PreRecibo], [IDL.Text], []),
    'VerTransaccion' : IDL.Func([IDL.Text], [IDL.Opt(Recibo)], []),
  });
};
export const init = ({ IDL }) => { return []; };
