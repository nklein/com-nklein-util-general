(in-package :com.nklein.util.general)

(defun proper-list-p (x)
    (if (consp x)
        (proper-list-p (cdr x))
        (not x)))

(defun equals-from-less-than (less-than)
    "Given a LESS-THAN comparison that totally orders some elements, make an equality operator that assumes two items are equal if neither is less than the other"
    #'(lambda (elt1 elt2)
            (not (or (funcall less-than elt1 elt2)
                     (funcall less-than elt2 elt1)))))

(defun sequence-comparator (elt-less-than &optional elt-equal)
    "Given a ELT-LESS-THAN that compares elements of a sequence, compare the sequences lexicographically.  You can give an optional ELT-EQUAL or this function can forge one from the ELT-LESS-THAN."
    (let ((elt-equal (or elt-equal (equals-from-less-than elt-less-than))))
        #'(lambda (list1 list2)
            (let ((idx (mismatch list1 list2 :test elt-equal)))
                (cond
                    ((or (not idx) (>= idx (length list2))) nil)
                    ((>= idx (length list1)) t)
                    (t (funcall elt-less-than
                                (elt list1 idx)
                                (elt list2 idx))))))))
