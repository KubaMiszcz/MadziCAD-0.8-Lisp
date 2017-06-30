(defun c:zmiana_nazwy_bloku (/ en oldname ename newname blkrecord)
  (setq en (car (entsel "Wska¿ blok o zmienianej nazwie: ")))
  (setq oldname (cdr (assoc 2 (entget en))))
  (princ
    (strcat "\n Nazwa wskazanego bloku: \"" oldname "\". ")
  )
  (setq ename (tblobjname "block" oldname))
  (if (setq newname (getstring "\n Wpisz now¹ nazwê bloku: "))
    (progn
      (setq blkrecord (entget (cdr (assoc 330 (entget ename)))))
      (entmod
	(subst (cons 2 newname) (assoc 2 blkrecord) blkrecord)
      )
    )
  )
  (princ (strcat "\n Zmieniono nazwê bloku z \"" oldname "\" na \"" newname "\".")
  )
  (princ)
)


