import { inject, Injectable, Input, input } from '@angular/core';
import { Estado_ocupacion, Inmueble, noCaracteresEspeciales, numeroValido, soloNumerosYGuion, Subtipo, Sucursal } from '../inmueble';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators, } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environmentConfig } from '../config/enviroment.config';
import { environment } from '../../environments/envoriment.prod';







declare var bootstrap: any;

@Injectable({
  providedIn: 'root'
})

export class InmuebleService {
  inmuebleForm: FormGroup;
  imagePreviews: string[] = [];
  imagePreviewsupdate: string[] = [];
  listaInmuebles: Inmueble[] = [];
  files: FileList | null = null;
  InmuebleIndividual: Inmueble[] = [];
  //http://localhost:3000/api
  private baseUrl : any;
  // private baseUrl = environment.config.baseUrl; // Ajusta si usas otro puerto o dominio


  constructor(private fb: FormBuilder, private http: HttpClient) {

    this.inmuebleForm = this.fb.group({
      id: null,
      FMI: ['', [Validators.required]],
      id_subtipo: [0, [Validators.required]],
      id_sucursal: ['', Validators.required],
      Area_Terreno: [0, [Validators.required, numeroValido]],
      Area_Construida: [0, [Validators.required, numeroValido]],
      Direccion: ['', Validators.required],
      // Departamento: ['', Validators.required],
      id_municipio: ['', Validators.required],
      id_estado_ocupacion: ['', Validators.required],
      Precio: [0, Validators.required],
      Descripcion: ['', Validators.required],
      estadoRegistro: 1,
      fotos: [[]]

    });

    this.getInmuebles().subscribe(data => {


      this.listaInmuebles = data;

    });

   

  

  }

  
  loadConfig() {
    return this.http.get('/assets/config.json')
      .toPromise()
      .then(baseUrl => this.baseUrl = baseUrl);
  }

  get baseUrlConfig() {
    return this.baseUrl?.baseUrl;
  }
  get localhostConfig() {
    return this.baseUrl?.localhost;
  }
  

  getMunicipios(): Observable<any[]> {
    return this.http.get<any[]>(`${this.baseUrlConfig}/municipios`);
  }

  getOcupacion(): Observable<any[]> {
    return this.http.get<any[]>(`${this.baseUrlConfig}/ocupacion`);
  }
  getSubtipo(): Observable<any[]> {
    return this.http.get<any[]>(`${this.baseUrlConfig}/subtipo`);
  }
  getSucursal(): Observable<any[]> {
    return this.http.get<any[]>(`${this.baseUrlConfig}/sucursal`);
  }

  getInmuebles(): Observable<Inmueble[]> {
    return this.http.get<Inmueble[]>(`${this.baseUrlConfig}/inmueble`);
  }

  getFotos(id_inmueble: number): Observable<any[]> {
    return this.http.get<any[]>(`${this.baseUrlConfig}/fotos/${id_inmueble}`);

  }

  getDepartamento(id_municipio: number): Observable<any[]> {
    return this.http.get<any[]>(`${this.baseUrlConfig}/municipios/${id_municipio}`);
  }



  
getInmueblePorId(id: number): Inmueble | undefined {
  return this.listaInmuebles.find(i => i.id === id);
}




  eliminarImagen(index: number, foto: number) {
    console.log(foto)
    console.log("Foto: ", this.listaInmuebles[index - 1].fotos)
    this.listaInmuebles[index - 1].fotos.splice(foto, 1)
  }




  actualizarInmueble(index: number) {
    const inmuebleActualizado = this.inmuebleForm.value as Inmueble;
    for (let i = 0; i < this.imagePreviews.length; i++) {
      // console.log('total', this.imagePreviews.length)
      // console.log('valor obtenido', this.imagePreviews[i])
      inmuebleActualizado.fotos.push(this.imagePreviews[i])
    }
    // console.log(inmueblenuevo)
    // this.listaInmuebles[index - 1]
    // this.listaInmuebles.slice(index - 1, 1, inmueblenuevo )
    this.listaInmuebles[index - 1] = inmuebleActualizado
    this.imagePreviews = []
    this.files = null
    this.resetFormulario()
    this.InmuebleIndividual = [];



  }
  onImagenUploadupdate(event: Event) {
    this.files = (event.target as HTMLInputElement).files;
    console.log(this.files)
    if (this.files) {

      let fileArray: string[] = [];
      for (let file of Array.from(this.files)) {
        let reader = new FileReader();
        reader.onload = () => {
          let result = reader.result as string;
          this.imagePreviews.push(result);
          // console.log(result)

          // fileArray.push(result);
          // this.inmuebleForm.patchValue({ fotos: fileArray });

          // console.log(fileArray)



        };
        reader.readAsDataURL(file);
        // console.log(file)

      }
    }

  }

  //   editarInmueble(index: number): void {
  //   const inmueble = this.listaInmuebles[index];
  //   this.inmuebleForm.patchValue(inmueble);
  //   this.editandoIndex = index; // Guarda índice si estás en modo edición
  // }

