
export function obtenerSubtipoInmueble(id: number): string {
  const subtipos: { [key: number]: string } = {
    1: 'Finca',
    2: 'Apartamento',
    3: 'Local comercial',
    4: 'Habitación hotel',
    5: 'Casa',
    6: 'Bodega',
    7: 'Garaje',
    8: 'Hotel motel',
    9: 'Lote',
    10: 'Edificación para hotel',
    11: 'Oficina',
    12: 'Edificio',
    13: 'Parqueadero privado',
    14: 'Casa recreo',
    15: 'Apartaestudio',
    16: 'Centro industrial'
  };

  return subtipos[id] || 'Subtipo no encontrado';
}

export function obtenerDireccionTerritorial(id: number): string {
  switch (id) {
    case 1:
      return 'Dirección Territorial Caribe';
    case 2:
      return 'Dirección Territorial Centro Oriente';
    case 3:
      return 'Dirección Territorial Suroccidente';
    case 4:
      return 'Dirección Territorial Occidente';
    default:
      return 'Dirección no encontrada';
  }
}