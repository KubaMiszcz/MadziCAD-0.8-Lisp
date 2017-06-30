(defun C:szybki_blok (/ temp_selection base_pt losowa_nazwa)
  (defun *error* (errorlevel)
    (setvar "osmode" osmodeprev)
    (setvar "orthomode" orthoprev)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
  )
  (graphscr)
  (setq osmodeprev (getvar "osmode"))	;zapamietuje stale tryby lokalizacji
  (setq orthoprev (getvar "orthomode"))	;zapamietuje status orto
  (setvar "orthomode" 0)
  (setvar "osmode" 0)
  (princ "\n Wska¿ obiekty z których utworzyæ blok: ")
  (setq temp_selection (ssget))
  (generuj_losowa_nazwe "MadziCAD_block_temp")

  (while (/= nil (tblsearch "block" losowa_nazwa))
    (generuj_losowa_nazwe "MadziCAD_block_temp")
  )

  (setq
    base_pt (trans (cdr (assoc 10 (entget (ssname temp_selection 0))))
		   0
		   1
	    )
  )
  (command "_block" losowa_nazwa base_pt temp_selection "")
  (command "_insert" losowa_nazwa "_scale" 1 "_rotate" 0 base_pt)
  (princ
    (strcat "\n Utworzono blok o nazwie: " losowa_nazwa ". ")
  )
  (setvar "osmode" osmodeprev)
  (setvar "orthomode" orthoprev)
  (princ)
)
