/**
 * Provides a library which includes a `problems` predicate for reporting....
 */

import cpp
import codingstandards.cpp.Customizations
import codingstandards.cpp.Exclusions

abstract class DoNotUseSetjmpOrLongjmpSharedSharedQuery extends Query { }

Query getQuery() { result instanceof DoNotUseSetjmpOrLongjmpSharedSharedQuery }

predicate isLongJumpCall(Locatable fc) {
  fc.(FunctionCall).getTarget().hasGlobalOrStdName("longjmp") or
  fc.(MacroInvocation).getMacroName() = "longjmp"
}

predicate isSetJumpCall(MacroInvocation mi) { mi.getMacroName() = "setjmp" }

query predicate problems(Element jmp, string message) {
  exists(string callType |
    not isExcluded(jmp, getQuery()) and
    message = "Use of banned " + callType + "." and
    (
      isLongJumpCall(jmp) and callType = "longjmp function"
      or
      isSetJumpCall(jmp) and callType = "setjmp macro"
    )
  )
}
