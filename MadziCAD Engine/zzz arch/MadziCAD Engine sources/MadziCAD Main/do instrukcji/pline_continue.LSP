(defun c:pline_continue (/ PEDITACCEPTPREV PICK_PT PLINE_PTS SOURCE_PLINE START_PT)
  (defun *error* (errorlevel)
    (setvar "peditaccept" peditacceptprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (setq peditacceptprev (getvar "peditaccept"))
  (setvar "peditaccept" 1)

  (princ
    "\n Wybierz poliliniê (liniê, ³uk, itp.) któr¹ chcesz kontunuowaæ: "
  )
  (setq source_pline (entsel))
  (setq pick_pt (cadr source_pline))
  (setq source_pline (car source_pline))



  

  (setq	pline_pts (vlax-safearray->list
		    (vlax-variant-value
		      (vlax-get-property
			(vlax-ename->vla-object source_pline)
			'coordinates
		      )
		    )
		  )
  )

  (if (< (distance (trans (vlax-curve-getStartPoint
			    (vlax-ename->vla-object source_pline)
			  )
			  0
			  1
		   )
		   pick_pt
	 )
	 (distance (trans (vlax-curve-getEndPoint
			    (vlax-ename->vla-object source_pline)
			  )
			  0
			  1
		   )
		   pick_pt
	 )
;;;  (distance (trans (list (car pline_pts) (cadr pline_pts)) 0 1) pick_pt)
;;;  (distance (trans (list (cadr (reverse pline_pts)) (car (reverse pline_pts))) 0 1) pick_pt)
      )
    (setq start_pt (trans (vlax-curve-getStartPoint
			    (vlax-ename->vla-object source_pline)
			  )
			  0
			  1
		   )
    )
    (setq start_pt (trans (vlax-curve-getEndPoint
			    (vlax-ename->vla-object source_pline)
			  )
			  0
			  1
		   )
    )
  )

  (command "_pline" start_pt)
  (while (= (logand (getvar "cmdactive") 1) 1)
    (command pause)
  )

  (command "_pedit" source_pline "_join" (entlast) "" "")

  (setvar "peditaccept" peditacceptprev)
  (princ)
)