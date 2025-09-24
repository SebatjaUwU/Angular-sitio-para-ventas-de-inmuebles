import { APP_INITIALIZER, ApplicationConfig, provideBrowserGlobalErrorListeners, provideZoneChangeDetection } from '@angular/core';
import { provideRouter } from '@angular/router';

import { routes } from './app.routes';
import { HttpClient, provideHttpClient } from '@angular/common/http';
import { InmuebleService } from './Services/inmuebleService';


export function loadConfig(inmuebleService: InmuebleService) {
  return () => inmuebleService.loadConfig();
}

export const appConfig: ApplicationConfig = {
  providers: [
    provideBrowserGlobalErrorListeners(),
    provideZoneChangeDetection({ eventCoalescing: true }),
    provideRouter(routes),
    provideHttpClient(),

    {
      provide: APP_INITIALIZER,
      useFactory: loadConfig,
      deps: [InmuebleService],
      multi: true
    }

  ]
};
