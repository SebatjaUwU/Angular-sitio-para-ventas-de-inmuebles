import { TestBed } from '@angular/core/testing';

import { InmuebleService } from './inmuebleService';

describe('InmuebleS', () => {
  let service: InmuebleService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(InmuebleService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
