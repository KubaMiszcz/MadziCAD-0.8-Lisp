(defun c:wymiar_liniowy	(/ layerprev pkt1 pkt2 dim_last_base_pt_prev)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)		;zmienia na poprz warstwe
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))	;zapamietuje biezaca warstwe
  
  (setq dim_last_base_pt_prev dim_last_base_pt) ;zapamietuje polozenie poprzedniego wymiaru
  (if (/= (tblsearch "layer" warwym) nil)
    (setvar "clayer" warwym)		;ustala akt warstwe na 'wymiary'
  )
  (setq	pkt1 (getpoint
	       "\n Wska¿ pierwszy punkt pomocniczej linii wymiarowej (ENTER - kontynuacja poprzedniego wymiaru): "
	     )
  )

  (if (= pkt1 nil)
    (setq pkt1 (trans dim_last_pt 0 1))
  )
  
  (setq	pkt2 (getpoint "\n Wska¿ drugi punkt pomocniczej linii wymiarowej: "
		       pkt1
	     )
  )

  
  (command "_dimlinear"
	   pkt1
	   pkt2
	   (progn
	     (princ
	       "\n Wska¿ punkt wstawienia wymiaru (ENTER - kontynuacja poprzedniego wymiaru): "
	     )
	     pause			;tutaj jka nic nie klikne to wymiar nei jest wstawiany ale to co nizej wstawia wymair juz ze starytmi punktami
	   )
  )

  (setq dim_last_base_pt (cdr (assoc 10 (entget (entlast)))))
  (setq dim_last_pt (cdr (assoc 14 (entget (entlast)))))


  (if
    (and (= (car dim_last_base_pt) (car dim_last_base_pt_prev))
	 (= (cadr dim_last_base_pt) (cadr dim_last_base_pt_prev))
	 (= (car dim_last_base_pt) (car dim_last_base_pt_prev))
    )
     (progn
       (command	"_dimlinear"
		pkt1
		pkt2
		(trans dim_last_base_pt_prev 0 1)
       )
     )
  )
  
  (setq dim_last_base_pt (cdr (assoc 10 (entget (entlast)))))
  (setq dim_last_pt (cdr (assoc 14 (entget (entlast)))))
  (setvar "clayer" layerprev)		;zmienia na poprz warstwe
  (princ)
)

