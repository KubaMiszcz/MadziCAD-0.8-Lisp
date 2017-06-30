(defun c:szybka_grupa(/ temp_selection)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq temp_selection (ssget))
  (generuj_losowa_nazwe "grupa_")
  (command "_group"
    "t"
    losowa_nazwa			;losowa nazwa grupy
    ""
    temp_selection
    ""
  )
  (princ (strcat " Grupa " losowa_nazwa " utworzona. "))
  (princ)
)