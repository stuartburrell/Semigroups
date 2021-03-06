############################################################################
##
#W  congruences/congpairs.gd
#Y  Copyright (C) 2015                                   Michael C. Torpey
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##
## This file contains functions for any finite semigroup congruence with
## generating pairs, using a pair enumeration and union-find method.
##
## See the header of congpairs.gi for a full summary.
##

DeclareOperation("AsSemigroupCongruenceByGeneratingPairs",
                 [IsSemigroupCongruence]);

# This is a representation for left/right/two-sided congruences of a finite
# semigroup by generating pairs. 
#
# The components are:
#  
#   range:    the semigroup over which the congruence is defined
#
#   genpairs: the list of generating pairs (pairs of elements of the range)
#
#   type:     one of "left", "right", or "twosided" to indicate the type of the
#             congruence when it was created (i.e. if it was created as a
#             two-sided, left or right congruence. Remember
#             IsLeftSemigroupCongruence is a property, so a congruence might
#             learn that it is a left congruence after being created as a right
#             congruence. This component only refers to the type of congruence
#             that was created.
#   
#   report:   should be true or false, sets whether information is printed
#             during a computation or not.

DeclareCategory("IsFiniteCongruenceByGeneratingPairs", 
                IsEquivalenceRelation, RankFilter(IsSemigroupCongruence));

DeclareRepresentation("IsFiniteCongruenceByGeneratingPairsRep",
                      IsEquivalenceRelation and IsAttributeStoringRep and
                      IsFiniteCongruenceByGeneratingPairs,
                      ["range", "genpairs", "type", "report"]);

DeclareAttribute("FiniteCongruenceByGeneratingPairsPartition", 
                 IsFiniteCongruenceByGeneratingPairsRep); 

# This is a representation for classes of a left/right/two-sided congruence of
# a finite semigroup by generating pairs. 
#
# The components are:
#  
#   rep:  an arbitrary representative of the class
#
#   cong: the underlying congruence of the class.

DeclareCategory("IsFiniteCongruenceClassByGeneratingPairs",
                IsEquivalenceClass, RankFilter(IsCongruenceClass));

DeclareRepresentation("IsFiniteCongruenceClassByGeneratingPairsRep",
                      IsEquivalenceClass and IsAttributeStoringRep and
                      IsFiniteCongruenceClassByGeneratingPairs,
                      ["rep", "cong"]);

DeclareAttribute("FiniteCongruenceClassByGeneratingPairsCosetId",
                 IsFiniteCongruenceClassByGeneratingPairsRep);

DeclareAttribute("FiniteCongruenceClassByGeneratingPairsType",
                 IsFiniteCongruenceByGeneratingPairsRep);