  onImageUpload(event: Event): void {
    this.files = (event.target as HTMLInputElement).files;
    console.log(this.files)
    if (this.files) {

      let fileArray: string[] = [];
      for (let file of Array.from(this.files)) {
        let reader = new FileReader();
        reader.onload = () => {
          let result = reader.result as string;
          this.imagePreviews.push(result);
          // console.log(result)

          // fileArray.push(result);
          // this.inmuebleForm.patchValue({ fotos: fileArray });

          // console.log(fileArray)



        };
        reader.readAsDataURL(file);
        // console.log(file)

      }
    }
  }

  editarInmueble(index: number): void {

    console.log(index)
    // console.log(this.imagePreviews)
    console.log(this.listaInmuebles[index - 1])
    this.InmuebleIndividual[0] = this.listaInmuebles[index - 1]
    this.imagePreviews = this.InmuebleIndividual[0].fotos

    console.log('LISTA : ', this.InmuebleIndividual[0])
  }


  public obtenerLista(): Inmueble[] {
    return this.listaInmuebles.filter(inmueble => inmueble.estadoRegistro === 1);
  }
  public obtenerMunicipios(): Inmueble[] {
    return this.listaInmuebles.filter(inmueble => inmueble.estadoRegistro === 1);
  }


  // sacarImagenes(index: number): void {
  //   console.log(this.imagePreviews.splice(index, 1))
  // }

  sacarImagenes(index: number): void {
    if (!this.files) return;

    const dt = new DataTransfer();
    const archivos = Array.from(this.files);

    archivos.forEach((file, i) => {
      if (i !== index) {
        dt.items.add(file); // Agrega todos menos el que se quiere eliminar
      }
    });

    this.files = dt.files;

    // También puedes actualizar las vistas previas si las estás mostrando
    this.imagePreviews.splice(index, 1);
  }



  sacarImagenesLista(index: number): void {
    console.log(this.imagePreviews.splice(index, 1))

  }




  // obtenerImagenes(): imagePreviews[] {
  //   return this.listaInmuebles.filter(inmueble => inmueble.estadoRegistro === 1);
  // }



  eliminarInmueble(index: number): void {
    console.log(index)
    this.InmuebleIndividual[0] = this.listaInmuebles[index - 1]
    // console.log(index)
    // const inmueble = this.listaInmuebles[index - 1]
    // inmueble.estadoRegistro = 0
    // console.log(inmueble)

    // this.listaInmuebles.splice(index,1)

    // this.listaInmuebles.splice(index, 1);
  }

  eliminarInmuebleModal(index: number): void {
    this.listaInmuebles[index - 1].estadoRegistro = 0
    console.log('lista', this.listaInmuebles[index - 1])
    console.log('bye bye')
    this.resetLsta();

  }

  getPrecioFormateado(precio: number): string {
    return new Intl.NumberFormat('es-CO', {
      style: 'currency',
      currency: 'COP',
      minimumFractionDigits: 0
    }).format(precio);
  }


  createInmueble(data: any): Observable<any> {
    return this.http.post(`${this.baseUrl}/inmueble`, data);
  }

  uploadFotos(id: number, files: FileList): Observable<any> {
    const formData = new FormData();
    for (let file of Array.from(files)) {
      formData.append('fotos', file);
    }
    return this.http.post(`${this.baseUrl}/inmueble/${id}/fotos`, formData);
  }



  onSubmit() {

    if (this.inmuebleForm.invalid) {
      this.inmuebleForm.markAllAsTouched(); // Marca todos los campos como tocados para mostrar errores
      console.log(this.inmuebleForm.value)
      return; // Detiene el envío
    }


    const nuevoInmueble = this.inmuebleForm.value as Inmueble;

    console.log('inmueble enviado', nuevoInmueble)
    // Antiguo

    // nuevoInmueble.id = this.listaInmuebles.length + 1;
    nuevoInmueble.estadoRegistro = 1;
    // for (let i = 0; i < this.imagePreviews.length; i++) {
    //   nuevoInmueble.fotos.push(this.imagePreviews[i])
    // }


    // this.listaInmuebles.push(nuevoInmueble);

    //Nuevo
    this.createInmueble(nuevoInmueble).subscribe({
      next: (res) => {
        const inmuebleId = res.id;
        if (this.files) {
          this.uploadFotos(inmuebleId, this.files).subscribe({
            next: () => {
              alert('Inmueble y fotos creados correctamente');
              this.inmuebleForm.reset();
              this.imagePreviews = [];
              this.files = null;
              this.cerrarModal()
              this.resetFormulario()

            },
            error: (err) => console.error('Error al subir fotos', err)
          });
        }
      },
      error: (err) => console.error('Error al crear inmueble', err)
    });







  }

  resetFormulario(): void {
    this.inmuebleForm.reset({
      id: '',
      FMI: '',
      subtipo: '',
      sucursal: '',
      Area_Terreno: 0,
      Area_Construida: 0,
      Direccion: '',
      // Departamento: '', // si decides volver a usarlo
      Municipio: '',
      Estado_ocupacion: '',
      Precio: 0,
      Descripcion: '',
      estadoRegistro: 1,
      fotos: []
    });
  }

  resetLsta(): void {
    this.imagePreviews = []
    this.files = null
    this.InmuebleIndividual = [];
    //  this.resetFormulario();



  }

  cerrarModal() {
    const modalElement = document.getElementById('crearinmueble');
    if (modalElement) {
      const modalInstance = bootstrap.Modal.getInstance(modalElement) || new bootstrap.Modal(modalElement);
      modalInstance.hide();
    }
  }




}




