/**
 * Provides a library which includes a `problems` predicate for reporting
 * typographically ambiguous identifiers.
 */

import cpp
import codingstandards.cpp.Customizations
import codingstandards.cpp.Exclusions
import codingstandards.cpp.Scope

abstract class DifferentIdentifiersNotTypographicallyUnambiguousSharedQuery extends Query { }

Query getQuery() { result instanceof DifferentIdentifiersNotTypographicallyUnambiguousSharedQuery }

string getCanon(UserVariable v) {
  result =
    v.getName()
        .toLowerCase()
        .replaceAll("_", "")
        .regexpReplaceAll("[il]", "1")
        .replaceAll("s", "5")
        .replaceAll("z", "2")
        .replaceAll("b", "8")
        .replaceAll("h", "n")
        .replaceAll("m", "rn")
        .replaceAll("o", "0")
}

string step1(string s) {
  s = "ACDEFGHJKLMNPQRTUVWXY".charAt(_) and result = s.toLowerCase()
  or
  s = "O" and result in ["0", "o"]
  or
  s = "I" and result in ["1", "l", "i"]
  or
  s = "l" and result = "1"
  or
  s = "S" and result in ["5", "s"]
  or
  s = "Z" and result in ["2", "z"]
  or
  s = "n" and result = "h"
  or
  s = "B" and result in ["8", "b"]
}

string step2(string s) { s = "m_" and result = "rn" }

predicate violation(UserVariable v1, UserVariable v2) {
  v2 = getPotentialScopeOfVariable(v1) and
  exists(string s1, string s2 |
    // over-approximate a match, because it is cheaper to compute
    getCanon(v1) = getCanon(v2) and
    v1 != v2 and
    not v1.getName() = v2.getName() and
    // expand 'm' to 'm_' to match either 'm_' or 'rn'
    s1 = v1.getName().replaceAll("_", "").replaceAll("m", "m_") and
    s2 = v2.getName().replaceAll("_", "").replaceAll("m", "m_") and
    // at this point the strings must have equal length, the substitutions do not expand nor contract the string
    s1.length() = s2.length() and
    forall(int i | i in [0 .. s1.length() - 1] |
      exists(string c1, string c2 |
        c1 = s1.charAt(i) and
        c2 = s2.charAt(i)
      |
        c1 = c2
        or
        step1(c1) = c2 // c1 and c2 are typographically unambiguous
        or
        step1(c2) = c1 // c1 and c2 are typographically unamibiguous
        or
        // Check for '[m]_' = '[r]n' and 'm[_]' = 'r[n]' where the character in brackets
        // denote the character at index i.
        // Note: because of the `forall` we need to make sure the above conjuction is true since 'n' = '_' is a contradiction.
        exists(string c1_2, string c2_2 |
          c1_2 = c1 + s1.charAt(i + 1) and
          c2_2 = c2 + s2.charAt(i + 1)
          or
          c1_2 = s1.charAt(i - 1) + c1 and
          c2_2 = s2.charAt(i - 1) + c2
        |
          step2(c1_2) = c2_2 or
          step2(c2_2) = c1_2
        )
      )
    )
  )
}

query predicate problems(
  UserVariable v, string message, UserVariable v1, string v1Description, UserVariable v2,
  string v2Description
) {
  not isExcluded(v1, getQuery()) and
  not isExcluded(v2, getQuery()) and
  v = v1 and
  // Exclude member variables because it is common to have function/construct parameters named after member variables.class
  not (v1.isMember() or v2.isMember()) and
  // Exclude variables that are fully or partially generated by macro's. The final name is not visible to the developer.
  not (v1.isAffectedByMacro() or v2.isAffectedByMacro()) and
  violation(v1, v2) and
  v1Description = v1.getName() and
  v2Description = v2.getName() and
  message = "The identifier $@ is not typographically unambiguous from the identifier $@"
}
