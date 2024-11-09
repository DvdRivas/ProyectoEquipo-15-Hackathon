import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';
import type { IDL } from '@dfinity/candid';

export interface Alumno {
  'historial' : Array<string>,
  'nombreCompleto' : string,
  'carrera' : string,
  'promedio' : bigint,
}
export interface GRequest {
  'alumnos' : Array<bigint>,
  'numeroGrupo' : string,
  'carrera' : string,
  'materias' : Array<string>,
}
export interface MatriculaRequest {
  'generacion' : bigint,
  'nombreCompleto' : string,
  'carrera' : string,
}
export interface PreRecibo {
  'tipo' : bigint,
  'descripcion' : string,
  'matricula' : string,
}
export interface Recibo {
  'tipo' : string,
  'descripcion' : string,
  'nombreCompleto' : string,
  'matricula' : string,
}
export interface _SERVICE {
  'CrearGrupo' : ActorMethod<[GRequest], string>,
  'GenerarMatricula' : ActorMethod<[MatriculaRequest], string>,
  'InfoAlumno' : ActorMethod<[string], [] | [Alumno]>,
  'Transaccion' : ActorMethod<[PreRecibo], string>,
  'VerTransaccion' : ActorMethod<[string], [] | [Recibo]>,
}
export declare const idlFactory: IDL.InterfaceFactory;
export declare const init: (args: { IDL: typeof IDL }) => IDL.Type[];
