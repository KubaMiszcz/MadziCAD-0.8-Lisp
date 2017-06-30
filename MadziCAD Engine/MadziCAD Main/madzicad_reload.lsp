;; program laduje uzywane lispy
(defun c:madzicad_reload()			;a to jest dla mnie do szybkiego testowania zmian:]
  (load (strcat path "autostart.lsp"))
  (setvar "re-init" 16)
  (princ)
)

(defun c:sa()   ;szybki entlist
  (setq ent (entget (ssname (ssget "_:S") 0)))
)