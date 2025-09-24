import { AbstractControl, ValidationErrors, ValidatorFn } from "@angular/forms";
export interface Inmueble {
    id: number
    folio_matricula: string,
    id_subtipo: number,
    id_sucursal: number,
    area_terreno: number,
    area_construida ?: number,
    Direccion: string,
    // Departamento: string, // TOCA DESGLOZAR
    id_municipio: number,
    id_estado_ocupacion: number;
    precio: number;
    descripcion: string,
    link_comercializacion : string ,
    estadoRegistro: number,
    fotos: string[];
}
export enum Estado_ocupacion {
    Desocupado = 'Desocupado',
    Arrendando = 'Arrendando',
    Ocupado = 'Ocupado',
}

export enum Municipio {
    bogotaDC = 'Bogota D.C',
    Medellin = 'Medellín'

}

export  enum Subtipo {
    Finca = 'Finca',
    Apartamento = 'Apartamento',
    Local_Comercial = 'Local Comercial',
    Habitación_hotel = 'Habitación hotel',
    Casa = 'Casa',
    Bodega = 'Bodega',
    Garaje = 'Garaje',
    Hotel_motel = 'Hotel_motel',
    Parqueadero_comercial = 'Parqueadero comercial',
    Lote = 'Lote',
    Edificacion_para_hotel = 'Edificacion para hotel',
    Oficina = 'Oficina',
    Edificio = 'Edificio',
    Parqueadero_privado = 'Parqueadero privado',
    Casa_recreo = 'Casa_recreo',
    Apartaestudio = 'Apartaestudio',
    Casa_lote = 'Casa lote',
    Centro_industrial = 'Centro industrial'
}

export enum Sucursal {
    DIRECCION_TERRITORIAL_CARIBE = 'DIRECCION TERRITORIAL CARIBE',
    DIRECCION_TERRITORIAL_CENTRO_ORIENTE = 'DIRECION TERRITORIAL CENTRO ORIENTE',
    DIRECCION_TERRITORIAL_SUROCCIDENTE = 'DIRECCION TERRITORIAL SUROCCIDENTE',
    DIRECCION_TERRITORIAL_OCCIDENTE = 'DIRECCION TERRITORIAL OCCIDENTE',
} 





export function noCaracteresEspeciales(control: AbstractControl): ValidationErrors | null {
  const valor = control.value?.trim();
  const regex = /^[a-zA-Z0-9\s]+$/; // Solo letras, números y espacios, al menos uno

  if (valor && !regex.test(valor)) {
    console.log('verdadero')
    console.log(valor, regex)
    return { caracteresEspeciales: true };
  }

  return null;
}



export function soloNumerosYGuion(control: AbstractControl): ValidationErrors | null {
  const valor = control.value;
  const regex = /^[0-9\-]+$/; // Solo números y guiones

  if (valor && !regex.test(valor)) {
    return { caracteresInvalidos: true };
  }

  return null;
}
export function numeroValido(control: AbstractControl): ValidationErrors | null {
  const valor = control.value;

  if (valor === null || valor === undefined) return null;

  const valorStr = valor.toString();

  if (valorStr === '0') return null;

  if (/^0\d+/.test(valorStr) || Number(valor) < 0) {
    return { numeroInvalido: true };
  }

  return null;
}





