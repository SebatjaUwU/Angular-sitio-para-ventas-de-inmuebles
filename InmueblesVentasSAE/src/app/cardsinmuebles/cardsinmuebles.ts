import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, NgControl, NgModel, ReactiveFormsModule } from '@angular/forms';
import { InmuebleService } from '../Services/inmuebleService';
import { RouterLink } from '@angular/router';
import { Inmueble } from '../inmueble';
import { CopCurrencyPipe } from '../pipes/op-currency.pipe';

// @Pipe({
//   name: 'copCurrency'
// })

@Component({
  selector: 'app-cardsinmuebles',
  imports: [CommonModule, ReactiveFormsModule, RouterLink, CopCurrencyPipe, FormsModule],
  template: `
   <div class="container">

    <h2 class="text-center" style="color: #6E1978">Lista de Inmuebles</h2>
    
    <div class="row mb-4">
  <!-- Municipio -->
  <div class="col-md-3">
    <label for="municipio">Municipio:</label>
    <select id="municipio" class="form-select" [(ngModel)]="municipioSeleccionado" (change)="currentPage = 1">
      <option value="">Todos</option>
      <option *ngFor="let m of municipiosUnicos" [value]="m">{{ m }}</option>
    </select>
  </div>

  <!-- Tipo -->
  <div class="col-md-3">
    <label for="tipo">Tipo de inmueble:</label>
    <select id="tipo" class="form-select" [(ngModel)]="tipoSeleccionado" (change)="currentPage = 1">
      <option value="">Todos</option>
      <option *ngFor="let t of tiposUnicos" [value]="t">{{ t }}</option>
    </select>
  </div>

  <!-- Búsqueda -->
  <div class="col-md-3">
    <label for="busqueda">Buscar:</label>
    <input id="busqueda" type="text" class="form-control" [(ngModel)]="textoBusqueda" (input)="currentPage = 1" placeholder="Dirección o descripción">
  </div>

  <!-- Precio -->
  <div class="col-md-3">
    <label>Precio (COP):</label>
    <div class="d-flex gap-2">
      <input type="number" class="form-control" [(ngModel)]="precioMinimo" (input)="currentPage = 1" placeholder="Mínimo">
      <input type="number" class="form-control" [(ngModel)]="precioMaximo" (input)="currentPage = 1" placeholder="Máximo">
    </div>
  </div>
</div>

<!-- Botón limpiar -->
<div class="mb-3 text-end">
  <button class="btn btn-secondary" (click)="limpiarFiltros()">Limpiar filtros</button>
</div>



    <div class="row ">
       <div *ngFor="let inmueble of inmueblesPaginados; let i = index" class="col col-sm-12 col-lg-4 mt-3 ">

         <div class="card h-100" style="width: 100%; margin-bottom:10px">
                <div class="card-header"
                    style="width: 100%; background-color: #6E1978 ; color: white; text-align: center;">
                    <h5>{{ obtenerSubtipoInmueble(inmueble.id_subtipo) }} - {{ inmueble.folio_matricula }}</h5>
                </div>



                <div *ngIf="inmueble.fotos && inmueble.fotos.length > 0"  [ngStyle]="{ 'background-image': 'url(' + this.basImage + '/' +  encodeFilenameParens(inmueble.fotos[0]) + ')',   }" class="div_image">

              </div>
                
                <div class="card-body d-flex flex-column">
                    <h5 style="text-align: center;">
                        <strong>{{ obtenerDireccionTerritorial(inmueble.id_sucursal)}} </strong>
                    </h5>
                    <h5 class="card-title">    <strong style="color: #6e1978">{{ inmueble.precio | copCurrency }} </strong></h5>
                    <h6 class="card-text mt-1">{{ truncateText(inmueble.descripcion)}}  <a class="color" [routerLink]="['/inmueble', inmueble.id]">
          Ver mas 
        </a>
        <!-- 67 -->

                    </h6>

                    <a [href]="inmueble.link_comercializacion"> {{inmueble.link_comercializacion}}</a>

                    

                    <div class="mt-1" style="display: flex;flex-direction: column; ">

                        <!-- Una condicion para que no aparezca -->

                        <div class="mt-1">
                            <div style="display: none;">
                                <!-- XD --> Crear otro componentente si es necesario
                            </div>
                            @if (inmueble.area_terreno !== 0) {
                              <div >
  <img src="Icons/area.png" width="28px" height="28px" alt="">
                            Área Terreno {{ inmueble.area_terreno}}mts²
                             </div>

                            }
                            <!-- Condicionar aca mismo : -->
                             
                          
                        </div>
                        @if(inmueble.area_construida !== 0){
                             <div >
  <img src="Icons/Building.png" width="28px" height="28px" alt="">
                            Área Construida {{ inmueble.area_construida}}mts²
                             </div>
                          

                        }

                        <div class="mt-1">
                          <!-- <div >
                                 <img src="Icons/Building.png" width="28px" height="28px" alt="">
                            Area Construida {{ inmueble.Area_Construida}} mts²
                          </div>
                        -->
                        </div>
                        <div class="mt-1">
                            <!-- {{obtenerNombreMunicipio(inmueble.id_muni)}} -->
                        </div>
                        <div class="mt-1">
                            <img src="Icons/location.png" width="28px" height="28px" alt="">

                          {{this.getNombreMunicipio(inmueble.id_municipio)}} ,
                          {{inmueble.Direccion}} 
                    
                        </div>



                    </div>
                    <div class="btn-group mt-auto " role="group" aria-label="Basic outlined example">
                        <!-- <a [routerLink]="['/inmueble', inmueble.id]">
                            Ver inmueble {{ inmueble.FMI }}
                        </a> -->

                         <a class="btn  btn-custom-outline" [routerLink]="['/inmueble', inmueble.id]">
          Ver inmueble 
        </a>
                    </div>

                </div>
            </div>
      </div>
      

    </div>
    <div class="pagination-controls text-center mt-4">
  <button class="btn btn-outline-secondary me-2" (click)="prevPage()" [disabled]="currentPage === 1">
    ← Anterior
  </button>

  <ng-container *ngFor="let page of getPageNumbers()">
    <button class="btn btn-outline-primary mx-1" [class.active]="page === currentPage" (click)="goToPage(page)">
      {{ page }}
    </button>
  </ng-container>

  <button class="btn btn-outline-secondary ms-2" (click)="nextPage()" [disabled]="currentPage === totalPages">
    Siguiente →
  </button>

  total inmuebles {{inmuebles.length  }}
</div>


   </div>

     
    <!-- <ul>
      <li *ngFor="let inmueble of inmuebles">
        <a [routerLink]="['/inmueble', inmueble.id]">
          xd
        </a>
      </li>
    </ul> -->
  `,
  styleUrl: './cardsinmuebles.css'
})

