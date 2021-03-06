#############################################################################
##
#W  obsolete.gi
#Y  Copyright (C) 2015                                   James D. Mitchell
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##

SEMIGROUPS.PrintObsolete := function(old, arg...)
  Print("#I  `", old, "` is no longer supported\n",
        "#I  use `", Concatenation(List(arg, String)), "` instead!\n");
end;

InstallMethod(RandomTransformationSemigroup, "for pos ints",
[IsPosInt, IsPosInt],
function(nrgens, deg)
  SEMIGROUPS.PrintObsolete("RandomTransformationSemigroup",
                           "RandomSemigroup(IsTransformationSemigroup, ",
                           nrgens, ", ", deg, ")");
  return RandomSemigroup(IsTransformationSemigroup, nrgens, deg);
end);

InstallMethod(RandomTransformationMonoid, "for pos ints",
[IsPosInt, IsPosInt],
function(nrgens, deg)
  SEMIGROUPS.PrintObsolete("RandomTransformationMonoid",
                           "RandomMonoid(IsTransformationMonoid, ",
                           nrgens, ", ", deg, ")");
  return RandomMonoid(IsTransformationMonoid, nrgens, deg);
end);

InstallMethod(RandomPartialPermSemigroup, "for pos ints",
[IsPosInt, IsPosInt],
function(nrgens, deg)
  SEMIGROUPS.PrintObsolete("RandomPartialPermSemigroup",
                           "RandomSemigroup(IsPartialPermSemigroup, ",
                           nrgens, ", ", deg, ")");
  return RandomSemigroup(IsPartialPermSemigroup, nrgens, deg);
end);

InstallMethod(RandomPartialPermMonoid, "for pos ints",
[IsPosInt, IsPosInt],
function(nrgens, deg)
  SEMIGROUPS.PrintObsolete("RandomPartialPermMonoid",
                            "RandomMonoid(IsPartialPermMonoid, ",
                            nrgens, ", ", deg, ")");
  return RandomMonoid(IsPartialPermMonoid, nrgens, deg);
end);

InstallMethod(DotDClasses, "for a semigroup",
[IsSemigroup],
function(S)
  SEMIGROUPS.PrintObsolete("DotDClasses", "DotString");
  return DotString(S);
end);

InstallMethod(DotDClasses, "for a semigroup and a record",
[IsSemigroup, IsRecord],
function(S, opts)
  SEMIGROUPS.PrintObsolete("DotDClasses", "DotString");
  return DotString(S, opts);
end);

InstallMethod(PartialTransformationSemigroup, "for a positive integer",
[IsPosInt],
function(n)
  SEMIGROUPS.PrintObsolete("PartialTransformationSemigroup",
                           "PartialTransformationMonoid(", n, ")");
  return PartialTransformationMonoid(n);
end);

InstallMethod(AsPartialPermSemigroup, "for a semigroup",
[IsSemigroup],
function(S)
  SEMIGROUPS.PrintObsolete("AsPartialPermSemigroup",
                           "AsSemigroup(IsPartialPermSemigroup, S)");
  return AsSemigroup(IsPartialPermSemigroup, S);
end);

InstallMethod(AsBlockBijectionSemigroup, "for a semigroup",
[IsSemigroup],
function(S)
  SEMIGROUPS.PrintObsolete("AsBlockBijectionSemigroup",
                           "AsSemigroup(IsBlockBijectionSemigroup, S)");
  return AsSemigroup(IsBlockBijectionSemigroup, S);
end);

InstallMethod(AsBipartitionSemigroup, "for a semigroup",
[IsSemigroup],
function(S)
  SEMIGROUPS.PrintObsolete("AsBipartitionSemigroup",
                           "AsSemigroup(IsBipartitionSemigroup, S)");
  return AsSemigroup(IsBipartition, S);
end);

InstallMethod(AsTransformationSemigroup, "for a semigroup",
[IsSemigroup],
function(S)
  SEMIGROUPS.PrintObsolete("AsTransformationSemigroup",
                           "AsSemigroup(IsTransformationSemigroup, S)");
  return AsSemigroup(IsTransformationSemigroup, S);
end);

InstallMethod(IsomorphismBipartitionSemigroup, "for a semigroup",
[IsSemigroup],
function(S)
  SEMIGROUPS.PrintObsolete("IsomorphismBipartitionSemigroup",
                           "IsomorphismSemigroup(IsBipartitionSemigroup, S)");
  return IsomorphismSemigroup(IsBipartitionSemigroup, S);
end);

InstallMethod(IsomorphismBlockBijectionSemigroup, "for a semigroup",
[IsSemigroup],
function(S)
  SEMIGROUPS.PrintObsolete("IsomorphismBlockBijectionSemigroup",
                           "IsomorphismSemigroup(",
                           "IsBlockBijectionSemigroup, S)");
  return IsomorphismSemigroup(IsBlockBijectionSemigroup, S);
end);
