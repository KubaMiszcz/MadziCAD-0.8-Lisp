zamiana_wielu_tekstow : dialog {
    label = "Zamiana wielu tekstów";
    initial_focus = "nowy_tekst";
	:column {
	    	: boxed_column { label = "Wpisz nowy tekst";
			//: text { label = "Wpisz nowy tekst wymiarowy:"; }
			: edit_box { key = "nowy_tekst";  allow_accept = true; }
			spacer_1;
		}
		: row { fixed_width = true; alignment = centered;
			:button {label = "Zmieñ"; key = "accept"; is_default = true;}
			:button {label = "Anuluj"; key = "cancel";  is_cancel = true;}
		}
	}
}