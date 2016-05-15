# Trial Lang 2

This is just my trial.

## Syntax

```lisp
// @ sub.lisp

(package sub)
// => sub

(def (%add:int a:int b:int)
  (+ a b))
// => %add

(def (Add:int a:int b:int)
  (%add a b))
// => Add
```

```lisp
// @ main.lisp

(package main)

(import "./sub.lisp")

(def global-variable 1)

(print (sub.Add global-variable 2))

(defstruct sample
  (a:int b:int))

(def (initialize self:sample a:int b:int)
  (set self.a a)
  (set self.b (+ b 1)))

(def (add:int sample:sample)
  (+ sample.a sample.b))

(print (add (new sample 1 2)))

(print (add (sample.new 2 4)))
```


### package

```lisp
// declare current package
(package main)

// use other packages
(import "./sub")

// use alias
(import (:as "./sub" sub2))

// include all symbols into current package
(import (:as sub .))

// can not assign to package
(let ((sub 1))
  // => raise error `can not assign to sub:package`
  ...)

// make first character upper character to export
(def (Sample:int) ...)
```


### def

```lisp
// global variable
(def a 1)

// function
(def (sample:int a:string)
  (print "Hello") (print a) 1)

(def (sample2:int args...:int)
  (print args)
  (funcall #'+ args))

(sample2 1 2 3)
// (1 2 3)
// => 6
```


### calling function

```lisp
// @ sub.lisp

(package sub)

(def (Sample:int a:int b:int)
  (+ a b))
```

```lisp
(package main)

(import "./sub")

// call function
(print 1)

// call function in other package
(sub.Sample 1 2)

// dot syntax sugar
1.print
// => (print 1)

(defstruct sample
  (a:int b:int))

(def (add a:int b:int)
  (+ a b))
(1.add 2)
// => (add 1 2)
```


### let

```lisp
// assign
(let ((a 1))
  ...)

// declare
(let (a:int)
  ...)

// can use declared variable in the same `let'
(let ((a 1)
      (b a))
  b // => 1)

// destructuring

(def a (cons 1 2))

(def b #h(:a 1 :b 2))

(let (((cons x1 y1) a)
      (#h(:a x2 :b y2) b))
  ...)
```


### data structure

```lisp
// cons
(cons 1 2)
(list 1 2 3)
'(1 2 3)

// array
#a(1 2 3)
#(array 1 2 3)

// hash
#h(:a 1 :b 2)
#(hash :a 1 :b 2)

// struct

(defstruct sample
  (a:int b:int))

#(sample :a 1 :b 2)

// class
// TBD
```
