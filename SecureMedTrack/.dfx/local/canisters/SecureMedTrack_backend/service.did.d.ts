import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';
import type { IDL } from '@dfinity/candid';

export type Date = string;
export interface Fields {
  'patientBirthDate' : string,
  'patientFullName' : string,
  'patientDiagnosis' : string,
}
export type GetAllData = Array<[Date, Record]>;
export interface GetSingleData {
  'patientAge' : bigint,
  'patientBirthDate' : string,
  'patientFullName' : string,
  'patientDiagnosis' : string,
}
export interface Record {
  'patientAge' : bigint,
  'patientBirthDate' : string,
  'patientFullName' : string,
  'patientDiagnosis' : string,
}
export interface RequestDate {
  'date' : string,
  'patientBirthDate' : string,
  'patientFullName' : string,
}
export interface RequestID {
  'patientBirthDate' : string,
  'patientFullName' : string,
}
export interface _SERVICE {
  'ActualDate' : ActorMethod<[], string>,
  'GetDataByDate' : ActorMethod<[RequestDate], [] | [GetSingleData]>,
  'GetMedicalData' : ActorMethod<[RequestID], [] | [GetAllData]>,
  'updateMedicalData' : ActorMethod<[Fields], string>,
}
export declare const idlFactory: IDL.InterfaceFactory;
export declare const init: (args: { IDL: typeof IDL }) => IDL.Type[];
