#############################################################################
##
#W  attract.gd
#Y  Copyright (C) 2015                                   James D. Mitchell
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##

# This file contains declarations relating to attributes which only apply to
# acting semigroups.

DeclareOperation("InversesOfSemigroupElementNC",
                 [IsSemigroup, IsMultiplicativeElement]);
DeclareAttribute("StructureDescriptionSchutzenbergerGroups",
                 IsSemigroup and IsFinite);