export class Cardsinmuebles {
  // public baseUrl = environmentConfig.localhost
  public baseUrl: any
  public basImage: any
  municipios: any[] = [];
  subtipos: any[] = [];
  currentPage: number = 1;
  itemsPerPage: number = 30;
  textoBusqueda: string = '';
  precioMinimo: number | null = null;
  precioMaximo: number | null = null;


  municipioSeleccionado: string = '';
  tipoSeleccionado: string = '';



  // this.http.get(`${config.baseUrl}/inmueble`);

  inmuebles: Inmueble[] = [];

  constructor(private inmuebleService: InmuebleService) {

    this.basImage = inmuebleService.localhostConfig




    this.inmuebleService.getInmuebles().subscribe({

      next: (data) => {
        this.inmuebles = data;

        this.inmuebles.forEach((inmueble) => {


          this.inmuebleService.getFotos(inmueble.id).subscribe({
            next: (fotos) => {

              // Mapear solo los valores de url_foto
              inmueble.fotos = fotos.map(f => encodeURI(f.foto_url));
              console.log(inmueble)

            },
            error: (err) => {
              console.error(`Error al obtener fotos del inmueble ${inmueble.id}`, err);
            }

          });

        });
      },
      error: (err) => {
        console.error('Error al obtener los inmuebles', err);
      }


    }




    );


    // ngogi() {
    //   this.tuServicio.getMunicipios().subscribe(data => {
    //     this.municipios = data;
    //   });
    // }
    this.inmuebleService.getMunicipios().subscribe(data => {
      this.municipios = data;
    })
    this.inmuebleService.getSubtipo().subscribe(data => {
      this.subtipos = data;
    })


  }
  formatearPrecio(precio: number): string {
    return new Intl.NumberFormat('es-CO', {
      style: 'currency',
      currency: 'COP',
      minimumFractionDigits: 0
    }).format(precio);
  }

