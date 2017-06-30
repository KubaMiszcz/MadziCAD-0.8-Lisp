(graphscr)
(if (= (vl-registry-read "HKEY_local_machine\\software\\madzicad\\" "autostart") 1)
  (progn
    (setq path (vl-registry-read "HKEY_local_machine\\software\\madzicad\\" "path"))
    (vl-registry-write "HKEY_local_machine\\software\\madzicad\\" "autostart" 0)
    (vl-load-all (strcat path "\\madzicad_bin.fas"))  
  )
  (progn
    (princ "autostart 0")
  )
)
(princ)

;(vl-file-copy source-file destination-file [append]) 
;(vlisp-compile 'st "C:\\Program Files\\MadziCAD\\madzicad sources\\MadziCAD Engine\\MadziCAD Main\\Funkcje Pomocnicze\\madzicad_starter.lsp" "c:\\program files\\madzicad\\support\\madzicad_starter.fas")


