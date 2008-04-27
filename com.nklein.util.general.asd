(asdf:defsystem :com.nklein.util.general
    :components
	((:file "package")
	 (:file "listy-things"  :depends-on ("package"))
	 (:file "with-argtypes" :depends-on ("listy-things" "package"))))
