############################################################################
##
#W  extreme/conginv.tst
#Y  Copyright (C) 2015                                    Michael C. Torpey
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##
gap> START_TEST("Semigroups package: extreme/conginv.tst");
gap> LoadPackage("semigroups", false);;

#  
gap> SEMIGROUPS.StartTest();;

#T# AsInverseSemigroupCongruenceByKernelTrace: should take about 20 seconds
gap> S := InverseSemigroup([PartialPerm([1, 3, 4, 5], [6, 7, 4, 1]),
>   PartialPerm([1, 2, 4, 5, 6], [2, 8, 5, 1, 7]),
>   PartialPerm([1, 2, 3, 4, 7], [2, 3, 5, 7, 6]),
>   PartialPerm([1, 2, 4, 5, 6, 7], [8, 2, 3, 7, 1, 5]),
>   PartialPerm([1, 2, 3, 5, 6, 7], [8, 4, 1, 3, 5, 7]),
>   PartialPerm([1, 2, 3, 8], [2, 7, 1, 4]),
>   PartialPerm([1, 2, 3, 4, 5, 8], [4, 7, 6, 1, 3, 2]),
>   PartialPerm([1, 2, 3, 6, 8], [5, 4, 3, 6, 1])]);;
gap> cong := SemigroupCongruence(S, [S.1, S.2]);
<semigroup congruence over <inverse partial perm semigroup of rank 8 with 8 
 generators> with congruence pair (57528,29)>
gap> NrEquivalenceClasses(cong);
85
gap> IsReesCongruence(cong);
true
gap> SemigroupIdealOfReesCongruence(cong);
<inverse partial perm semigroup ideal of size 57500, rank 8 with 1 generator>

#T# SEMIGROUPS_UnbindVariables
gap> Unbind(S);
gap> Unbind(cong);

#E#
gap> STOP_TEST("Semigroups package: extreme/conginv.tst");
