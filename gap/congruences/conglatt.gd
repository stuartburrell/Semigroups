############################################################################
##
#W  conglatt.gd
#Y  Copyright (C) 2016                                   Michael C. Torpey
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##
## This file contains functions for a lattice of congruences.
##
## When the congruences of a semigroup are computed, they form a lattice with
## respect to containment.  The information about how the congruences lie in
## this lattice is stored in an IsCongruenceLattice object (a positional object
## based on a list) and can be retrieved from this object with the following
## methods.
##

DeclareCategory("IsCongruenceLattice", IsList);

DeclareAttribute("CongruencesOfLattice", IsCongruenceLattice);

DeclareAttribute("LatticeOfCongruences", IsSemigroup);
DeclareAttribute("LatticeOfLeftCongruences", IsSemigroup);
DeclareAttribute("LatticeOfRightCongruences", IsSemigroup);

DeclareOperation("LatticeOfCongruences",
                 [IsSemigroup, IsMultiplicativeElementCollection]);
DeclareOperation("LatticeOfLeftCongruences",
                 [IsSemigroup, IsMultiplicativeElementCollection]);
DeclareOperation("LatticeOfRightCongruences",
                 [IsSemigroup, IsMultiplicativeElementCollection]);
