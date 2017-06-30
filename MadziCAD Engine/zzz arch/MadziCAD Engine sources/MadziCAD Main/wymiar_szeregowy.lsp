(defun c:wymiar_szeregowy (/ layerprev pt1 pt2 pt1temp pt2temp tan_angle angledeg osmodeprev orthomodeprev)
  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)		;zmienia na poprz warstwe
    (setvar "orthomode" orthomodeprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq layerprev (getvar "clayer"))	;zapamietuje biezaca warstwe
  (setq orthomodeprev (getvar "orthomode"))
					;(setq osmodeprev (getvar "osmode"))
  (setvar "orthomode" 0)
  (setq dim_last_base_pt_prev dim_last_base_pt) ;zapamietuje polozenie poprzedniego wymiaru
  (if (/= (tblsearch "layer" warwym) nil)
    (setvar "clayer" warwym)		;ustala akt warstwe na 'wymiary'
  )
  (setq	pt1 (getpoint
	      "\n Wska¿ pierwszy punkt pomocniczej linii wymiarowej (ENTER - kontynuacja poprzedniego wymiaru): "
	    )
  )
  (if (= pt1 nil)
    (setq pt1 (trans dim_last_pt 0 1))
  )
  (setq	pt2 (getpoint "\n Wska¿ drugi punkt pomocniczej linii wymiarowej: "
		      pt1
	    )
  )

  (setq pt1temp pt1)
  (setq pt2temp pt2)


  (if (> (car pt1temp) (car pt2temp))
    (progn
      (setq pt1 pt2temp)
      (setq pt2 pt1temp)
    )
    (progn
      (setq pt1 pt1temp)
      (setq pt2 pt2temp)
    )
  )

  (setq angledeg (cvunit (angle pt1 pt2) "radians" "degrees"))
  (setq angledeg (- angledeg (* 180 (fix (/ angledeg 180)))))
  (if (> angledeg 90)
    (setq angledeg (- angledeg 180))
  )


  (setq pt1 (trans pt1 1 0))
  (setq pt2 (trans pt2 1 0))		; z luw do guw  

					;obliczenie kata y=Ax+B -> A to tangens kata
					;(setq tan_angle (/ (- (cadr pt2) (cadr pt1)) (- (car pt2) (car pt1))))
					;(setq angledeg (- (cvunit (atan tan_angle) "radians" "degrees") angledeg2) 

					;(setq angledeg (- angledeg (* 90 (fix (/ angledeg 90)))))

  (command "_ucs" "_new" "_z" angledeg)

  (setq pt1temp (trans pt1 0 1))
  (setq pt2temp (trans pt2 0 1))

  (if (> (car pt1temp) (car pt2temp))
    (progn
      (setq pt1 pt2temp)
      (setq pt2 pt1temp)
    )
    (progn
      (setq pt1 pt1temp)
      (setq pt2 pt2temp)
    )
  )


  (defun *error* (errorlevel)
    (setvar "clayer" layerprev)		;zmienia na poprz warstwe
    (setvar "orthomode" orthomodeprev)
					;(setvar "osmode" osmodeprev)
    (command "_ucs" "_previous")
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )

					;(setvar "osmode" 0)
  (command "_dimlinear"
	   pt1
	   pt2
	   (progn
	     (princ
	       "\n Wska¿ punkt wstawienia wymiaru (ENTER - kontynuacja poprzedniego wymiaru): "
	     )
	     pause
	   )
  )

  (setq dim_last_base_pt (cdr (assoc 10 (entget (entlast)))))
  (setq dim_last_pt (cdr (assoc 14 (entget (entlast)))))

  (if
    (and (= (car dim_last_base_pt) (car dim_last_base_pt_prev))
	 (= (cadr dim_last_base_pt) (cadr dim_last_base_pt_prev))
    )
     (progn
       (command	"_dimlinear"
		pt1
		pt2
		(trans dim_last_base_pt_prev 0 1)
       )
     )
  )

  (setq dim_last_base_pt (cdr (assoc 10 (entget (entlast)))))
  (setq dim_last_pt (cdr (assoc 14 (entget (entlast)))))




  (setq pt1 (getpoint))
  (while (= (car pt1)
	    (car (trans (cdr (assoc 14 (entget (entlast)))) 0 1))
	 )
    (setq pt1 (getpoint))
  )





  (while (/= pt1 nil)
    (while (= (car pt1)
	      (car (trans (cdr (assoc 14 (entget (entlast)))) 0 1))
	   )
      (setq pt1 (getpoint))
    )
    (progn
      (command "_dimlinear"
	       (trans (cdr (assoc 14 (entget (entlast)))) 0 1)
	       pt1
	       (trans (cdr (assoc 10 (entget (entlast)))) 0 1)
      )
      (setq pt1 (getpoint))
    )
  )


  (setq dim_last_base_pt (cdr (assoc 10 (entget (entlast)))))
  (setq dim_last_pt (cdr (assoc 14 (entget (entlast)))))


  (command "_ucs" "_previous")
					;(setvar "osmode" osmodeprev)
  (setvar "clayer" layerprev)		;zmienia na poprz warstwe
  (setvar "orthomode" orthomodeprev)
  (princ)
)
