import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InmuebleIndividualPresentacion } from './inmueble-individual-presentacion';

describe('InmuebleIndividualPresentacion', () => {
  let component: InmuebleIndividualPresentacion;
  let fixture: ComponentFixture<InmuebleIndividualPresentacion>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [InmuebleIndividualPresentacion]
    })
    .compileComponents();

    fixture = TestBed.createComponent(InmuebleIndividualPresentacion);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
