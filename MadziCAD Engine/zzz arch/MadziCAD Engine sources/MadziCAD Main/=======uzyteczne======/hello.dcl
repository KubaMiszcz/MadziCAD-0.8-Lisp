definiuj_nowy_pret : dialog {
    label = "Definiuj nowy prêt";
    //: spacer { height = 1; width = 1;}
    initial_focus = "numer_preta";
    //: text { label = "Wpisz nowy tekst wymiarowy:"; }
    : edit_box   { label = "Wpisz numer prêta:           "; key = "numer_preta"; 
        width = 8;}
    : popup_list { label = "Wybierz œrednicê prêta [mm]: "; key = "srednica_preta"; 
        width = 4; 
        list = "4\n6\n8\n10\n12\n14\n16\n18\n20\n22\n24\n26\n28\n30\n32\n34\n36\n38\n40";
        }
    : popup_list { label = "Wybierz klasê stali:         "; key = "klasa_stali"; 
        width = 4; 
        }
    : edit_box   { label = "Wpisz opis stali:            "; key = "opis_stali"; 
        width = 4; 
        }
    : spacer { height = 1; width = 1;}
    ok_cancel;
}