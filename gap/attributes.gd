#############################################################################
##
#W  attributes.gd
#Y  Copyright (C) 2013-15                                James D. Mitchell
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##

# This file contains declarations for attributes of semigroups.

DeclareOperation("IrredundantGeneratingSubset",
                 [IsAssociativeElementCollection]);

DeclareAttribute("GroupOfUnits", IsSemigroup);
DeclareAttribute("IdempotentGeneratedSubsemigroup", IsSemigroup);
DeclareAttribute("InjectionPrincipalFactor", IsGreensDClass);
DeclareAttribute("IsomorphismReesMatrixSemigroup", IsGreensDClass);
DeclareAttribute("RepresentativeOfMinimalIdeal", IsSemigroup);
DeclareSynonymAttr("RepresentativeOfMinimalDClass",
                   RepresentativeOfMinimalIdeal);
DeclareAttribute("MinimalIdeal", IsSemigroup);
DeclareAttribute("PrincipalFactor", IsGreensDClass);
DeclareAttribute("MultiplicativeZero", IsSemigroup);

DeclareAttribute("SmallSemigroupGeneratingSet",
                 IsAssociativeElementCollection);
DeclareAttribute("SmallSemigroupGeneratingSet", IsSemigroup and IsFinite);
DeclareAttribute("SmallMonoidGeneratingSet",
                 IsAssociativeElementCollection and
                 IsMultiplicativeElementWithOneCollection);
DeclareAttribute("SmallMonoidGeneratingSet", IsMonoid and IsFinite);
DeclareAttribute("SmallInverseSemigroupGeneratingSet",
                 IsMultiplicativeElementCollection);
DeclareAttribute("SmallInverseMonoidGeneratingSet",
                 IsMultiplicativeElementWithOneCollection);
DeclareAttribute("SmallGeneratingSet", IsSemigroup);

DeclareAttribute("StructureDescription", IsBrandtSemigroup);
DeclareAttribute("StructureDescription", IsGroupAsSemigroup);
DeclareAttribute("StructureDescriptionMaximalSubgroups",
                 IsSemigroup and IsFinite);
DeclareAttribute("MaximalDClasses", IsSemigroup);
DeclareAttribute("MinimalDClass", IsSemigroup);
DeclareAttribute("IsGreensDLeq", IsSemigroup);
