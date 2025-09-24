import { Routes } from '@angular/router';
import { PaginaInicial } from './pagina-inicial/pagina-inicial';
import { InmuebleService } from './Services/inmuebleService';
import { InmuebleIndividualPresentacion } from './inmueble-individual-presentacion/inmueble-individual-presentacion';
import { Cardsinmuebles } from './cardsinmuebles/cardsinmuebles';


export const routes: Routes = [

    // Enrutamiento por inmueble y su identificador
    {
        path :'inmueble/:id', component : InmuebleIndividualPresentacion
    },
    // Ruta principal
    {
        path : '',
        component : PaginaInicial
    }



];
