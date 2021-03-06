## The Model-Validation Track Post-Processor

The SMT Competition Model-Validation Track post-processor script takes as input

1. a satisfiable [SMT-LIB v2](http://www.smt-lib.org) problem that has a
  `(set-option :produce-models true)` command and exactly one `(check-sat)`
  command followed by one `(get-model)` command.

2. the model returned by an SMT solver having the following structure:
   ```
    sat
    (model
        (define-fun <var> () <type> <const>)
        ...
    )
    ```
  where `<var>` is the name of a bit-vector, arithmetic or boolean variable
  occurring in the original problem, `<type>` is the Boolean, arithmetic or
  bit-vector type of the variable and `<const>` is a constant value of the
  appropriate type.

The model validator uses pySMT to validate the model by substituting the model
in the original formula and checking that is simplifies to True.

The validator will output `VALID` if the model is a full model that satisfies
the input problem (pySMT does not accept partial models), and `INVALID` followed
by the reason if the model validation did not succeed. It will output `UNKNOWN`
if the input model is empty.

### Usage

The `ModelValidator.py` script uses the pySMT [pySMT](https://github.com/pysmt/pysmt)
version packaged in this repository (pysmt.tar.xz). To run use `PYTHONPATH="pysmt" python2 ModelValidator.py`.
See the [pySMT documentation](https://pysmt.readthedocs.io)
for more information about pySMT.

```
ModelValidator.py [-h] --smt2 SMT2 --model MODEL
```

Alternatively (and on StarExec), you can use the provided wrapper script
[process.model-validation-track](process.model-validation-track), which
requires that the provided [pySMT version](pysmt.tar.xz) is unpacked into the
same directory as the script.

```
./process.model-validation-track SMT2 MODEL
```
