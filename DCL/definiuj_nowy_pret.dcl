definiuj_nowy_pret : dialog {
    label = "Definiuj nowy prêt";
    //: spacer { height = 1; width = 1;}
    initial_focus = "lista_elementow";
    //: text { label = "Wpisz nowy tekst wymiarowy:"; }
    :boxed_column { label = "Organizacja";
      : popup_list { label = "Wybierz nazwê elementu: "; key = "lista_elementow"; 
          edit_width = 30;  value = "0"; 
          }
      : edit_box   { label = "Wpisz numer prêta: "; key = "numer_preta"; 
          edit_width = 7;  value = "999"; 
          }
      spacer_1;
    }
    :boxed_column { label = "Geometria";
      : popup_list { label = "Wybierz œrednicê prêta [mm]: "; key = "lista_srednic"; 
          edit_width = 6; value = "4"; 
          }
      : edit_box   { label = "Promieñ giêcia [mm] wg. PN-91/S-10042  (lub wpisz w³asny): "; key = "promien_giecia"; 
          edit_width = 7;
          }
      spacer_1;
    }
    :boxed_column { label = "Materia³";
      : popup_list { label = "Wybierz klasê stali: "; key = "lista_klas_stali"; 
          edit_width = 6; value = "3";
          }
      : edit_box   { label = "Wpisz opis stali: "; key = "opis_stali"; 
          edit_width = 15; value = "BSt-500S";
          }
      : edit_box   { label = "Uwagi: "; key = "uwagi"; 
          edit_width = 45;
          }
      spacer_1;
    }
    : spacer { height = 1;}
    ok_cancel;
}