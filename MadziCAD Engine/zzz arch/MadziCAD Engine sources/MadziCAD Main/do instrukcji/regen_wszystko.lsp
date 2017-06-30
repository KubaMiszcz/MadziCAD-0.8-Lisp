(defun c:regen_wszystko (/ )
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (command "_regenall")
  
;ustawianie danych do repair
  (setvar "cecolor" "256")                    ;kolor 256=jak warstwa 
  (setvar "celtscale" 1)                   ;skala rodzaju linii obiektu 1=1
  (setvar "celtype" "bylayer")              ;rodzaj linii
  (setvar "celweight" -1)                   ;szerokosc linii "-1" -> jak warstwa
  (setvar "osmode" user_osmode)
  ;styl tekstu 
  (if (/= (tblsearch "style" madzicad_text_style) nil)
    (setvar "textstyle" madzicad_text_style)
  )
  (princ (strcat "\n Zregenerowano rysunek i ustawiono: kolor, szerokoœæ, i rodzaj linii => Jak Warstwa. Aktualny styl tekstu '" (getvar "textstyle") "'."))
  (princ)
)