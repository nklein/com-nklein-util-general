(in-package :com.nklein.util.general)

(defun proper-list-p (x)
    (if (consp x)
        (proper-list-p (cdr x))
        (not x)))

(defun equalp-from-lessp (lessp)
    "Given a LESSP comparison that totally orders some elements, make an equality operator that assumes two items are equal if neither is less than the other"
    #'(lambda (elt1 elt2)
            (not (or (funcall lessp elt2)
                     (funcall lessp elt2 elt1)))))

(defun sequence-lessp (elt-lessp &optional elt-equal)
    "Given an ELT-LESSP that compares elements of a sequence, compare the sequences lexicographically.  You can give an optional ELT-EQUAL or this function can forge one from the ELT-LESSP."
    (let ((elt-equal (or elt-equal (equalp-from-lessp elt-lessp))))
        #'(lambda (list1 list2)
            (let ((idx (mismatch list1 list2 :test elt-equal)))
                (cond
                    ((or (not idx) (>= idx (length list2))) nil)
                    ((>= idx (length list1)) t)
                    (t (funcall elt-lessp
                                (elt list1 idx)
                                (elt list2 idx))))))))
