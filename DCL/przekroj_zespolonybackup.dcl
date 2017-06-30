przekroj_zespolony : dialog { label = "Charakterystyki przekroju zespolonego";
	spacer_1;
	//AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
	:column {children_alignment = left;
//tabelka>>	
	:row {alignment = centered; fixed_height =true;fixed_width = true; children_alignment = top;
		:boxed_column{label = "Wyniki"; children_alignment = left; fixed_height =true; fixed_width = true; children_fixed_width = true; children_fixed_height = true;
			:row {
				spacer_1;
				spacer_1;
				:column {
					:text {label = "";}
					:spacer {height = 0.1;}	
					:text {label = "Modu³ Younga"; }	
					:text {label = "\"n\""; }
					:text {label = "Powierzchnia"; }	
					:text {label = "Moment Jy"; }
					spacer_1;
					spacer_1;
				}
					spacer_1;
				:column {children_alignment = right;
					:text {label = "";}
					:spacer {height = 0.1;}	
					:text {label = "[GPa] :"; }	
					:text {label = "[--] :"; }
					:text {label = "[cm2] :"; }	
					:text {label = "[cm4] :"; }
					spacer_1;
					spacer_1;
				}
				spacer_1;
				:column {children_alignment = centered;
					:text {label = "Przekrój A"; }
					:row {
					:edit_box {label = ""; key = "ea"; edit_width = 3 ; alignment = centered;}
						spacer_1;
					}
					:text {label = "1000.00"; key = "na"; }
					:text {label = "100.00"; key = "pole_a"; }	
					:text {label = "100.00"; key = "jy_a"; }
					//spacer_1;
					:button {label = "< Wska¿"; key = "wskaz_obszar_a"; fixed_width =true;alignment = centered;}
					//spacer_1;
				}
					spacer_1;
				:column {children_alignment = centered;
					:text {label = "Przekrój B"; }	
					:row {
						:edit_box {label = ""; key = "eb"; edit_width = 3 ; alignment = centered;}
						spacer_1;
					}
					:text {label = "1000.00"; key = "nb"; }
					:text {label = "100.00"; key = "pole_b"; }	
					:text {label = "100.00"; key = "jy_b"; }
					:button {label = "< Wska¿"; key = "wskaz_obszar_b"; fixed_width =true;alignment = centered;}
				}
					spacer_1;
				:column {children_alignment = centered;
					:text {label = "Przekrój C"; }	
					:row {
						:edit_box {label = ""; key = "ec"; edit_width = 3 ; alignment = centered;}
						spacer_1;
					}
					:text {label = "1000.00"; key = "nc"; }
					:text {label = "100.00"; key = "pole_c"; }	
					:text {label = "100.00"; key = "jy_c"; }
					:button {label = "< Wska¿"; key = "wskaz_obszar_c"; fixed_width =true;alignment = centered;}
				}
				spacer_1;
			}
		:spacer {height = 0.1;}
		}
	} //tabelka<
spacer_1;





	
//przekroje<<<<<<<<<<<<<<<




//wyniki>
	:row {children_alignment = top; fixed_height =true;//fixed_width = true; 

	//	:column{children_alignment = left; fixed_height = false; fixed_width = false;
			:boxed_column {label = "Przekrój zespolony";
				:row {children_alignment = centered;
					:column{children_alignment = left;
						:text {label = "Powierzchnia";}
						:text {label = "Moment Jy";}
						spacer_1;
					}
					:column{children_alignment = right;
						:text {label = "[cm2] =";}
						:text {label = "[cm4] =";}
						spacer_1;
					}
					:column{children_alignment = right;
						:text {label = "10000.00"; key = "pole_zespolonego";}
						:text {label = "1000000.00"; key = "jy_zespolonego";}
						spacer_1;
					}
				}
			}
			spacer_1;
			//SILY WEWNETRZNE
		
			:boxed_column {label = "Si³y zewnêtrzne";children_alignment = right;
				:row {alignment = centered;
					:column{children_alignment = left;
						:text {label = "Moment";}
					}
					:column{children_alignment = right;
						:text {label = "[kNm] =";}
					}
					:column{children_alignment = right;
						:edit_box {key = "moment_zginajacy"; edit_width = 5;}
					}
				}
				:row {alignment = centered;
					:column{children_alignment = left;
						:text {label = "Si³a N";}
					}
					:column{children_alignment = right;
						:text {label = "[kN] =";}
					}
					:column{children_alignment = right;
						:edit_box {key = "sila_osiowa"; edit_width = 5;}
					}
					
				}
			}
	//	}
	}

spacer_1;


//tabelka>>	
	:row {alignment = centered; fixed_height =true;fixed_width = false; children_alignment = top;
		:boxed_column{label = "Wyniki"; children_alignment = left; fixed_height =true;fixed_width = false;
			:row {
				spacer_1;
				:column {
					:text {}	
					:text {label = "Moment [kNm] :"; }	
					:text {label = "Si³a N [KN] :"; }
					spacer_1;
					:text {label = "Naprê¿enia [MPa] :"; }	
					:text {label = "w³ókna górne:"; }	
					:text {label = "w³ókna dolne:"; }
				}
					spacer_1;
				:column {children_alignment = right;
					:text {label = "Przekrój A"; }	
					:text {label = "100.00"; key = "moment_zginajacy_a"; }
					:text {label = "1000.00"; key = "sila_osiowa_a"; }
					spacer_1;
					:text {}	
					:text {label = "100.00"; key = "sigma_gw_a"; }	
					:text {label = "100.00"; key = "sigma_dw_a"; }
				}
					spacer_1;
				:column {children_alignment = right;
					:text {label = "Przekrój B"; }	
					:text {label = "100.00"; key = "moment_zginajacy_b"; }
					:text {label = "1000.00"; key = "sila_osiowa_b"; }
					spacer_1;
					:text {}	
					:text {label = "100.00"; key = "sigma_gw_b"; }	
					:text {label = "100.00"; key = "sigma_dw_b"; }
				}
					spacer_1;
				:column {children_alignment = right;
					:text {label = "Przekrój C"; }	
					:text {label = "100.00"; key = "moment_zginajacy_c"; }
					:text {label = "1000.00"; key = "sila_osiowa_c"; }
					spacer_1;
					:text { }	
					:text {label = "100.00"; key = "sigma_gw_c"; }	
					:text {label = "100.00"; key = "sigma_dw_c"; }
				}
				spacer_1;
			}
			spacer_1;
		}
	} //tabelka<
	} //wyniki<	

	spacer_1;
		:row{ children_fixed_width = false; alignment = centered;
			spacer_1;
			spacer_1;
			:button {label = "OK"; key = "accept"; is_default = true; }
			:button {label = "Anuluj"; key = "cancel";  is_cancel = true;}
			:button {label = "Help"; key = "help";}
			:button {label = "Info..."; key = "info"; }
			spacer_1;
			spacer_1;
		}
		spacer_1;
}	//dialog<






