import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';
import type { IDL } from '@dfinity/candid';

export interface Alumno {
  'historial' : Array<string>,
  'nombreCompleto' : string,
  'carrera' : string,
  'promedio' : bigint,
}
export interface _SERVICE {
  'InformacionDelAlumno' : ActorMethod<[string], [] | [Alumno]>,
}
export declare const idlFactory: IDL.InterfaceFactory;
export declare const init: (args: { IDL: typeof IDL }) => IDL.Type[];
