# Trial Lang 2


## Syntax

```lisp
(package sub)
=> sub

(def (%add:int a:int b:int)
  (+ a b))
=> %add

(def (Add:int a:int b:int)
  (%add a b))
=> Add
```

```lisp
(package main)

(import sub)

(def global-variable 1)

(print (sub.Add global-variable 2))

(defstruct sample
  (a b))

(def (initialize self:sample a:int b:int)
  (set self.a a)
  (set self.b (+ b 1)))

(def (add:int sample:sample)
  (+ sample.a sample.b))

(print (add (new sample 1 2)))

(print (add (sample.new 2 4)))
```


### package

```
# declare current package
(package main)

# use other packages
(import sub)

# use alias
(import (:as sub sub2))

# include all symbols into current package
(import (:as sub .))

# can not assign to package
(let ((sub 1))
  # => raise error `can not assign to sub:package`
  ...)

# make first character upper character to export
(def (Sample:int) ...)
```


### def

```
# global variable
(def a 1)

# function
(def (sample:int a:string)
  (print "Hello") (print a) 1)
```
