import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { InmuebleService } from '../Services/inmuebleService';
import { Inmueble } from '../inmueble';
import { CommonModule } from '@angular/common';


@Component({
  selector: 'app-inmueble-individual-presentacion',
  imports: [CommonModule],
  templateUrl: './inmueble-individual-presentacion.html',
  styleUrl: './inmueble-individual-presentacion.css'

}) 


export class InmuebleIndividualPresentacion implements OnInit {

  // public baseUrl = environmentConfig.localhost
  public baseUrl : any
    subtipos: any[] = [];
  // public baseurl = environment.config.localhost
  inmueble: Inmueble | undefined;
  departamento: string = '';
  municipio: string = '';
  municipios: any[] = [];
  Ocupacion: any[] = [];
  listaInmuebles: Inmueble[] = [];
  constructor(
    private route: ActivatedRoute,
    private inmuebleServicio: InmuebleService,
    
  ) {

       this.baseUrl = inmuebleServicio.localhostConfig


  }

  //   this.inmuebleService.getInmuebles().subscribe({
  //   next: (data) => {
  //     this.inmuebles = data;

  //     this.inmuebles.forEach((inmueble) => {
  //       this.inmuebleService.getFotos(inmueble.id).subscribe({
  //         next: (fotos) => {
  //           // Mapear solo los valores de url_foto
  //           inmueble.fotos = fotos.map(f => f.foto_url);
  //           console.log('Inmuebles:', this.inmuebles);
  //         },
  //         error: (err) => {
  //           console.error(`Error al obtener fotos del inmueble ${inmueble.id}`, err);
  //         }
  //       });
  //     });
  //   },
  //   error: (err) => {
  //     console.error('Error al obtener los inmuebles', err);
  //   }


  // }

  ngOnInit() {
    this.inmuebleServicio.getMunicipios().subscribe(data => {
      this.municipios = data;
    })
    this.inmuebleServicio.getSubtipo().subscribe(data => {
      this.subtipos = data;
    })
    const id = Number(this.route.snapshot.paramMap.get('id'));

    this.inmuebleServicio.getInmuebles().subscribe(data => {
      this.listaInmuebles = data;
      this.inmueble = this.listaInmuebles.find(i => i.id === id);
      this.inmuebleServicio.getFotos(id).subscribe({
        next: (fotos) => {
          // Mapear solo los valores de url_foto
          this.inmueble!.fotos = fotos.map(f => encodeURI(f.foto_url));

        },
        error: (err) => {
          console.error(`Error al obtener fotos del inmueble ${id}`, err);
        }
      });
    });
    









    // if (this.inmueble) {
    //   const precioFormateado = this.copCurrencyPipe.transform(this.inmueble.Precio);
    //   console.log('Precio formateado:', precioFormateado);
    // }
  }

  obtenerNombreDepartamento(idMunicipio: number | undefined): string {
    if (idMunicipio === undefined || idMunicipio === null) {
      return '$0'; // o puedes retornar una cadena vacía '', 'N/A', etc.
    }
    this.inmuebleServicio.getDepartamento(idMunicipio).subscribe(response => {
      // Si el servicio devuelve un array con un solo objeto
      this.departamento = response[0].nombre;
    });
    return this.departamento

  }

  obtenerDireccionTerritorial(id: number | undefined ): string {
    if (id === undefined || id === null) {
      return '$0'; // o puedes retornar una cadena vacía '', 'N/A', etc.
    }
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
  ObtenerEstadoOcupacion (id: number | undefined ) : string {

     if (id === undefined || id === null) {
      return '$0'; // o puedes retornar una cadena vacía '', 'N/A', etc.
    }

    switch(id){
      case 1 :
        return 'Desocupado'
      case 2: 
       return 'Arrendando'
      case 3:
       return 'Ocupado'
      default:
      return 'Estado ocupacion no encontrada'
    }
  }

  formatearPrecio(precio: number | undefined): string {
    if (precio === undefined || precio === null) {
      return '$0'; // o puedes retornar una cadena vacía '', 'N/A', etc.
    }
    return new Intl.NumberFormat('es-CO', {
      style: 'currency',
      currency: 'COP',
      minimumFractionDigits: 0
    }).format(precio);
  }
  formatearTitulo(texto: string): string {
    return texto
      .toLowerCase()
      .split(' ')
      .map(palabra => palabra.charAt(0).toUpperCase() + palabra.slice(1))
      .join(' ');
  }
  getNombreMunicipio(id: number | undefined): string {
    if (id === undefined || id === null) {
      return '$0'; // o puedes retornar una cadena vacía '', 'N/A', etc.
    }
    const municipio = this.municipios.find(m => m.id === id);
    return municipio ? municipio.municipio : 'Desconocido';
  }





   obtenerSubtipoInmueble(id: any): string {
    const subtipo = this.subtipos.find(m => m.id === id);
    return subtipo ? subtipo.nombre : 'Subtipo no encontrado'
  }


  // formatearPrecio(precio: number): string {
  //   return new Intl.NumberFormat('es-CO', {
  //     style: 'currency',
  //     currency: 'COP',
  //     minimumFractionDigits: 0
  //   }).format(precio);
  // }
 encodeFilenameParens(path: string): string {
    const parts = path.split('/');
    const filename = parts.pop();

    // Solo reemplaza paréntesis, no codifica todo
    const encodedFilename = filename
      ?.replace(/\(/g, '%28')
      ?.replace(/\)/g, '%29');

    return [...parts, encodedFilename].join('/');
  }







}
