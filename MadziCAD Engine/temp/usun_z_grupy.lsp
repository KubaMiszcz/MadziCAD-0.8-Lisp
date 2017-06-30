(defun c:usun_z_grupy ( / ss a b c d e f groupname )
;  (setvar "pickstyle" 0)
  (prompt "\nWska¿ obiekty do usuniêcia z grupy:")
  (setq ss (ssget "_:S"))
;  (setvar "pickstyle" 1)
  (setq a (ssname ss 0))
  (setq b (entget a))
  (setq c (cdr (assoc 330 b)))
  (setq d (entget c))
  (setq e (cdr (assoc 330 d)))
  (setq f (entget e))
  (setq groupname (cdr (assoc 3 f)))	; nazwa grupy
  (command "_group" "u" groupname (ssget) "")	; 
  (princ (strcat "Obiekty z grupy " groupname " zosta³y usuniete"))

  (princ)
)