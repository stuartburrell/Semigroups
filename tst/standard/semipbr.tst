#############################################################################
##
#W  standard/semipbr.tst
#Y  Copyright (C) 2015                                  James D. Mitchell
##                                                       
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##
gap> START_TEST("Semigroups package: standard/semipbr.tst");
gap> LoadPackage("semigroups", false);;

#
gap> SEMIGROUPS.StartTest();

#T# helper functions
gap> BruteForceIsoCheck := function(iso)
>   local x, y;
>   if not IsInjective(iso) or not IsSurjective(iso) then
>     return false;
>   fi;
>   for x in Generators(Source(iso)) do
>     for y in Generators(Source(iso)) do
>       if x ^ iso * y ^ iso <> (x * y) ^ iso then
>         return false;
>       fi;
>     od;
>   od;
>   return true;
> end;;
gap> BruteForceInverseCheck := function(map)
> local inv;
>   inv := InverseGeneralMapping(map);
>   return ForAll(Source(map), x -> x = (x ^ map) ^ inv)
>     and ForAll(Range(map), x -> x = (x ^ inv) ^ map);
> end;;

#T# AsSemigroup: 
#   convert from IsPBRSemigroup to IsPBRSemigroup
gap> S := Semigroup(PBR([[-2, 1, 2], [-2, -1, 1]], [[-2, -1, 1], [-2, -1, 1, 2]]),
>                   PBR([[], []], [[], []]));
<pbr semigroup of degree 2 with 2 generators>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr semigroup of degree 2 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsFpSemigroup to IsPBRSemigroup
gap> F := FreeSemigroup(2);; AssignGeneratorVariables(F);;
gap> rels := [ [ s2^2, s2 ], [ s1^3, s1^2 ], [ s2*s1^2, s2*s1 ], [ s2*s1*s2, s2 ] ];;
gap> S := F / rels;
<fp semigroup on the generators [ s1, s2 ]>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr semigroup of degree 9 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsBipartitionSemigroup to IsPBRSemigroup
gap> S := Semigroup( [ Bipartition([ [ 1, 3, -3 ], [ 2, 5, -5 ], [ 4, 7, -7 ], [ 6, 8, -8 ], [ 9, -1 ], [ -2 ], [ -4 ], [ -6 ], [ -9 ] ]), Bipartition([ [ 1, 4, 7, -4 ], [ 2, 5, 9, -2 ], [ 3, 6, 8, -6 ], [ -1 ], [ -3 ], [ -5 ], [ -7 ], [ -8 ], [ -9 ] ]) ] );
<bipartition semigroup of degree 9 with 2 generators>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr semigroup of degree 9 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsTransformationSemigroup to IsPBRSemigroup
gap> S := Semigroup( [ Transformation( [ 3, 5, 3, 7, 5, 8, 7, 8, 1 ] ), Transformation( [ 4, 2, 6, 4, 2, 6, 4, 6, 2 ] ) ] );
<transformation semigroup of degree 9 with 2 generators>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr semigroup of degree 9 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsBooleanMatSemigroup to IsPBRSemigroup
gap> S := Semigroup( [ Matrix(IsBooleanMat, [ [ false, false, true, false, false, false, false, false, false ], [ false, false, false, false, true, false, false, false, false ], [ false, false, true, false, false, false, false, false, false ], [ false, false, false, false, false, false, true, false, false ], [ false, false, false, false, true, false, false, false, false ], [ false, false, false, false, false, false, false, true, false ], [ false, false, false, false, false, false, true, false, false ], [ false, false, false, false, false, false, false, true, false ], [ true, false, false, false, false, false, false, false, false ] ]), Matrix(IsBooleanMat, [ [ false, false, false, true, false, false, false, false, false ], [ false, true, false, false, false, false, false, false, false ], [ false, false, false, false, false, true, false, false, false ], [ false, false, false, true, false, false, false, false, false ], [ false, true, false, false, false, false, false, false, false ], [ false, false, false, false, false, true, false, false, false ], [ false, false, false, true, false, false, false, false, false ], [ false, false, false, false, false, true, false, false, false ], [ false, true, false, false, false, false, false, false, false ] ]) ] );
<semigroup of 9x9 boolean matrices with 2 generators>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr semigroup of degree 9 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsMaxPlusMatrixSemigroup to IsPBRSemigroup
gap> S := Semigroup( [ Matrix(IsMaxPlusMatrix, [ [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ] ]), Matrix(IsMaxPlusMatrix, [ [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ] ]) ] );
<semigroup of 9x9 max-plus matrices with 2 generators>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr semigroup of size 8, degree 9 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsMinPlusMatrixSemigroup to IsPBRSemigroup
gap> S := Semigroup( [ Matrix(IsMinPlusMatrix, [ [ infinity, infinity, 0, infinity, infinity, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity, infinity, infinity, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, infinity, 0, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, infinity, infinity, 0, infinity ], [ infinity, infinity, infinity, infinity, infinity, infinity, 0, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, infinity, infinity, 0, infinity ], [ 0, infinity, infinity, infinity, infinity, infinity, infinity, infinity, infinity ] ]), Matrix(IsMinPlusMatrix, [ [ infinity, infinity, infinity, 0, infinity, infinity, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, infinity, 0, infinity, infinity, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, infinity, 0, infinity, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity, infinity, infinity, infinity, infinity ] ]) ] );
<semigroup of 9x9 min-plus matrices with 2 generators>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr semigroup of size 8, degree 9 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsProjectiveMaxPlusMatrixSemigroup to IsPBRSemigroup
gap> S := Semigroup( [ Matrix(IsProjectiveMaxPlusMatrix, [ [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ] ]), Matrix(IsProjectiveMaxPlusMatrix, [ [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ] ]) ] );
<semigroup of 9x9 projective max-plus matrices with 2 generators>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr semigroup of size 8, degree 9 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsIntegerMatrixSemigroup to IsPBRSemigroup
gap> S := Semigroup( [ Matrix(IsIntegerMatrix, [ [ 0, 0, 1, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 1, 0 ], [ 1, 0, 0, 0, 0, 0, 0, 0, 0 ] ]), Matrix(IsIntegerMatrix, [ [ 0, 0, 0, 1, 0, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0, 0, 0, 0 ] ]) ] );
<semigroup of 9x9 integer matrices with 2 generators>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr semigroup of size 8, degree 9 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsTropicalMaxPlusMatrixSemigroup to IsPBRSemigroup
gap> S := Semigroup( [ Matrix(IsTropicalMaxPlusMatrix, [ [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ] ], 1), Matrix(IsTropicalMaxPlusMatrix, [ [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ] ], 1) ] );
<semigroup of 9x9 tropical max-plus matrices with 2 generators>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr semigroup of size 8, degree 9 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsTropicalMinPlusMatrixSemigroup to IsPBRSemigroup
gap> S := Semigroup( [ Matrix(IsTropicalMinPlusMatrix, [ [ infinity, infinity, 0, infinity, infinity, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity, infinity, infinity, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, infinity, 0, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, infinity, infinity, 0, infinity ], [ infinity, infinity, infinity, infinity, infinity, infinity, 0, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, infinity, infinity, 0, infinity ], [ 0, infinity, infinity, infinity, infinity, infinity, infinity, infinity, infinity ] ], 5), Matrix(IsTropicalMinPlusMatrix, [ [ infinity, infinity, infinity, 0, infinity, infinity, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, infinity, 0, infinity, infinity, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, infinity, 0, infinity, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity, infinity, infinity, infinity, infinity ] ], 5) ] );
<semigroup of 9x9 tropical min-plus matrices with 2 generators>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr semigroup of size 8, degree 9 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsNTPMatrixSemigroup to IsPBRSemigroup
gap> S := Semigroup( [ Matrix(IsNTPMatrix, [ [ 0, 0, 1, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 1, 0 ], [ 1, 0, 0, 0, 0, 0, 0, 0, 0 ] ], 5, 2), Matrix(IsNTPMatrix, [ [ 0, 0, 0, 1, 0, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0, 0, 0, 0 ] ], 5, 2) ] );
<semigroup of 9x9 ntp matrices with 2 generators>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr semigroup of size 8, degree 9 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsPBRMonoid to IsPBRSemigroup
gap> S := Monoid( [ PBR([ [ -2 ], [ -2 ], [ -5 ], [ -5 ], [ -5 ], [ -9 ], [ -9 ], [ -9 ], [ -9 ] ], [ [ ], [ 1, 2 ], [ ], [ ], [ 3, 4, 5 ], [ ], [ ], [ ], [ 6, 7, 8, 9 ] ]), PBR([ [ -3 ], [ -4 ], [ -6 ], [ -7 ], [ -8 ], [ -6 ], [ -7 ], [ -7 ], [ -8 ] ], [ [ ], [ ], [ 1 ], [ 2 ], [ ], [ 3, 6 ], [ 4, 7, 8 ], [ 5, 9 ], [ ] ]) ] );
<pbr monoid of degree 9 with 2 generators>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr monoid of degree 9 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsFpMonoid to IsPBRSemigroup
gap> F := FreeMonoid(3);; AssignGeneratorVariables(F);;
gap> rels := [ [ m1^2, m1 ], [ m1*m2, m2 ], [ m1*m3, m3 ], [ m2*m1, m2 ], [ m2^2, m2 ], [ m3*m1, m3 ], [ m2*m3*m2, m3*m2 ], [ m3^3, m3^2 ], [ m2*m3^2*m2, m3^2*m2 ], [ m3*m2*m3^2, m2*m3^2 ], [ m3^2*m2*m3, m3*m2*m3 ] ];;
gap> S := F / rels;
<fp monoid on the generators [ m1, m2, m3 ]>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr monoid of size 10, degree 10 with 3 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsBipartitionMonoid to IsPBRSemigroup
gap> S := Monoid( [ Bipartition([ [ 1, 2, -2 ], [ 3, 4, 5, -5 ], [ 6, 7, 8, 9, -9 ], [ -1 ], [ -3 ], [ -4 ], [ -6 ], [ -7 ], [ -8 ] ]), Bipartition([ [ 1, -3 ], [ 2, -4 ], [ 3, 6, -6 ], [ 4, 7, 8, -7 ], [ 5, 9, -8 ], [ -1 ], [ -2 ], [ -5 ], [ -9 ] ]) ] );
<bipartition monoid of degree 9 with 2 generators>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr semigroup of degree 9 with 3 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsTransformationMonoid to IsPBRSemigroup
gap> S := Monoid( [ Transformation( [ 2, 2, 5, 5, 5, 9, 9, 9, 9 ] ), Transformation( [ 3, 4, 6, 7, 8, 6, 7, 7, 8 ] ) ] );
<transformation monoid of degree 9 with 2 generators>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr monoid of degree 9 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsBooleanMatMonoid to IsPBRSemigroup
gap> S := Monoid( [ Matrix(IsBooleanMat, [ [ false, true, false, false, false, false, false, false, false ], [ false, true, false, false, false, false, false, false, false ], [ false, false, false, false, true, false, false, false, false ], [ false, false, false, false, true, false, false, false, false ], [ false, false, false, false, true, false, false, false, false ], [ false, false, false, false, false, false, false, false, true ], [ false, false, false, false, false, false, false, false, true ], [ false, false, false, false, false, false, false, false, true ], [ false, false, false, false, false, false, false, false, true ] ]), Matrix(IsBooleanMat, [ [ false, false, true, false, false, false, false, false, false ], [ false, false, false, true, false, false, false, false, false ], [ false, false, false, false, false, true, false, false, false ], [ false, false, false, false, false, false, true, false, false ], [ false, false, false, false, false, false, false, true, false ], [ false, false, false, false, false, true, false, false, false ], [ false, false, false, false, false, false, true, false, false ], [ false, false, false, false, false, false, true, false, false ], [ false, false, false, false, false, false, false, true, false ] ]) ] );
<monoid of 9x9 boolean matrices with 2 generators>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr monoid of degree 9 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsMaxPlusMatrixMonoid to IsPBRSemigroup
gap> S := Monoid( [ Matrix(IsMaxPlusMatrix, [ [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0 ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0 ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0 ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0 ] ]), Matrix(IsMaxPlusMatrix, [ [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ] ]) ] );
<monoid of 9x9 max-plus matrices with 2 generators>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr monoid of size 9, degree 9 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsMinPlusMatrixMonoid to IsPBRSemigroup
gap> S := Monoid( [ Matrix(IsMinPlusMatrix, [ [ infinity, 0, infinity, infinity, infinity, infinity, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, infinity, infinity, infinity, 0 ], [ infinity, infinity, infinity, infinity, infinity, infinity, infinity, infinity, 0 ], [ infinity, infinity, infinity, infinity, infinity, infinity, infinity, infinity, 0 ], [ infinity, infinity, infinity, infinity, infinity, infinity, infinity, infinity, 0 ] ]), Matrix(IsMinPlusMatrix, [ [ infinity, infinity, 0, infinity, infinity, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, 0, infinity, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, infinity, 0, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, infinity, infinity, 0, infinity ], [ infinity, infinity, infinity, infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, infinity, 0, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, infinity, 0, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, infinity, infinity, 0, infinity ] ]) ] );
<monoid of 9x9 min-plus matrices with 2 generators>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr monoid of size 9, degree 9 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsProjectiveMaxPlusMatrixMonoid to IsPBRSemigroup
gap> S := Monoid( [ Matrix(IsProjectiveMaxPlusMatrix, [ [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0 ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0 ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0 ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0 ] ]), Matrix(IsProjectiveMaxPlusMatrix, [ [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ] ]) ] );
<monoid of 9x9 projective max-plus matrices with 2 generators>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr monoid of size 9, degree 9 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsIntegerMatrixMonoid to IsPBRSemigroup
gap> S := Monoid( [ Matrix(IsIntegerMatrix, [ [ 0, 1, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 1 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 1 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 1 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 1 ] ]), Matrix(IsIntegerMatrix, [ [ 0, 0, 1, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 1, 0 ] ]) ] );
<monoid of 9x9 integer matrices with 2 generators>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr monoid of size 9, degree 9 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsTropicalMaxPlusMatrixMonoid to IsPBRSemigroup
gap> S := Monoid( [ Matrix(IsTropicalMaxPlusMatrix, [ [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0 ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0 ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0 ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0 ] ], 1), Matrix(IsTropicalMaxPlusMatrix, [ [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ] ], 1) ] );
<monoid of 9x9 tropical max-plus matrices with 2 generators>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr monoid of size 9, degree 9 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsTropicalMinPlusMatrixMonoid to IsPBRSemigroup
gap> S := Monoid( [ Matrix(IsTropicalMinPlusMatrix, [ [ infinity, 0, infinity, infinity, infinity, infinity, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, infinity, infinity, infinity, 0 ], [ infinity, infinity, infinity, infinity, infinity, infinity, infinity, infinity, 0 ], [ infinity, infinity, infinity, infinity, infinity, infinity, infinity, infinity, 0 ], [ infinity, infinity, infinity, infinity, infinity, infinity, infinity, infinity, 0 ] ], 3), Matrix(IsTropicalMinPlusMatrix, [ [ infinity, infinity, 0, infinity, infinity, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, 0, infinity, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, infinity, 0, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, infinity, infinity, 0, infinity ], [ infinity, infinity, infinity, infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, infinity, 0, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, infinity, 0, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, infinity, infinity, 0, infinity ] ], 3) ] );
<monoid of 9x9 tropical min-plus matrices with 2 generators>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr monoid of size 9, degree 9 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsNTPMatrixMonoid to IsPBRSemigroup
gap> S := Monoid( [ Matrix(IsNTPMatrix, [ [ 0, 1, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 1 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 1 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 1 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 1 ] ], 4, 1), Matrix(IsNTPMatrix, [ [ 0, 0, 1, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 1, 0 ] ], 4, 1) ] );
<monoid of 9x9 ntp matrices with 2 generators>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr monoid of size 9, degree 9 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid: 
#   convert from IsPBRSemigroup to IsPBRMonoid
gap> S := Semigroup( [ PBR([ [ -1 ], [ -2 ], [ -2 ], [ -2 ], [ -2 ] ], [ [ 1 ], [ 2, 3, 4, 5 ], [ ], [ ], [ ] ]), PBR([ [ -2 ], [ -1 ], [ -1 ], [ -1 ], [ -1 ] ], [ [ 2, 3, 4, 5 ], [ 1 ], [ ], [ ], [ ] ]) ] );
<pbr semigroup of degree 5 with 2 generators>
gap> T := AsMonoid(IsPBRMonoid, S);
<commutative pbr monoid of size 2, degree 2 with 1 generator>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid: 
#   convert from IsFpSemigroup to IsPBRMonoid
gap> F := FreeSemigroup(2);; AssignGeneratorVariables(F);;
gap> rels := [ [ s1^2, s1 ], [ s1*s2, s2 ], [ s2*s1, s2 ], [ s2^2, s1 ] ];;
gap> S := F / rels;
<fp semigroup on the generators [ s1, s2 ]>
gap> T := AsMonoid(IsPBRMonoid, S);
<commutative pbr monoid of size 2, degree 2 with 1 generator>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid: 
#   convert from IsBipartitionSemigroup to IsPBRMonoid
gap> S := Semigroup( [ Bipartition([ [ 1, -1 ], [ 2, 3, 4, 5, -2 ], [ -3 ], [ -4 ], [ -5 ] ]), Bipartition([ [ 1, -2 ], [ 2, 3, 4, 5, -1 ], [ -3 ], [ -4 ], [ -5 ] ]) ] );
<bipartition semigroup of degree 5 with 2 generators>
gap> T := AsMonoid(IsPBRMonoid, S);
<commutative pbr monoid of degree 2 with 1 generator>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid: 
#   convert from IsTransformationSemigroup to IsPBRMonoid
gap> S := Semigroup( [ Transformation( [ 1, 2, 2, 2, 2 ] ), Transformation( [ 2, 1, 1, 1, 1 ] ) ] );
<transformation semigroup of degree 5 with 2 generators>
gap> T := AsMonoid(IsPBRMonoid, S);
<commutative pbr monoid of degree 2 with 1 generator>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid: 
#   convert from IsBooleanMatSemigroup to IsPBRMonoid
gap> S := Semigroup( [ Matrix(IsBooleanMat, [ [ true, false, false, false, false ], [ false, true, false, false, false ], [ false, true, false, false, false ], [ false, true, false, false, false ], [ false, true, false, false, false ] ]), Matrix(IsBooleanMat, [ [ false, true, false, false, false ], [ true, false, false, false, false ], [ true, false, false, false, false ], [ true, false, false, false, false ], [ true, false, false, false, false ] ]) ] );
<semigroup of 5x5 boolean matrices with 2 generators>
gap> T := AsMonoid(IsPBRMonoid, S);
<commutative pbr monoid of degree 2 with 1 generator>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid: 
#   convert from IsMaxPlusMatrixSemigroup to IsPBRMonoid
gap> S := Semigroup( [ Matrix(IsMaxPlusMatrix, [ [ 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity ] ]), Matrix(IsMaxPlusMatrix, [ [ -infinity, 0, -infinity, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity ] ]) ] );
<semigroup of 5x5 max-plus matrices with 2 generators>
gap> T := AsMonoid(IsPBRMonoid, S);
<commutative pbr monoid of size 2, degree 2 with 1 generator>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid: 
#   convert from IsMinPlusMatrixSemigroup to IsPBRMonoid
gap> S := Semigroup( [ Matrix(IsMinPlusMatrix, [ [ 0, infinity, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity ] ]), Matrix(IsMinPlusMatrix, [ [ infinity, 0, infinity, infinity, infinity ], [ 0, infinity, infinity, infinity, infinity ], [ 0, infinity, infinity, infinity, infinity ], [ 0, infinity, infinity, infinity, infinity ], [ 0, infinity, infinity, infinity, infinity ] ]) ] );
<semigroup of 5x5 min-plus matrices with 2 generators>
gap> T := AsMonoid(IsPBRMonoid, S);
<commutative pbr monoid of size 2, degree 2 with 1 generator>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid: 
#   convert from IsProjectiveMaxPlusMatrixSemigroup to IsPBRMonoid
gap> S := Semigroup( [ Matrix(IsProjectiveMaxPlusMatrix, [ [ 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity ] ]), Matrix(IsProjectiveMaxPlusMatrix, [ [ -infinity, 0, -infinity, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity ] ]) ] );
<semigroup of 5x5 projective max-plus matrices with 2 generators>
gap> T := AsMonoid(IsPBRMonoid, S);
<commutative pbr monoid of size 2, degree 2 with 1 generator>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid: 
#   convert from IsIntegerMatrixSemigroup to IsPBRMonoid
gap> S := Semigroup( [ Matrix(IsIntegerMatrix, [ [ 1, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0 ], [ 0, 1, 0, 0, 0 ], [ 0, 1, 0, 0, 0 ], [ 0, 1, 0, 0, 0 ] ]), Matrix(IsIntegerMatrix, [ [ 0, 1, 0, 0, 0 ], [ 1, 0, 0, 0, 0 ], [ 1, 0, 0, 0, 0 ], [ 1, 0, 0, 0, 0 ], [ 1, 0, 0, 0, 0 ] ]) ] );
<semigroup of 5x5 integer matrices with 2 generators>
gap> T := AsMonoid(IsPBRMonoid, S);
<commutative pbr monoid of size 2, degree 2 with 1 generator>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid: 
#   convert from IsTropicalMaxPlusMatrixSemigroup to IsPBRMonoid
gap> S := Semigroup( [ Matrix(IsTropicalMaxPlusMatrix, [ [ 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity ] ], 1), Matrix(IsTropicalMaxPlusMatrix, [ [ -infinity, 0, -infinity, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity ] ], 1) ] );
<semigroup of 5x5 tropical max-plus matrices with 2 generators>
gap> T := AsMonoid(IsPBRMonoid, S);
<commutative pbr monoid of size 2, degree 2 with 1 generator>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid: 
#   convert from IsTropicalMinPlusMatrixSemigroup to IsPBRMonoid
gap> S := Semigroup( [ Matrix(IsTropicalMinPlusMatrix, [ [ 0, infinity, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity ] ], 3), Matrix(IsTropicalMinPlusMatrix, [ [ infinity, 0, infinity, infinity, infinity ], [ 0, infinity, infinity, infinity, infinity ], [ 0, infinity, infinity, infinity, infinity ], [ 0, infinity, infinity, infinity, infinity ], [ 0, infinity, infinity, infinity, infinity ] ], 3) ] );
<semigroup of 5x5 tropical min-plus matrices with 2 generators>
gap> T := AsMonoid(IsPBRMonoid, S);
<commutative pbr monoid of size 2, degree 2 with 1 generator>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid: 
#   convert from IsNTPMatrixSemigroup to IsPBRMonoid
gap> S := Semigroup( [ Matrix(IsNTPMatrix, [ [ 1, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0 ], [ 0, 1, 0, 0, 0 ], [ 0, 1, 0, 0, 0 ], [ 0, 1, 0, 0, 0 ] ], 4, 1), Matrix(IsNTPMatrix, [ [ 0, 1, 0, 0, 0 ], [ 1, 0, 0, 0, 0 ], [ 1, 0, 0, 0, 0 ], [ 1, 0, 0, 0, 0 ], [ 1, 0, 0, 0, 0 ] ], 4, 1) ] );
<semigroup of 5x5 ntp matrices with 2 generators>
gap> T := AsMonoid(IsPBRMonoid, S);
<commutative pbr monoid of size 2, degree 2 with 1 generator>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid: 
#   convert from IsPBRMonoid to IsPBRMonoid
gap> S := Monoid( [ PBR([ [ -2 ], [ -4 ], [ -6 ], [ -4 ], [ -7 ], [ -6 ], [ -7 ] ], [ [ ], [ 1 ], [ ], [ 2, 4 ], [ ], [ 3, 6 ], [ 5, 7 ] ]), PBR([ [ -3 ], [ -5 ], [ -3 ], [ -5 ], [ -5 ], [ -3 ], [ -5 ] ], [ [ ], [ ], [ 1, 3, 6 ], [ ], [ 2, 4, 5, 7 ], [ ], [ ] ]) ] );
<pbr monoid of degree 7 with 2 generators>
gap> T := AsMonoid(IsPBRMonoid, S);
<pbr monoid of degree 7 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid: 
#   convert from IsFpMonoid to IsPBRMonoid
gap> F := FreeMonoid(2);; AssignGeneratorVariables(F);;
gap> rels := [ [ m2^2, m2 ], [ m1^3, m1^2 ], [ m1^2*m2, m1*m2 ], [ m2*m1^2, m2*m1 ], [ m2*m1*m2, m2 ] ];;
gap> S := F / rels;
<fp monoid on the generators [ m1, m2 ]>
gap> T := AsMonoid(IsPBRMonoid, S);
<pbr monoid of size 7, degree 7 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid: 
#   convert from IsBipartitionMonoid to IsPBRMonoid
gap> S := Monoid( [ Bipartition([ [ 1, -2 ], [ 2, 4, -4 ], [ 3, 6, -6 ], [ 5, 7, -7 ], [ -1 ], [ -3 ], [ -5 ] ]), Bipartition([ [ 1, 3, 6, -3 ], [ 2, 4, 5, 7, -5 ], [ -1 ], [ -2 ], [ -4 ], [ -6 ], [ -7 ] ]) ] );
<bipartition monoid of degree 7 with 2 generators>
gap> T := AsMonoid(IsPBRMonoid, S);
<pbr monoid of degree 7 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid: 
#   convert from IsTransformationMonoid to IsPBRMonoid
gap> S := Monoid( [ Transformation( [ 2, 4, 6, 4, 7, 6, 7 ] ), Transformation( [ 3, 5, 3, 5, 5, 3, 5 ] ) ] );
<transformation monoid of degree 7 with 2 generators>
gap> T := AsMonoid(IsPBRMonoid, S);
<pbr monoid of degree 7 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid: 
#   convert from IsBooleanMatMonoid to IsPBRMonoid
gap> S := Monoid( [ Matrix(IsBooleanMat, [ [ false, true, false, false, false, false, false ], [ false, false, false, true, false, false, false ], [ false, false, false, false, false, true, false ], [ false, false, false, true, false, false, false ], [ false, false, false, false, false, false, true ], [ false, false, false, false, false, true, false ], [ false, false, false, false, false, false, true ] ]), Matrix(IsBooleanMat, [ [ false, false, true, false, false, false, false ], [ false, false, false, false, true, false, false ], [ false, false, true, false, false, false, false ], [ false, false, false, false, true, false, false ], [ false, false, false, false, true, false, false ], [ false, false, true, false, false, false, false ], [ false, false, false, false, true, false, false ] ]) ] );
<monoid of 7x7 boolean matrices with 2 generators>
gap> T := AsMonoid(IsPBRMonoid, S);
<pbr monoid of degree 7 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid: 
#   convert from IsMaxPlusMatrixMonoid to IsPBRMonoid
gap> S := Monoid( [ Matrix(IsMaxPlusMatrix, [ [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0 ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0 ] ]), Matrix(IsMaxPlusMatrix, [ [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ] ]) ] );
<monoid of 7x7 max-plus matrices with 2 generators>
gap> T := AsMonoid(IsPBRMonoid, S);
<pbr monoid of size 7, degree 7 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid: 
#   convert from IsMinPlusMatrixMonoid to IsPBRMonoid
gap> S := Monoid( [ Matrix(IsMinPlusMatrix, [ [ infinity, 0, infinity, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, 0, infinity ], [ infinity, infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, infinity, 0 ], [ infinity, infinity, infinity, infinity, infinity, 0, infinity ], [ infinity, infinity, infinity, infinity, infinity, infinity, 0 ] ]), Matrix(IsMinPlusMatrix, [ [ infinity, infinity, 0, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity, infinity ] ]) ] );
<monoid of 7x7 min-plus matrices with 2 generators>
gap> T := AsMonoid(IsPBRMonoid, S);
<pbr monoid of size 7, degree 7 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid: 
#   convert from IsProjectiveMaxPlusMatrixMonoid to IsPBRMonoid
gap> S := Monoid( [ Matrix(IsProjectiveMaxPlusMatrix, [ [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0 ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0 ] ]), Matrix(IsProjectiveMaxPlusMatrix, [ [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ] ]) ] );
<monoid of 7x7 projective max-plus matrices with 2 generators>
gap> T := AsMonoid(IsPBRMonoid, S);
<pbr monoid of size 7, degree 7 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid: 
#   convert from IsIntegerMatrixMonoid to IsPBRMonoid
gap> S := Monoid( [ Matrix(IsIntegerMatrix, [ [ 0, 1, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 1 ], [ 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 0, 1 ] ]), Matrix(IsIntegerMatrix, [ [ 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0 ], [ 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0 ], [ 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0 ] ]) ] );
<monoid of 7x7 integer matrices with 2 generators>
gap> T := AsMonoid(IsPBRMonoid, S);
<pbr monoid of size 7, degree 7 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid: 
#   convert from IsTropicalMaxPlusMatrixMonoid to IsPBRMonoid
gap> S := Monoid( [ Matrix(IsTropicalMaxPlusMatrix, [ [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0 ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, -infinity, 0 ] ], 3), Matrix(IsTropicalMaxPlusMatrix, [ [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ] ], 3) ] );
<monoid of 7x7 tropical max-plus matrices with 2 generators>
gap> T := AsMonoid(IsPBRMonoid, S);
<pbr monoid of size 7, degree 7 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid: 
#   convert from IsTropicalMinPlusMatrixMonoid to IsPBRMonoid
gap> S := Monoid( [ Matrix(IsTropicalMinPlusMatrix, [ [ infinity, 0, infinity, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, 0, infinity ], [ infinity, infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, infinity, 0 ], [ infinity, infinity, infinity, infinity, infinity, 0, infinity ], [ infinity, infinity, infinity, infinity, infinity, infinity, 0 ] ], 5), Matrix(IsTropicalMinPlusMatrix, [ [ infinity, infinity, 0, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity, infinity ] ], 5) ] );
<monoid of 7x7 tropical min-plus matrices with 2 generators>
gap> T := AsMonoid(IsPBRMonoid, S);
<pbr monoid of size 7, degree 7 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid: 
#   convert from IsNTPMatrixMonoid to IsPBRMonoid
gap> S := Monoid( [ Matrix(IsNTPMatrix, [ [ 0, 1, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 1 ], [ 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 0, 1 ] ], 5, 1), Matrix(IsNTPMatrix, [ [ 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0 ], [ 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0 ], [ 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0 ] ], 5, 1) ] );
<monoid of 7x7 ntp matrices with 2 generators>
gap> T := AsMonoid(IsPBRMonoid, S);
<pbr monoid of size 7, degree 7 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsReesMatrixSemigroup to IsPBRSemigroup
gap> R := ReesMatrixSemigroup(Group([(1, 2)]), [[(1, 2), (1, 2)], [(), ()]]);
<Rees matrix semigroup 2x2 over Group([ (1,2) ])>
gap> T := AsSemigroup(IsPBRSemigroup, R);
<pbr semigroup of size 8, degree 9 with 2 generators>
gap> Size(R) = Size(T);
true
gap> NrDClasses(R) = NrDClasses(T);
true
gap> NrRClasses(R) = NrRClasses(T);
true
gap> NrLClasses(R) = NrLClasses(T);
true
gap> NrIdempotents(R) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, R);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid
#   convert from IsReesMatrixSemigroup to IsPBRMonoid
gap> R := ReesMatrixSemigroup(Group([(1, 2)]), [[(1, 2)]]);
<Rees matrix semigroup 1x1 over Group([ (1,2) ])>
gap> T := AsMonoid(IsPBRMonoid, R);
<commutative pbr monoid of size 2, degree 2 with 1 generator>
gap> Size(R) = Size(T);
true
gap> NrDClasses(R) = NrDClasses(T);
true
gap> NrRClasses(R) = NrRClasses(T);
true
gap> NrLClasses(R) = NrLClasses(T);
true
gap> NrIdempotents(R) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, R);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsReesZeroMatrixSemigroup to IsPBRSemigroup
gap> R := ReesZeroMatrixSemigroup(Group([(1, 2)]), 
>                                 [[(1, 2), (1, 2)], [0, ()]]);
<Rees 0-matrix semigroup 2x2 over Group([ (1,2) ])>
gap> T := AsSemigroup(IsPBRSemigroup, R);
<pbr semigroup of size 9, degree 10 with 3 generators>
gap> Size(R) = Size(T);
true
gap> NrDClasses(R) = NrDClasses(T);
true
gap> NrRClasses(R) = NrRClasses(T);
true
gap> NrLClasses(R) = NrLClasses(T);
true
gap> NrIdempotents(R) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, R);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsMonoid
#   convert from IsReesZeroMatrixSemigroup to IsPBRMonoid
gap> R := ReesZeroMatrixSemigroup(Group([(1, 2)]), [[(1, 2)]]);
<Rees 0-matrix semigroup 1x1 over Group([ (1,2) ])>
gap> T := AsMonoid(IsPBRMonoid, R);
<pbr monoid of size 3, degree 3 with 2 generators>
gap> Size(R) = Size(T);
true
gap> NrDClasses(R) = NrDClasses(T);
true
gap> NrRClasses(R) = NrRClasses(T);
true
gap> NrLClasses(R) = NrLClasses(T);
true
gap> NrIdempotents(R) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, R);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from graph inverse to IsPBRSemigroup
gap> S := GraphInverseSemigroup(Digraph([[2],[]]));
<finite graph inverse semigroup with 2 vertices, 1 edge>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr semigroup of size 6, degree 7 with 4 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from free band to IsPBRSemigroup
gap> S := FreeBand(2); 
<free band on the generators [ x1, x2 ]>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr semigroup of size 6, degree 7 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from perm group to IsPBRSemigroup
gap> S := DihedralGroup(IsPermGroup, 6);
Group([ (1,2,3), (2,3) ])
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr semigroup of degree 3 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from perm group to IsPBRMonoid
gap> S := DihedralGroup(IsPermGroup, 6);
Group([ (1,2,3), (2,3) ])
gap> T := AsMonoid(IsPBRMonoid, S);
<pbr monoid of degree 3 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from non-perm group to IsPBRSemigroup
gap> S := DihedralGroup(6);
<pc group of size 6 with 2 generators>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr semigroup of size 6, degree 6 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from non-perm group to IsPBRMonoid
gap> S := DihedralGroup(6);
<pc group of size 6 with 2 generators>
gap> T := AsMonoid(IsPBRMonoid, S);
<pbr monoid of size 6, degree 6 with 2 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsBlockBijectionSemigroup to IsPBRSemigroup
gap> S := InverseSemigroup(Bipartition([[1, -1, -3], [2, 3, -2]]));;
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr semigroup of degree 3 with 2 generators>
gap> IsInverseSemigroup(T);
true
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsBlockBijectionMonoid to IsPBRMonoid
gap> S := InverseMonoid([Bipartition([[1, -1, -3], [2, 3, -2]])]);;
gap> T := AsMonoid(IsPBRMonoid, S);
<pbr monoid of size 6, degree 6 with 2 generators>
gap> IsInverseMonoid(T);
true
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsBlockBijectionMonoid to IsPBRSemigroup
gap> S := InverseMonoid([Bipartition([[1, -1, -3], [2, 3, -2]])]);;
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr semigroup of degree 3 with 3 generators>
gap> IsInverseSemigroup(T) and IsMonoidAsSemigroup(T);
true
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsPartialPermSemigroup to IsPBRSemigroup
gap> S := InverseSemigroup(PartialPerm([1, 2], [2, 1]),
>                          PartialPerm([1, 2], [3, 1]));
<inverse partial perm semigroup of rank 3 with 2 generators>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr semigroup of degree 4 with 3 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsPartialPermMonoid to IsPBRMonoid
gap> S := InverseMonoid(PartialPerm([1, 2], [2, 1]),
>                       PartialPerm([1, 2], [3, 1]));
<inverse partial perm monoid of rank 3 with 2 generators>
gap> T := AsMonoid(IsPBRMonoid, S);
<pbr monoid of degree 4 with 3 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismMonoid(IsPBRMonoid, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsPartialPermMonoid to IsPBRSemigroup
gap> S := InverseMonoid(PartialPerm([1, 2], [2, 1]),
>                       PartialPerm([1, 2], [3, 1]));
<inverse partial perm monoid of rank 3 with 2 generators>
gap> T := AsSemigroup(IsPBRSemigroup, S);
<pbr monoid of degree 4 with 3 generators>
gap> Size(S) = Size(T);
true
gap> NrDClasses(S) = NrDClasses(T);
true
gap> NrRClasses(S) = NrRClasses(T);
true
gap> NrLClasses(S) = NrLClasses(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true
gap> map := IsomorphismSemigroup(IsPBRSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# SEMIGROUPS_UnbindVariables
gap> Unbind(BruteForceInverseCheck);
gap> Unbind(BruteForceIsoCheck);
gap> Unbind(F);
gap> Unbind(S);
gap> Unbind(T);
gap> Unbind(map);
gap> Unbind(rels);
gap> Unbind(x);
gap> Unbind(y);

#E# 
gap> STOP_TEST("Semigroups package: standard/semipbr.tst");
