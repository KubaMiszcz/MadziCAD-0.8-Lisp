zmiana_nazwy_bloku : dialog {
    label = "Zmiana nazwy bloku";
    initial_focus = "nowy_nazwa";
    	:column {
	:boxed_row {
		:column{
			: text { label = "Aktualna nazwa bloku:"; }
			: text { label = "Wpisz now¹ nazwê boku:"; }
			spacer_1;
		}
		:column{ children_alignment = left;
			: text { label = "oldname"; key = "oldname";}
			: edit_box { key = "newname";  allow_accept = true; width = 40;}
			spacer_1;
		}
	}
	spacer_1;
	: row { fixed_width = true; alignment = centered;
		:button {label = "Zmieñ"; key = "accept"; is_default = true;}
		spacer_1;spacer_1;spacer_1;spacer_1;spacer_1;
		:button {label = "Anuluj"; key = "cancel";  is_cancel = true;}
	}
	spacer_1;
	}
}