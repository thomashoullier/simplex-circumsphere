(defpackage :simplex-circumsphere/test
  (:use :cl :rove))
(in-package :simplex-circumsphere/test)

(deftest simplex-circumsphere
  (let ((tri1 #(#(1 1) #(5 1) #(1 4))) (c1 #(3 5/2)) (r1 5/2)
        (tri2 #(#(1 4) #(5 1) #(3 5/2))))
    (testing "Triangle 1"
      (ok (equalp (list c1 r1)
                  (multiple-value-list
                   (simplex-circumsphere:center-radius tri1))) ""))
    (testing "Degenerate triangle"
      (ok (not (simplex-circumsphere:center-radius tri2)) ""))))
