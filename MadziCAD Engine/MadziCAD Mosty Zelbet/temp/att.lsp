;;ATT-PRTXT.lsp ©2003 Alexey Sheinkman
;;Extracts attribute value and creates a text entity at the specified location wtih prompt text as header
;
(defun csg (code enn)
  (cdr (assoc code (entget enn)))
);defun
;
(princ "\nType APT to start command")
(defun c:apt( / pt aln pln)
         (setq	cmd (getvar "CMDECHO"))
         (setvar "CMDECHO" 0)
         (setq	a (car (entsel "\nChoose something"))
                ag (entnext a)
              	pt (getpoint (csg 10 a) "\nInsert Text Position :")
              	ht (* 0.09375 (abs (csg 41 a)))
              	lst nil
              	an (cdr (assoc -2 (tblsearch "BLOCK" (csg 2 a))))
          );setq
          
     (while (/= "SEQEND" (csg 0 ag))
          (if (= "ATTRIB" (csg  0 ag))
	         (setq 	aln (cons (list (csg 2 ag) (csg 1 ag)) aln)
		ag (entnext ag))
           );if
     );while
     (while an
          (if (= "ATTDEF" (csg  0 an))
	         (setq	pln (cons (list (csg 2 an) (csg 3 an)) pln)
		an (entnext an))
	          (setq an (entnext an))
          );if
     );while
     (setq aln (reverse aln) pln (reverse pln))
     (while (and (/=  nil (and pln aln)) (= (caar pln) (caar aln)))
                (progn (command ".text" pt ht "" (strcat (cadar pln) ":  " (cadar aln)))
	          (setq	pt (list (car pt) (- (cadr pt) (* 1.5 ht)))
		pln (cdr pln)
		aln (cdr aln)
	          );setq
	);progn
       );while
      (setvar "CMDECHO" cmd)
      (princ)
);end