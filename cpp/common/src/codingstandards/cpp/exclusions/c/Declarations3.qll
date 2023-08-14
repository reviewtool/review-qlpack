//** THIS FILE IS AUTOGENERATED, DO NOT MODIFY DIRECTLY.  **/
import cpp
import RuleMetadata
import codingstandards.cpp.exclusions.RuleMetadata

newtype Declarations3Query =
  TIdentifierHidingCQuery() or
  TIdentifiersNotDistinctFromMacroNamesQuery() or
  TTypedefNameNotUniqueQuery() or
  TTagNameNotUniqueQuery() or
  TExplicitlyDeclareTypesQuery()

predicate isDeclarations3QueryMetadata(Query query, string queryId, string ruleId, string category) {
  query =
    // `Query` instance for the `identifierHidingC` query
    Declarations3Package::identifierHidingCQuery() and
  queryId =
    // `@id` for the `identifierHidingC` query
    "c/misra/identifier-hiding-c" and
  ruleId = "RULE-5-3" and
  category = "required"
  or
  query =
    // `Query` instance for the `identifiersNotDistinctFromMacroNames` query
    Declarations3Package::identifiersNotDistinctFromMacroNamesQuery() and
  queryId =
    // `@id` for the `identifiersNotDistinctFromMacroNames` query
    "c/misra/identifiers-not-distinct-from-macro-names" and
  ruleId = "RULE-5-5" and
  category = "required"
  or
  query =
    // `Query` instance for the `typedefNameNotUnique` query
    Declarations3Package::typedefNameNotUniqueQuery() and
  queryId =
    // `@id` for the `typedefNameNotUnique` query
    "c/misra/typedef-name-not-unique" and
  ruleId = "RULE-5-6" and
  category = "required"
  or
  query =
    // `Query` instance for the `tagNameNotUnique` query
    Declarations3Package::tagNameNotUniqueQuery() and
  queryId =
    // `@id` for the `tagNameNotUnique` query
    "c/misra/tag-name-not-unique" and
  ruleId = "RULE-5-7" and
  category = "required"
  or
  query =
    // `Query` instance for the `explicitlyDeclareTypes` query
    Declarations3Package::explicitlyDeclareTypesQuery() and
  queryId =
    // `@id` for the `explicitlyDeclareTypes` query
    "c/misra/explicitly-declare-types" and
  ruleId = "RULE-8-1" and
  category = "required"
}

module Declarations3Package {
  Query identifierHidingCQuery() {
    //autogenerate `Query` type
    result =
      // `Query` type for `identifierHidingC` query
      TQueryC(TDeclarations3PackageQuery(TIdentifierHidingCQuery()))
  }

  Query identifiersNotDistinctFromMacroNamesQuery() {
    //autogenerate `Query` type
    result =
      // `Query` type for `identifiersNotDistinctFromMacroNames` query
      TQueryC(TDeclarations3PackageQuery(TIdentifiersNotDistinctFromMacroNamesQuery()))
  }

  Query typedefNameNotUniqueQuery() {
    //autogenerate `Query` type
    result =
      // `Query` type for `typedefNameNotUnique` query
      TQueryC(TDeclarations3PackageQuery(TTypedefNameNotUniqueQuery()))
  }

  Query tagNameNotUniqueQuery() {
    //autogenerate `Query` type
    result =
      // `Query` type for `tagNameNotUnique` query
      TQueryC(TDeclarations3PackageQuery(TTagNameNotUniqueQuery()))
  }

  Query explicitlyDeclareTypesQuery() {
    //autogenerate `Query` type
    result =
      // `Query` type for `explicitlyDeclareTypes` query
      TQueryC(TDeclarations3PackageQuery(TExplicitlyDeclareTypesQuery()))
  }
}
