############################################################################
##
#W  congruences/conguniv.gd
#Y  Copyright (C) 2015                                   Michael C. Torpey
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##
## This file contains methods for the unique universal congruence on a
## semigroup, that is the relation SxS on a semigroup S.
##

# Universal Congruences
DeclareProperty("IsUniversalSemigroupCongruence",
                IsSemigroupCongruence);
DeclareCategory("IsUniversalSemigroupCongruenceClass",
                IsCongruenceClass and IsAttributeStoringRep and
                IsAssociativeElement); #TODO check this works for matrices
DeclareOperation("UniversalSemigroupCongruence", [IsSemigroup]);
