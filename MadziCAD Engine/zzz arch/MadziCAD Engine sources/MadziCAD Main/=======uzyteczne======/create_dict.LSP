;;;Examples 
;;;
;;;The examples that follow create objects and add them to the named object dictionary. 
(defun c:crd ()

;;;
;;;Create a dictionary entry list: 
  (setq dictionary (list '(0 . "DICTIONARY") '(100 . "AcDbDictionary")))

;;;Create a dictionary object using the entmakex function: 
  (setq xname (entmakex dictionary))

;;;Add the dictionary to the named object dictionary: 
  (setq	newdict
	 (dictadd (namedobjdict) "MYDICT" xname)
  )

;;;Create an Xrecord list: 
  (setq	datalist
	 (append (list '(0 . "XRECORD") '(100 . "AcDbXrecord"))
		 '((1 . "This is my data11111") (10 1. 2. 3.) (70 . 33))
	 )
  )



;;;Make an Xrecord object: 
  (setq xname (entmakex datalist))

;;;Add the Xrecord object to the dictionary: 
  (dictadd newdict "DATA_RECORD_11111" xname)



;;;Create an Xrecord list: 
  (setq	datalist
	 (append (list '(0 . "XRECORD") '(100 . "AcDbXrecord"))
		 '((1 . "This is my data222222") (10 1. 2. 3.) (70 . 33))
	 )
  )

  (setq newdictlist (dictsearch (namedobjdict) "mydict"))

;;;Make an Xrecord object: 
  (setq xname (entmakex datalist))

;;;Add the Xrecord object to the dictionary: 
  (dictadd newdict "DATA_RECORD_2222" xname)



  (princ "OK")
)



(defun c:co ()

;;;Create an Xrecord list:
  (setq nazwa (getstring "nazwa wpisu: "))
  (setq nazwa2 (strcat nazwa "xxxxxxxx" nazwa))
  (setq	datalist
	 (append (list '(0 . "XRECORD") '(100 . "AcDbXrecord"))
		 '((1 . "This is my data222222") (10 1. 2. 3.) (70 . 33))
	 )
  )

  (setq newdict (cdar (dictsearch (namedobjdict) "madzicad_dict")))

;;;Make an Xrecord object: 
  (setq xname (entmakex datalist))

;;;Add the Xrecord object to the dictionary: 
  (dictadd newdict nazwa xname)


)