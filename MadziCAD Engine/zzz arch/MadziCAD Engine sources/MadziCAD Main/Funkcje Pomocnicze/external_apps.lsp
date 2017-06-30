;==============================================================narzedzia
(defun c:interpolator()
  (startapp (strcat path "\\support\\interpolator.exe"))
  (princ)
)

(defun c:kalkulator()
  (startapp "calc.exe")
  (princ)
)

;==============================================================main
(defun c:madzicad_ustawienia()
  (startapp (strcat path "\\support\\madzicad_ustawienia.exe"))
  (princ)
)

(defun c:madzicad_rejestracja()
  (startapp (strcat path "\\support\\trial_expired.exe"))
  (princ)
)


(defun c:shortcut_maker()
  (startapp (strcat path "\\support\\shortcut_maker.exe"))
  (princ)
)

(defun c:szybki_entlist()   ;szybki entlist
  (setq ent (entget (car (entsel)) '("*")))
  (mapcar 'print ent)
(princ)
)

(defun c:properties_and_methods()   ;wlasciwosci i metody w VLISP
  (setq vlobj (vlax-ename->vla-object (car(entsel))))
  (vlax-dump-object vlobj t) 
)




