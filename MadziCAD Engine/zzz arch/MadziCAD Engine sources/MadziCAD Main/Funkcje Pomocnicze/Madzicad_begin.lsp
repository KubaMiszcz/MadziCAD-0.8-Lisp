
;;PROGRAM=======   
(graphscr)
(setvar "cmdecho" 0)                     ;nie wyswietla komunikatow lispa w linii polecen

(defun message_text (message_text mode / )
  (setq message_text_file (open (strcat path "\\support\\message.dat") mode))
  (write-line message_text message_text_file)
  (close message_text_file)
  (princ)
)


;ustalanie sciezki do autocada
(if (= (vl-registry-read "HKEY_local_machine\\software\\madzicad\\" "path") nil)
  (progn
    (alert "ERROR!\n\n  Uruchom plik \\MadziCAD\\support\\MadziCAD_ustawienia.exe aby wskazaæ œcie¿kê do MadziCADa. ")
    (quit)
  )
  (setq path (vl-registry-read "HKEY_local_machine\\software\\madzicad\\" "path"))
)

(setq file (open (strcat path "\\support\\settings.dat") "r"))
(repeat 128
  (read-line file)
)
(setq windows_root_path (read-line file))    ;u m nie c:\windows
(close file)

;(setenv "ACAD" (strcat (getenv "ACAD") drive "\\Program Files\\Madzicad\\;"))
(c:license_test)

;;***************************************************
;;                    FUNKCJE                       *
;;***************************************************
;;                                                  *
