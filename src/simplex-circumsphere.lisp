;;;; Compute circumsphere of a n-simplex.
(in-package :simplex-circumsphere)

(defun center-radius (vertices)
  "Compute the center coodinates and radius of the circumsphere
   for a given n-simplex vertices.
   vertices:#(#(V_0^1 V_0^2 V_0^3) #(V_1^1 V_1^2 V_1^3)...#(V_n^1 V_n^2 V_n^3))
   Return the center coordinates vector and the radius of the circumsphere.
   Return nil if the simplex is found to be degenerate."
  (let* ((n (length (aref vertices 0)))
         (A (make-array (list n n)))
         (b (make-array n))
         (v0 (aref vertices 0))
         (sum-v0-sqr (sum-sqr v0))
         (center) (radius))
    ;; Fill the matrix A
    (loop for i from 0 below n
          for vi across (subseq vertices 1) do
            (loop for j from 0 below n do
              (setf (aref A i j) (- (aref v0 j) (aref vi j)))))
    ;; Fill the vector b
    (loop for i from 0 below n do
      (setf (aref b i) (- sum-v0-sqr (sum-sqr (aref vertices (1+ i))))))
    ;; Solve A.x = b, we obtain 2C
    (setf center (lineq-solve:quick-solve A b))
    (if center
        (loop for i from 0 below n do
          (setf (aref center i) (/ (aref center i) 2)))
        (return-from center-radius nil))
    ;; Compute the radius
    (setf radius
          (sqrt (loop for vj across v0 for cj across center
                      summing (sqr (- vj cj)))))
    (values center radius)))

(defun sum-sqr (seq)
  "Sum the square of the elements of a sequence."
  (loop for el across seq summing (sqr el)))

(defun sqr (x) (* x x))
