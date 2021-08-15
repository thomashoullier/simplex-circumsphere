(defsystem simplex-circumsphere
  :name "simplex-circumsphere"
  :author "Thomas HOULLIER"
  :depends-on ("lineq-solve")
  :components
  ((:module "src"
    :components ((:file "package")
                 (:file "simplex-circumsphere" :depends-on ("package")))))
  :in-order-to ((test-op (test-op "simplex-circumsphere/test"))))

(defsystem simplex-circumsphere/test
  :name "simplex-circumsphere/test"
  :depends-on ("rove" "simplex-circumsphere")
  :components
  ((:module "test"
    :components ((:file "rove-suite"))))
  :perform (test-op (o c) (symbol-call :rove '#:run c)))
