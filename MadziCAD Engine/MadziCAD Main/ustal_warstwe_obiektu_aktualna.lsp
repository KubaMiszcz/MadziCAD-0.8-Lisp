(defun c:ustal_warstwe_obiektu_aktualna(/ temp_selection)  				
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana ")
  )
  (princ "\n Wska� obiekt kt�rego warstwa ma zosta� aktualn�: ")
  (setq temp_selection (ssget "_:S"))
  (wartosc_wlasciwosci temp_selection 8)
  (setvar "clayer" wlasciwosc)
  (princ)
)