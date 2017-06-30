(defun c:interpolator()
  (startapp (strcat path "\\support\\interpolator.exe"))
  (princ)
)

(defun c:madzicad_ustawienia()
  (startapp (strcat path "\\support\\madzicad_ustawienia.exe"))
  (princ)
)

(defun c:madzicad_rejestracja()
  (startapp (strcat path "\\support\\trial_expired.exe"))
  (princ)
)

(defun c:kalkulator()
  (startapp "calc.exe")
  (princ)
)




(defun c:szybki_entlist()   ;szybki entlist
  (setq ent (entget (ssname (ssget "_:S") 0)))
)

;(vl-registry-read "HKEY_local_machine\\software\\madzicad\\" "kuba")
;(vl-registry-write "HKEY_local_machine\\software\\madzicad\\" "kuba" "miszcz")

;ZROB OSOBNE FUNKCJE
(defun c:ss() ;polacz_polilinie()
  (princ "\n Wybeierz pierwsza polilinie: ")
  (setq temp_selection (ssget ":S"))
  (if (= (cdr (assoc 0 (entget (ssname temp_selection 0)))) "LINE")
    (progn
      (command "_pedit" temp_selection "_yes" "_join"
        (progn
          (while (= (logand (getvar "cmdactive") 1) 1)
            (command pause)
          )
        )
      )
    )
  )
  (if (= (cdr (assoc 0 (entget (ssname temp_selection 0)))) "LWPOLYLINE")
    (progn
      (command "_pedit" temp_selection "_join"
        (progn
          (while (= (logand (getvar "cmdactive") 1) 1)
            (command pause)
          )
        )
      )
    )    
  )
)



(defun c:sss (/ ss vevo)
  (if
    (setq ss (car (entsel "\nPick an object dimension")))
    (progn
      (setq vevo (vlax-ename->vla-object ss))
      (vlax-dump-object vevo) select a option as what are you need

      (setq tc (vlax-get vevo 'TextColor))
      (vlax-put vevo 'TextColor 1)
      ) ; progn
    (alert "\nInvalid selected object,try again")
    )   ; if
  (princ)
  )

