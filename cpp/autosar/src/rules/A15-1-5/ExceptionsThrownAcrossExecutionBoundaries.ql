/**
 * @id cpp/autosar/exceptions-thrown-across-execution-boundaries
 * @name A15-1-5: Exceptions shall not be thrown across execution boundaries
 * @description The execution boundary is between the call site in the executable and the function
 *              implementation in the library.  Throwing an exception across an execution boundary
 *              requires that both sides of the execution boundary use the same application binary
 *              interface.  Throw an exception across an execution boundary only when both sides of
 *              the boundary use the same application binary interface.
 * @kind problem
 * @precision very-high
 * @problem.severity error
 * @tags external/autosar/id/a15-1-5
 *       correctness
 *       external/autosar/allocated-target/implementation
 *       external/autosar/enforcement/non-automated
 *       external/autosar/obligation/required
 */

import cpp
import codingstandards.cpp.autosar
import codingstandards.cpp.exceptions.ExceptionFlow
import codingstandards.cpp.Operator

string getCompiler(Compilation c) {
  exists(int mimicPos |
    c.getArgument(mimicPos) = "--mimic" and
    result = c.getArgument(mimicPos + 1) and
    not result = "@-" // exclude response files
  )
}

from
  FunctionCall call, Function f, Expr throws, ExceptionType exceptionType,
  Compilation callingCompilation, Compilation calledCompilation
where
  call.getTarget() = f and
  exceptionType = getAFunctionThrownType(f, throws) and
  callingCompilation.getAFileCompiled() = call.getFile() and
  calledCompilation.getAFileCompiled() = f.getFile() and
  not getCompiler(callingCompilation) = getCompiler(calledCompilation)
select f, "Function $@ an exception of type $@ and is $@ across execution boundaries.", throws,
  "throws", exceptionType, exceptionType.getExceptionName(), call, "called"
