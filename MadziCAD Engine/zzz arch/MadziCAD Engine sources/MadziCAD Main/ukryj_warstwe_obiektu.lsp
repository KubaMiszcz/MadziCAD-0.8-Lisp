(defun c:ukryj_warstwe_obiektu(/ layer)  				
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana ")
  )
  (graphscr)
  (princ "\n Wska� obiekt na warstwie do ukrycia: ")
  (setq temp_selection (ssget "_:S"))
  (setq layer (cdr (assoc 8 (entget (ssname temp_selection 0)))))
  (if (= layer (getvar "clayer"))
    (command "_Layer" "_off" layer "_yes" "")
    (command "_Layer" "_off" layer "")
  )
  (princ (strcat "\n Ukryto warstw� \"" layer "\". "))
  (setq command_UWOWO_status 0)
  (princ)
)