(defun c:polacz_polilinie(/ peditacceptprev temp_selection)
  (defun *error* (errorlevel)
    (setvar "peditaccept" peditacceptprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (setq peditacceptprev (getvar "peditaccept"))
  (setvar "peditaccept" 1)
  
  (princ "\n Wybierz poliliniê (liniê, ³uk, itp.) któr¹ chcesz kontunuowaæ: ")
  (setq source_pline (entsel))
  (setq source_pt (cdr source_pline))
  (setq source_pline (car source_pline))



(vlax-safearray->list (vlax-variant-value aa))
(vlax-tmatrix (vlax-variant-value aa))

  (princ "\n Wybierz pozosta³e polilinie: ")
      (command "_pedit" temp_selection "_join" (ssget) "" "")
      (princ (strcat "\nPo³¹czono " (itoa (+ (sslength (ssget "_p")) 1)) " obiektów. "))
      (sslength (ssget "_p"))
    
    
    
  
  
  (setvar "peditaccept" peditacceptprev)
  (princ)
)