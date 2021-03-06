############################################################################
##
#W  boolmat.gd
#Y  Copyright (C) 2015                                   James D. Mitchell
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##

# This file contains an implementation of boolean matrices.

#############################################################################
## Specializations of declarations for MatrixOverSemiring
#############################################################################

DeclareCategory("IsBooleanMat", IsMatrixOverSemiring and
                                IsPlistMatrixOverSemiringPositionalRep);

DeclareCategoryCollections("IsBooleanMat");
DeclareCategoryCollections("IsBooleanMatCollection");

BindGlobal("BooleanMatType",
           NewType(NewFamily("BooleanMatFamily",
                             IsBooleanMat, 
                             CanEasilySortElements,
                             CanEasilySortElements),
                   IsBooleanMat));

DeclareGlobalFunction("BooleanMat");

#############################################################################
## Declarations specifically for Boolean mats
#############################################################################

DeclareOperation("AsBooleanMat", [IsMultiplicativeElement, IsPosInt]);
DeclareOperation("AsBooleanMat", [IsMultiplicativeElement]);
DeclareOperation("AsBooleanMat", [IsDigraph]);
DeclareOperation("AsDigraph", [IsBooleanMat]);

DeclareOperation("NumberBooleanMat", [IsBooleanMat]);
DeclareOperation("BooleanMatNumber", [IsPosInt, IsPosInt]);
DeclareGlobalFunction("NumberBlist");
DeclareGlobalFunction("BlistNumber");

DeclareAttribute("Successors", IsBooleanMat);
DeclareGlobalFunction("BooleanMatBySuccessorsNC");

DeclareProperty("IsRowTrimBooleanMat", IsBooleanMat);
DeclareProperty("IsColTrimBooleanMat", IsBooleanMat);
DeclareProperty("IsTrimBooleanMat", IsBooleanMat);

DeclareGlobalFunction("OnBlist");

DeclareAttribute("CanonicalBooleanMat", IsBooleanMat);
DeclareOperation("CanonicalBooleanMat", [IsPermGroup, IsBooleanMat]);
DeclareOperation("CanonicalBooleanMat",
                 [IsPermGroup, IsPermGroup, IsBooleanMat]);
DeclareOperation("CanonicalBooleanMatNC",
                 [IsPermGroup, IsPermGroup, IsBooleanMat]);

DeclareProperty("IsSymmetricBooleanMat", IsBooleanMat);
DeclareProperty("IsAntiSymmetricBooleanMat", IsBooleanMat);
DeclareProperty("IsTransitiveBooleanMat", IsBooleanMat);
DeclareProperty("IsReflexiveBooleanMat", IsBooleanMat);

DeclareProperty("IsTotalBooleanMat", IsBooleanMat);
DeclareProperty("IsOntoBooleanMat", IsBooleanMat);

DeclareSynonymAttr("IsPartialOrderBooleanMat", IsAntiSymmetricBooleanMat and
                   IsTransitiveBooleanMat and IsReflexiveBooleanMat);
DeclareSynonymAttr("IsEquivalenceBooleanMat", IsSymmetricBooleanMat and
                   IsTransitiveBooleanMat and IsReflexiveBooleanMat);
