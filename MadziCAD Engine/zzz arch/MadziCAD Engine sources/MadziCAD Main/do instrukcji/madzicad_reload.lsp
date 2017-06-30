;; program laduje uzywane lispy
(defun c:madzicad_reload ()		;a to jest dla mnie do szybkiego testowania zmian:]
;;;  (load
;;;    (strcat path "\\madzicad sources\\madzicad_source.lsp")
;;;  )  
  (load (strcat path "\\madzicad_bin.vlx"))
  (setvar "re-init" 16)
  (princ)
)

