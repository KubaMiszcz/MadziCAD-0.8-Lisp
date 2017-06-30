(defun c:ustal_warstwe_obiektu_aktualna(/ temp_selection dimstyle_name)  				
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana ")
  )
  (princ "\n Wska� obiekt kt�rego warstwa ma zosta� aktualn�: ")
  (setq temp_selection (ssget "_:S"))
  (if (= (cdr (cadr (entget (ssname temp_selection 0)))) "DIMENSION")
    (progn
      (setq dimstyle_name (cdr (assoc 3 (entget (ssname temp_selection 0)))))
      (command "_dimstyle" "_restore" dimstyle_name)
      (princ (strcat " \n Aktualny styl wymiarowania: " dimstyle_name))
    )
    (progn
      (wartosc_wlasciwosci temp_selection 8)
      (setvar "clayer" wlasciwosc)
      (princ (strcat " \n Aktualna warstwa: " wlasciwosc))
    )
  )
  (princ)
)