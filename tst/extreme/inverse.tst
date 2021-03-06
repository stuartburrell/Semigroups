#############################################################################
##
#W  extreme/inverse.tst
#Y  Copyright (C) 2014-15                                   Michael Torpey
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##
gap> START_TEST("Semigroups package: extreme/inverse.tst");
gap> LoadPackage("semigroups", false);;

# Set info levels and user preferences
gap> SEMIGROUPS.StartTest();

#T# InverseCongTest1: Create an inverse semigroup
gap> s := InverseSemigroup([PartialPerm([1, 2, 3, 5], [2, 7, 3, 4]),
>  PartialPerm([1, 3, 4, 5], [7, 2, 4, 6]),
>  PartialPerm([1, 2, 3, 4, 6], [2, 3, 4, 6, 1]),
>  PartialPerm([1, 2, 4, 6], [2, 4, 3, 7]),
>  PartialPerm([1, 2, 4, 6], [3, 1, 7, 2]),
>  PartialPerm([1, 2, 5, 6], [5, 1, 6, 3]),
>  PartialPerm([1, 2, 3, 6], [7, 3, 4, 2])]);;
gap> cong := SemigroupCongruence(s,
>  [PartialPerm([4], [7]), PartialPerm([2], [1])]);
<semigroup congruence over <inverse partial perm semigroup of rank 7 with 7 
 generators> with congruence pair (106,57)>

#T# InverseCongTest3: Try some methods
gap> x := PartialPerm([4], [5]);;
gap> y := PartialPerm([1, 2, 5], [5, 1, 6]);;
gap> z := PartialPerm([6], [1]);;
gap> [x, y] in cong;
false
gap> [x, z] in cong;
true
gap> [y, z] in cong;
false

#T# InverseCongTest4: Congruence classes
gap> classx := CongruenceClassOfElement(cong, x);
{[4,5]}
gap> classy := CongruenceClassOfElement(cong, y);;
gap> classz := CongruenceClassOfElement(cong, z);;
gap> classx = classy;
false
gap> classz = classx;
true
gap> x in classx;
true
gap> y in classx;
false
gap> x in classz;
true
gap> z * y in classz * classy;
true
gap> y * x in classy * classx;
true
gap> Size(classx);
50

#T# InverseCongTest5: Quotients
gap> q := s / cong;;

#T# InverseCongTest6:
# Convert to and from semigroup congruence by generating pairs
gap> pairs := GeneratingPairsOfSemigroupCongruence(cong);;
gap> ccong := SemigroupCongruence(s, pairs);;
gap> ccong = cong;
true
gap> ccong := AsSemigroupCongruenceByGeneratingPairs(cong);
<semigroup congruence over <inverse partial perm semigroup of rank 7 with 7 
 generators> with 1 generating pairs>
gap> [x, y] in ccong;
false
gap> [x, z] in ccong;
true
gap> [y, z] in ccong;
false

#T# InverseCongTest7: Universal congruence
gap> s := InverseSemigroup(PartialPerm([1], [2]), PartialPerm([2], [1]));
<inverse partial perm semigroup of rank 2 with 2 generators>
gap> Size(s);
5
gap> SemigroupCongruence(s, [s.1, s.1 * s.2]);
<universal semigroup congruence over <0-simple inverse partial perm semigroup 
 of size 5, rank 2 with 2 generators>>

#T# SEMIGROUPS_UnbindVariables
gap> Unbind(ccong);
gap> Unbind(classx);
gap> Unbind(classy);
gap> Unbind(classz);
gap> Unbind(cong);
gap> Unbind(pairs);
gap> Unbind(q);
gap> Unbind(s);
gap> Unbind(x);
gap> Unbind(y);
gap> Unbind(z);

#E# 
gap> STOP_TEST("Semigroups package: extreme/inverse.tst");
