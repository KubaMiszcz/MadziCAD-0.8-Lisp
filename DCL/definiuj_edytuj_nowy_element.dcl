definiuj_edytuj_nowy_element : dialog {
    label = "Twórz nowy element";
    initial_focus = "nazwa_elementu";
    children_alignment = center;
	:boxed_column { label = "Lista elementów";
		:row { 
			: list_box { label = " "; key = "lista_elementow"; 
			width = 30;
			}
			: list_box { label = "Klasa"; key = "lista_klasa_betonu"; 
			width = 10;
			}
			: list_box { label = "V [m3]"; key = "lista_V_betonu"; 
			width = 10;
			}
			: list_box { label = "Iloœæ [szt.]"; key = "lista_liczba_elementow"; 
			width = 10;
			}
		}
	spacer_1;
	}
    :boxed_column { label = "Dodaj/Edytuj element"; 
	:row {
		:text {label = ""; width = 33;}
		:text {label = "Klasa"; width = 10;}
		:text {label = "m3";width = 7;}
		:text {label = "szt.";}


		spacer_0;
		}

	: row {
		: edit_box   { label = ""; key = "nazwa_elementu"; 
		edit_width = 30;
		}
		: popup_list { label = ""; key = "klasa_betonu"; 
		edit_width = 6; value = "1";
		}
		: edit_box   { label = ""; key = "V_betonu"; 
		edit_width = 6; value = "0.0"; alignment = right;
		}
		: edit_box   { label = ""; key = "liczba_elementow"; 
		edit_width = 6; value = "1"; alignment = right;
		}
	}
	:row {
		spacer_1;
	}
	}
	spacer_1;
	:row { children_alignment = center;
		:button {label = "Kasuj"; key = "kasuj";}
		:button {label = "Zmieñ"; key = "zmien";}
		:button {label = "Dodaj"; key = "dodaj"; allow_accept = true; }
		:button {label = "Anuluj"; key = "anuluj"; is_default = true; is_cancel = true;}
	}
	spacer_1;
}
