(set-info :smt-lib-version 2.6)
(set-logic QF_BV)
(set-option :produce-models true)
(set-info :status sat)
(assert true)
(check-sat)
(get-model)
(exit)
