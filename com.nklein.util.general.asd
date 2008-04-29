(asdf:defsystem :com.nklein.util.general
    :components
	((:file "package")
	 (:file "array-things"  :depends-on ("package"))
	 (:file "listy-things"  :depends-on ("package"))
	 (:file "random"        :depends-on ("package"))
	 (:file "with-argtypes" :depends-on ("listy-things" "package"))))
