(defun c:przerwij_w_punkcie(/ temp_selection pkt)
  (defun *error* (errorlevel)
    (princ "\n MadziCAD error: Funkcja przerwana. ")
    (setvar "osmode" osmodeprev)
  )
  (graphscr)
  (setq osmodeprev (getvar "osmode"))				;zapamietuje stale tryby lokalizacji
  (setvar "osmode" 15359)
  (princ "\n Wybierz obiekty do przerwania, lub [ESC] aby zakoñczyæ: ")
  (setq temp_selection (ssget "_:S"))
  (setq pkt (getpoint "\n Wska¿ punkt przerwania, lub [ESC] aby zakoñczyæ: "))
  (command "_break" 
    temp_selection
    pkt
    pkt
  )
  (setvar "osmode" osmodeprev)
  (c:przerwij_w_punkcie)
  (princ)
)

