(defpackage :simplex-circumsphere/test
  (:use :cl :rove))
(in-package :simplex-circumsphere/test)

(deftest simplex-circumsphere
  (let ((tri1 #(#(1 1) #(5 1) #(1 4))) (c1 #(3 5/2)) (r1 5/2)
        (tri2 #(#(1 4) #(5 1) #(3 5/2)))
        (tetra1 #(#(-2 3 -3) #(-4 -1 2) #(2 -1 1) #(-1 1 5)))
        (ctetra1 #(-11/10 9/5 9/10)) (rtetra1 4.1785164))
    (testing "Triangle 1"
      (ok (equalp (list c1 r1)
                  (multiple-value-list
                   (simplex-circumsphere:center-radius tri1))) ""))
    (testing "Degenerate triangle"
      (ok (not (simplex-circumsphere:center-radius tri2)) ""))
    (testing "Tetrahedron 1"
      (ok (equalp (list ctetra1 rtetra1)
                  (multiple-value-list
                   (simplex-circumsphere:center-radius tetra1))) ""))))
