(defun teext(teext)
  (princ teext)
  (exit)
)


(defun c:ee()
 (setq aa "bbbbb")
 (teext aa)
 (princ "koniec")
)

(setq layer (cdr (assoc 8 (entget ( car (entsel))))))  ;<- dxf 8 is the layer,In your exemple it was(8.dim)
foreach
cons
