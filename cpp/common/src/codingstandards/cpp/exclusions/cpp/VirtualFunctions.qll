//** THIS FILE IS AUTOGENERATED, DO NOT MODIFY DIRECTLY.  **/
import cpp
import RuleMetadata
import codingstandards.cpp.exclusions.RuleMetadata

newtype VirtualFunctionsQuery =
  TNonVirtualPublicOrProtectedFunctionsRedefinedQuery() or
  TVirtualFunctionsShallContainOneSpecifierQuery() or
  TOverridingFunctionNotDeclaredOverrideOrFinalQuery() or
  TVirtualFunctionsIntroducedInFinalClassQuery() or
  TDestructorOfABaseClassNotPublicVirtualQuery() or
  TNonVirtualPublicDestructorInNonFinalClassQuery() or
  TVirtualFunctionOverriddenByAPureVirtualFunctionQuery() or
  TVirtualFunctionParametersUseTheSameDefaultArgumentsQuery()

predicate isVirtualFunctionsQueryMetadata(
  Query query, string queryId, string ruleId, string category
) {
  query =
    // `Query` instance for the `nonVirtualPublicOrProtectedFunctionsRedefined` query
    VirtualFunctionsPackage::nonVirtualPublicOrProtectedFunctionsRedefinedQuery() and
  queryId =
    // `@id` for the `nonVirtualPublicOrProtectedFunctionsRedefined` query
    "cpp/autosar/non-virtual-public-or-protected-functions-redefined" and
  ruleId = "A10-2-1" and
  category = "required"
  or
  query =
    // `Query` instance for the `virtualFunctionsShallContainOneSpecifier` query
    VirtualFunctionsPackage::virtualFunctionsShallContainOneSpecifierQuery() and
  queryId =
    // `@id` for the `virtualFunctionsShallContainOneSpecifier` query
    "cpp/autosar/virtual-functions-shall-contain-one-specifier" and
  ruleId = "A10-3-1" and
  category = "required"
  or
  query =
    // `Query` instance for the `overridingFunctionNotDeclaredOverrideOrFinal` query
    VirtualFunctionsPackage::overridingFunctionNotDeclaredOverrideOrFinalQuery() and
  queryId =
    // `@id` for the `overridingFunctionNotDeclaredOverrideOrFinal` query
    "cpp/autosar/overriding-function-not-declared-override-or-final" and
  ruleId = "A10-3-2" and
  category = "required"
  or
  query =
    // `Query` instance for the `virtualFunctionsIntroducedInFinalClass` query
    VirtualFunctionsPackage::virtualFunctionsIntroducedInFinalClassQuery() and
  queryId =
    // `@id` for the `virtualFunctionsIntroducedInFinalClass` query
    "cpp/autosar/virtual-functions-introduced-in-final-class" and
  ruleId = "A10-3-3" and
  category = "required"
  or
  query =
    // `Query` instance for the `destructorOfABaseClassNotPublicVirtual` query
    VirtualFunctionsPackage::destructorOfABaseClassNotPublicVirtualQuery() and
  queryId =
    // `@id` for the `destructorOfABaseClassNotPublicVirtual` query
    "cpp/autosar/destructor-of-a-base-class-not-public-virtual" and
  ruleId = "A12-4-1" and
  category = "required"
  or
  query =
    // `Query` instance for the `nonVirtualPublicDestructorInNonFinalClass` query
    VirtualFunctionsPackage::nonVirtualPublicDestructorInNonFinalClassQuery() and
  queryId =
    // `@id` for the `nonVirtualPublicDestructorInNonFinalClass` query
    "cpp/autosar/non-virtual-public-destructor-in-non-final-class" and
  ruleId = "A12-4-2" and
  category = "advisory"
  or
  query =
    // `Query` instance for the `virtualFunctionOverriddenByAPureVirtualFunction` query
    VirtualFunctionsPackage::virtualFunctionOverriddenByAPureVirtualFunctionQuery() and
  queryId =
    // `@id` for the `virtualFunctionOverriddenByAPureVirtualFunction` query
    "cpp/autosar/virtual-function-overridden-by-a-pure-virtual-function" and
  ruleId = "M10-3-3" and
  category = "required"
  or
  query =
    // `Query` instance for the `virtualFunctionParametersUseTheSameDefaultArguments` query
    VirtualFunctionsPackage::virtualFunctionParametersUseTheSameDefaultArgumentsQuery() and
  queryId =
    // `@id` for the `virtualFunctionParametersUseTheSameDefaultArguments` query
    "cpp/autosar/virtual-function-parameters-use-the-same-default-arguments" and
  ruleId = "M8-3-1" and
  category = "required"
}

module VirtualFunctionsPackage {
  Query nonVirtualPublicOrProtectedFunctionsRedefinedQuery() {
    //autogenerate `Query` type
    result =
      // `Query` type for `nonVirtualPublicOrProtectedFunctionsRedefined` query
      TQueryCPP(TVirtualFunctionsPackageQuery(TNonVirtualPublicOrProtectedFunctionsRedefinedQuery()))
  }

  Query virtualFunctionsShallContainOneSpecifierQuery() {
    //autogenerate `Query` type
    result =
      // `Query` type for `virtualFunctionsShallContainOneSpecifier` query
      TQueryCPP(TVirtualFunctionsPackageQuery(TVirtualFunctionsShallContainOneSpecifierQuery()))
  }

  Query overridingFunctionNotDeclaredOverrideOrFinalQuery() {
    //autogenerate `Query` type
    result =
      // `Query` type for `overridingFunctionNotDeclaredOverrideOrFinal` query
      TQueryCPP(TVirtualFunctionsPackageQuery(TOverridingFunctionNotDeclaredOverrideOrFinalQuery()))
  }

  Query virtualFunctionsIntroducedInFinalClassQuery() {
    //autogenerate `Query` type
    result =
      // `Query` type for `virtualFunctionsIntroducedInFinalClass` query
      TQueryCPP(TVirtualFunctionsPackageQuery(TVirtualFunctionsIntroducedInFinalClassQuery()))
  }

  Query destructorOfABaseClassNotPublicVirtualQuery() {
    //autogenerate `Query` type
    result =
      // `Query` type for `destructorOfABaseClassNotPublicVirtual` query
      TQueryCPP(TVirtualFunctionsPackageQuery(TDestructorOfABaseClassNotPublicVirtualQuery()))
  }

  Query nonVirtualPublicDestructorInNonFinalClassQuery() {
    //autogenerate `Query` type
    result =
      // `Query` type for `nonVirtualPublicDestructorInNonFinalClass` query
      TQueryCPP(TVirtualFunctionsPackageQuery(TNonVirtualPublicDestructorInNonFinalClassQuery()))
  }

  Query virtualFunctionOverriddenByAPureVirtualFunctionQuery() {
    //autogenerate `Query` type
    result =
      // `Query` type for `virtualFunctionOverriddenByAPureVirtualFunction` query
      TQueryCPP(TVirtualFunctionsPackageQuery(TVirtualFunctionOverriddenByAPureVirtualFunctionQuery()))
  }

  Query virtualFunctionParametersUseTheSameDefaultArgumentsQuery() {
    //autogenerate `Query` type
    result =
      // `Query` type for `virtualFunctionParametersUseTheSameDefaultArguments` query
      TQueryCPP(TVirtualFunctionsPackageQuery(TVirtualFunctionParametersUseTheSameDefaultArgumentsQuery()))
  }
}
