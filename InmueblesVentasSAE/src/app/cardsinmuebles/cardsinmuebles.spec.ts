import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Cardsinmuebles } from './cardsinmuebles';

describe('Cardsinmuebles', () => {
  let component: Cardsinmuebles;
  let fixture: ComponentFixture<Cardsinmuebles>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Cardsinmuebles]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Cardsinmuebles);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