  get inmueblesPaginados(): Inmueble[] {
    const startIndex = (this.currentPage - 1) * this.itemsPerPage;
    const endIndex = startIndex + this.itemsPerPage;
    return this.inmueblesFiltrados.slice(startIndex, endIndex);
  }

  get totalPages(): number {
    return Math.ceil(this.inmueblesFiltrados.length / this.itemsPerPage);
  }


  prevPage() {
    if (this.currentPage > 1) {
      this.currentPage--;
    }
  }

  nextPage() {
    if (this.currentPage < this.totalPages) {
      this.currentPage++;
    }
  }

  goToPage(page: number) {
    this.currentPage = page;
  }

  getPageNumbers(): number[] {
    return Array.from({ length: this.totalPages }, (_, i) => i + 1);

  }


  // Filtrado
  get inmueblesFiltrados(): Inmueble[] {
    return this.inmuebles.filter(inmueble => {
      const coincideMunicipio = this.municipioSeleccionado === '' || this.getNombreMunicipio(inmueble.id_municipio) === this.municipioSeleccionado;
      const coincideTipo = this.tipoSeleccionado === '' || this.obtenerSubtipoInmueble(inmueble.id_subtipo) === this.tipoSeleccionado;
      const coincideTexto = this.textoBusqueda === '' || (
        inmueble.Direccion?.toLowerCase().includes(this.textoBusqueda.toLowerCase()) ||
        inmueble.descripcion?.toLowerCase().includes(this.textoBusqueda.toLowerCase())
      );
      const coincidePrecioMin = this.precioMinimo === null || inmueble.precio >= this.precioMinimo;
      const coincidePrecioMax = this.precioMaximo === null || inmueble.precio <= this.precioMaximo;

      return coincideMunicipio && coincideTipo && coincideTexto && coincidePrecioMin && coincidePrecioMax;
    });
  }

  // get municipiosUnicos(): string[] {
  //   return [...new Set(this.inmuebles.map(i => i.Municipio))];
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






  get municipiosUnicos(): string[] {
    return [...new Set(this.inmuebles.map(i => this.getNombreMunicipio(i.id_municipio)).filter(m => m))];
  }
  get tiposUnicos(): string[] {
    return [...new Set(this.inmuebles.map(i => this.obtenerSubtipoInmueble(i.id_subtipo)))];
  }


  limpiarFiltros(): void {
    this.municipioSeleccionado = '';
    this.tipoSeleccionado = '';
    this.textoBusqueda = '';
    this.precioMinimo = null;
    this.precioMaximo = null;
    this.currentPage = 1;
  }



  obtenerNombreDepartamento(idMunicipio: number): any {
    this.inmuebleService.getDepartamento(idMunicipio).subscribe(response => {
      // Si el servicio devuelve un array con un solo objeto
      return response[0].nombre;
    });
  }

  // getNombreMunicipio(id: number): string {
  //   const municipio = this.inmuebleService.getMunicipios.find(m => m.id === id);
  //   return municipio ? municipio.municipio : 'Desconocido';
  // }



  getNombreMunicipio(id: number): string {
    const municipio = this.municipios.find(m => m.id === id);
    return municipio ? municipio.municipio : 'Desconocido';
  }

  //   getNombreMunicipio(id: number): string {
  //   const municipio = this.municipios.find(m => m.id === id);
  //   return municipio ? municipio.municipio : 'Desconocido';
  // }



  obtenerSubtipoInmueble(id: number): string {
    const subtipo = this.subtipos.find(m => m.id === id);
    return subtipo ? subtipo.nombre : 'Subtipo no encontrado'
  }
  truncateText(text: string, maxLength: number = 178): string {
    if (!text) return '';
    return text.length > maxLength ? text.substring(0, maxLength) + '(...)' : text;
  }


  obtenerDireccionTerritorial(id: number): string {
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


}


