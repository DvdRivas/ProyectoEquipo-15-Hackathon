export const idlFactory = ({ IDL }) => {
  const RequestDate = IDL.Record({
    'date' : IDL.Text,
    'patientBirthDate' : IDL.Text,
    'patientFullName' : IDL.Text,
  });
  const GetSingleData = IDL.Record({
    'patientAge' : IDL.Nat,
    'patientBirthDate' : IDL.Text,
    'patientFullName' : IDL.Text,
    'patientDiagnosis' : IDL.Text,
  });
  const RequestID = IDL.Record({
    'patientBirthDate' : IDL.Text,
    'patientFullName' : IDL.Text,
  });
  const Date = IDL.Text;
  const Record = IDL.Record({
    'patientAge' : IDL.Nat,
    'patientBirthDate' : IDL.Text,
    'patientFullName' : IDL.Text,
    'patientDiagnosis' : IDL.Text,
  });
  const GetAllData = IDL.Vec(IDL.Tuple(Date, Record));
  const Fields = IDL.Record({
    'patientBirthDate' : IDL.Text,
    'patientFullName' : IDL.Text,
    'patientDiagnosis' : IDL.Text,
  });
  return IDL.Service({
    'ActualDate' : IDL.Func([], [IDL.Text], ['query']),
    'GetDataByDate' : IDL.Func(
        [RequestDate],
        [IDL.Opt(GetSingleData)],
        ['query'],
      ),
    'GetMedicalData' : IDL.Func([RequestID], [IDL.Opt(GetAllData)], ['query']),
    'updateMedicalData' : IDL.Func([Fields], [IDL.Text], []),
  });
};
export const init = ({ IDL }) => { return []; };
