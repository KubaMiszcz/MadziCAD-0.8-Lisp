;; program laduje uzywane lispy
(defun c:madzicad_reload()			;a to jest dla mnie do szybkiego testowania zmian:]
  (load (strcat path "\\madzicad sources\\madzicad_source.lsp"))
  (setvar "re-init" 16)
  (princ)
)

