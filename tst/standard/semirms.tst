############################################################################
##
#W  standard/semirms.tst
#Y  Copyright (C) 2015-16                                James D. Mitchell
##                                                       Wilfred A. Wilson
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##
gap> START_TEST("Semigroups package: standard/semirms.tst");
gap> LoadPackage("semigroups", false);;

#
gap> SEMIGROUPS.StartTest();;

#T# helper functions
gap> BruteForceIsoCheck := function(iso)
>   local x, y;
>   if not IsInjective(iso) or not IsSurjective(iso) then
>     return false;
>   fi;
>   for x in Source(iso) do
>     for y in Source(iso) do
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
#   convert from IsPBRSemigroup to IsReesMatrixSemigroup
gap> S := Semigroup( [ PBR([ [ -1 ], [ -5 ], [ -1 ], [ -1 ], [ -5 ], [ -5 ], [ -1 ] ], [ [ 1, 3, 4, 7 ], [ ], [ ], [ ], [ 2, 5, 6 ], [ ], [ ] ]), PBR([ [ -4 ], [ -2 ], [ -4 ], [ -4 ], [ -2 ], [ -2 ], [ -2 ] ], [ [ ], [ 2, 5, 6, 7 ], [ ], [ 1, 3, 4 ], [ ], [ ], [ ] ]), PBR([ [ -3 ], [ -6 ], [ -3 ], [ -3 ], [ -6 ], [ -6 ], [ -3 ] ], [ [ ], [ ], [ 1, 3, 4, 7 ], [ ], [ ], [ 2, 5, 6 ], [ ] ]) ] );
<pbr semigroup of degree 7 with 3 generators>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 2x3 over Group(())>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsFpSemigroup to IsReesMatrixSemigroup
gap> F := FreeSemigroup(3);; AssignGeneratorVariables(F);;
gap> rels := [ [ s1^2, s1 ], [ s1*s3, s3 ], [ s2^2, s2 ], [ s3*s1, s1 ], [ s3*s2, s1*s2 ], [ s3^2, s3 ], [ s1*s2*s1, s1 ], [ s1*s2*s3, s3 ], [ s2*s1*s2, s2 ] ];;
gap> S := F / rels;
<fp semigroup on the generators [ s1, s2, s3 ]>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 2x3 over Group(())>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsBipartitionSemigroup to IsReesMatrixSemigroup
gap> S := Semigroup( [ Bipartition([ [ 1, 3, 4, 7, -1 ], [ 2, 5, 6, -5 ], [ -2 ], [ -3 ], [ -4 ], [ -6 ], [ -7 ] ]), Bipartition([ [ 1, 3, 4, -4 ], [ 2, 5, 6, 7, -2 ], [ -1 ], [ -3 ], [ -5 ], [ -6 ], [ -7 ] ]), Bipartition([ [ 1, 3, 4, 7, -3 ], [ 2, 5, 6, -6 ], [ -1 ], [ -2 ], [ -4 ], [ -5 ], [ -7 ] ]) ] );
<bipartition semigroup of degree 7 with 3 generators>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 2x3 over Group(())>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsTransformationSemigroup to IsReesMatrixSemigroup
gap> S := Semigroup( [ Transformation( [ 1, 5, 1, 1, 5, 5, 1 ] ), Transformation( [ 4, 2, 4, 4, 2, 2, 2 ] ), Transformation( [ 3, 6, 3, 3, 6, 6, 3 ] ) ] );
<transformation semigroup of degree 7 with 3 generators>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 2x3 over Group(())>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsBooleanMatSemigroup to IsReesMatrixSemigroup
gap> S := Semigroup( [ Matrix(IsBooleanMat, [ [ true, false, false, false, false, false, false ], [ false, false, false, false, true, false, false ], [ true, false, false, false, false, false, false ], [ true, false, false, false, false, false, false ], [ false, false, false, false, true, false, false ], [ false, false, false, false, true, false, false ], [ true, false, false, false, false, false, false ] ]), Matrix(IsBooleanMat, [ [ false, false, false, true, false, false, false ], [ false, true, false, false, false, false, false ], [ false, false, false, true, false, false, false ], [ false, false, false, true, false, false, false ], [ false, true, false, false, false, false, false ], [ false, true, false, false, false, false, false ], [ false, true, false, false, false, false, false ] ]), Matrix(IsBooleanMat, [ [ false, false, true, false, false, false, false ], [ false, false, false, false, false, true, false ], [ false, false, true, false, false, false, false ], [ false, false, true, false, false, false, false ], [ false, false, false, false, false, true, false ], [ false, false, false, false, false, true, false ], [ false, false, true, false, false, false, false ] ]) ] );
<semigroup of 7x7 boolean matrices with 3 generators>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 2x3 over Group(())>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsMaxPlusMatrixSemigroup to IsReesMatrixSemigroup
gap> S := Semigroup( [ Matrix(IsMaxPlusMatrix, [ [ 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ] ]), Matrix(IsMaxPlusMatrix, [ [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ] ]), Matrix(IsMaxPlusMatrix, [ [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ] ]) ] );
<semigroup of 7x7 max-plus matrices with 3 generators>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 2x3 over Group(())>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsMinPlusMatrixSemigroup to IsReesMatrixSemigroup
gap> S := Semigroup( [ Matrix(IsMinPlusMatrix, [ [ 0, infinity, infinity, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity, infinity ], [ 0, infinity, infinity, infinity, infinity, infinity, infinity ], [ 0, infinity, infinity, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity, infinity ], [ 0, infinity, infinity, infinity, infinity, infinity, infinity ] ]), Matrix(IsMinPlusMatrix, [ [ infinity, infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity, infinity, infinity ] ]), Matrix(IsMinPlusMatrix, [ [ infinity, infinity, 0, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, 0, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, 0, infinity ], [ infinity, infinity, infinity, infinity, infinity, 0, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity, infinity ] ]) ] );
<semigroup of 7x7 min-plus matrices with 3 generators>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 2x3 over Group(())>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsProjectiveMaxPlusMatrixSemigroup to IsReesMatrixSemigroup
gap> S := Semigroup( [ Matrix(IsProjectiveMaxPlusMatrix, [ [ 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ] ]), Matrix(IsProjectiveMaxPlusMatrix, [ [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ] ]), Matrix(IsProjectiveMaxPlusMatrix, [ [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ] ]) ] );
<semigroup of 7x7 projective max-plus matrices with 3 generators>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 2x3 over Group(())>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsIntegerMatrixSemigroup to IsReesMatrixSemigroup
gap> S := Semigroup( [ Matrix(IsIntegerMatrix, [ [ 1, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0 ], [ 1, 0, 0, 0, 0, 0, 0 ], [ 1, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0 ], [ 1, 0, 0, 0, 0, 0, 0 ] ]), Matrix(IsIntegerMatrix, [ [ 0, 0, 0, 1, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0, 0 ] ]), Matrix(IsIntegerMatrix, [ [ 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 1, 0, 0, 0, 0 ] ]) ] );
<semigroup of 7x7 integer matrices with 3 generators>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 2x3 over Group(())>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsTropicalMaxPlusMatrixSemigroup to IsReesMatrixSemigroup
gap> S := Semigroup( [ Matrix(IsTropicalMaxPlusMatrix, [ [ 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity, -infinity, -infinity ] ], 1), Matrix(IsTropicalMaxPlusMatrix, [ [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity, -infinity ] ], 1), Matrix(IsTropicalMaxPlusMatrix, [ [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity, -infinity ] ], 1) ] );
<semigroup of 7x7 tropical max-plus matrices with 3 generators>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 2x3 over Group(())>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsTropicalMinPlusMatrixSemigroup to IsReesMatrixSemigroup
gap> S := Semigroup( [ Matrix(IsTropicalMinPlusMatrix, [ [ 0, infinity, infinity, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity, infinity ], [ 0, infinity, infinity, infinity, infinity, infinity, infinity ], [ 0, infinity, infinity, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity, infinity ], [ 0, infinity, infinity, infinity, infinity, infinity, infinity ] ], 3), Matrix(IsTropicalMinPlusMatrix, [ [ infinity, infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity, infinity, infinity ] ], 3), Matrix(IsTropicalMinPlusMatrix, [ [ infinity, infinity, 0, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, 0, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity, infinity ], [ infinity, infinity, infinity, infinity, infinity, 0, infinity ], [ infinity, infinity, infinity, infinity, infinity, 0, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity, infinity ] ], 3) ] );
<semigroup of 7x7 tropical min-plus matrices with 3 generators>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 2x3 over Group(())>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsNTPMatrixSemigroup to IsReesMatrixSemigroup
gap> S := Semigroup( [ Matrix(IsNTPMatrix, [ [ 1, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0 ], [ 1, 0, 0, 0, 0, 0, 0 ], [ 1, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0 ], [ 1, 0, 0, 0, 0, 0, 0 ] ], 4, 1), Matrix(IsNTPMatrix, [ [ 0, 0, 0, 1, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0, 0 ] ], 4, 1), Matrix(IsNTPMatrix, [ [ 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 1, 0, 0, 0, 0 ] ], 4, 1) ] );
<semigroup of 7x7 ntp matrices with 3 generators>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 2x3 over Group(())>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsPBRSemigroup to IsReesZeroMatrixSemigroup
gap> S := Semigroup( [ PBR([ [ -4 ], [ -5 ], [ -3 ], [ -1 ], [ -2 ], [ -1 ] ], [ [ 4, 6 ], [ 5 ], [ 3 ], [ 1 ], [ 2 ], [ ] ]), PBR([ [ -1 ], [ -2 ], [ -3 ], [ -4 ], [ -5 ], [ -2 ] ], [ [ 1 ], [ 2, 6 ], [ 3 ], [ 4 ], [ 5 ], [ ] ]), PBR([ [ -3 ], [ -3 ], [ -3 ], [ -3 ], [ -3 ], [ -3 ] ], [ [ ], [ ], [ 1, 2, 3, 4, 5, 6 ], [ ], [ ], [ ] ]) ] );
<pbr semigroup of degree 6 with 3 generators>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 2x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsFpSemigroup to IsReesZeroMatrixSemigroup
gap> F := FreeSemigroup(3);; AssignGeneratorVariables(F);;
gap> rels := [ [ s1*s2, s1 ], [ s1*s3, s3 ], [ s2^2, s2 ], [ s2*s3, s3 ], [ s3*s1, s3 ], [ s3*s2, s3 ], [ s3^2, s3 ], [ s1^3, s1 ], [ s2*s1^2, s2 ] ];;
gap> S := F / rels;
<fp semigroup on the generators [ s1, s2, s3 ]>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 2x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsBipartitionSemigroup to IsReesZeroMatrixSemigroup
gap> S := Semigroup( [ Bipartition([ [ 1, -4 ], [ 2, -5 ], [ 3, -3 ], [ 4, 6, -1 ], [ 5, -2 ], [ -6 ] ]), Bipartition([ [ 1, -1 ], [ 2, 6, -2 ], [ 3, -3 ], [ 4, -4 ], [ 5, -5 ], [ -6 ] ]), Bipartition([ [ 1, 2, 3, 4, 5, 6, -3 ], [ -1 ], [ -2 ], [ -4 ], [ -5 ], [ -6 ] ]) ] );
<bipartition semigroup of degree 6 with 3 generators>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> (IsActingSemigroup(S) and UnderlyingSemigroup(T) = Group((1,4)(2,5))) 
> or (not IsActingSemigroup(S) and  UnderlyingSemigroup(T) = Group((1,2)));
true
gap> Length(Rows(T)) = 2 and Length(Columns(T)) = 1;
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsTransformationSemigroup to IsReesZeroMatrixSemigroup
gap> S := Semigroup( [ Transformation( [ 4, 5, 3, 1, 2, 1 ] ), Transformation( [ 1, 2, 3, 4, 5, 2 ] ), Transformation( [ 3, 3, 3, 3, 3, 3 ] ) ] );
<transformation semigroup of degree 6 with 3 generators>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);; 
gap> (IsActingSemigroup(S) and UnderlyingSemigroup(T) = Group((1,4)(2,5))) 
> or (not IsActingSemigroup(S) and  UnderlyingSemigroup(T) = Group((1,2)));
true
gap> Length(Rows(T)) = 2 and Length(Columns(T)) = 1;
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsBooleanMatSemigroup to IsReesZeroMatrixSemigroup
gap> S := Semigroup( [ Matrix(IsBooleanMat, [ [ false, false, false, true, false, false ], [ false, false, false, false, true, false ], [ false, false, true, false, false, false ], [ true, false, false, false, false, false ], [ false, true, false, false, false, false ], [ true, false, false, false, false, false ] ]), Matrix(IsBooleanMat, [ [ true, false, false, false, false, false ], [ false, true, false, false, false, false ], [ false, false, true, false, false, false ], [ false, false, false, true, false, false ], [ false, false, false, false, true, false ], [ false, true, false, false, false, false ] ]), Matrix(IsBooleanMat, [ [ false, false, true, false, false, false ], [ false, false, true, false, false, false ], [ false, false, true, false, false, false ], [ false, false, true, false, false, false ], [ false, false, true, false, false, false ], [ false, false, true, false, false, false ] ]) ] );
<semigroup of 6x6 boolean matrices with 3 generators>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 2x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsMaxPlusMatrixSemigroup to IsReesZeroMatrixSemigroup
gap> S := Semigroup( [ Matrix(IsMaxPlusMatrix, [ [ -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity, -infinity ] ]), Matrix(IsMaxPlusMatrix, [ [ 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity ] ]), Matrix(IsMaxPlusMatrix, [ [ -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity ] ]) ] );
<semigroup of 6x6 max-plus matrices with 3 generators>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 2x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsMinPlusMatrixSemigroup to IsReesZeroMatrixSemigroup
gap> S := Semigroup( [ Matrix(IsMinPlusMatrix, [ [ infinity, infinity, infinity, 0, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity ], [ 0, infinity, infinity, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity, infinity ], [ 0, infinity, infinity, infinity, infinity, infinity ] ]), Matrix(IsMinPlusMatrix, [ [ 0, infinity, infinity, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, infinity, 0, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity ], [ infinity, 0, infinity, infinity, infinity, infinity ] ]), Matrix(IsMinPlusMatrix, [ [ infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity ] ]) ] );
<semigroup of 6x6 min-plus matrices with 3 generators>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 2x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsProjectiveMaxPlusMatrixSemigroup to IsReesZeroMatrixSemigroup
gap> S := Semigroup( [ Matrix(IsProjectiveMaxPlusMatrix, [ [ -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity, -infinity ] ]), Matrix(IsProjectiveMaxPlusMatrix, [ [ 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity ] ]), Matrix(IsProjectiveMaxPlusMatrix, [ [ -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity ] ]) ] );
<semigroup of 6x6 projective max-plus matrices with 3 generators>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 2x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsIntegerMatrixSemigroup to IsReesZeroMatrixSemigroup
gap> S := Semigroup( [ Matrix(IsIntegerMatrix, [ [ 0, 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 1, 0 ], [ 0, 0, 1, 0, 0, 0 ], [ 1, 0, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0 ], [ 1, 0, 0, 0, 0, 0 ] ]), Matrix(IsIntegerMatrix, [ [ 1, 0, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 1, 0 ], [ 0, 1, 0, 0, 0, 0 ] ]), Matrix(IsIntegerMatrix, [ [ 0, 0, 1, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0 ] ]) ] );
<semigroup of 6x6 integer matrices with 3 generators>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 2x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsTropicalMaxPlusMatrixSemigroup to IsReesZeroMatrixSemigroup
gap> S := Semigroup( [ Matrix(IsTropicalMaxPlusMatrix, [ [ -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ 0, -infinity, -infinity, -infinity, -infinity, -infinity ] ], 1), Matrix(IsTropicalMaxPlusMatrix, [ [ 0, -infinity, -infinity, -infinity, -infinity, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, -infinity, 0, -infinity, -infinity ], [ -infinity, -infinity, -infinity, -infinity, 0, -infinity ], [ -infinity, 0, -infinity, -infinity, -infinity, -infinity ] ], 1), Matrix(IsTropicalMaxPlusMatrix, [ [ -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity ], [ -infinity, -infinity, 0, -infinity, -infinity, -infinity ] ], 1) ] );
<semigroup of 6x6 tropical max-plus matrices with 3 generators>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 2x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsTropicalMinPlusMatrixSemigroup to IsReesZeroMatrixSemigroup
gap> S := Semigroup( [ Matrix(IsTropicalMinPlusMatrix, [ [ infinity, infinity, infinity, 0, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity ], [ 0, infinity, infinity, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity, infinity ], [ 0, infinity, infinity, infinity, infinity, infinity ] ], 3), Matrix(IsTropicalMinPlusMatrix, [ [ 0, infinity, infinity, infinity, infinity, infinity ], [ infinity, 0, infinity, infinity, infinity, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, infinity, 0, infinity, infinity ], [ infinity, infinity, infinity, infinity, 0, infinity ], [ infinity, 0, infinity, infinity, infinity, infinity ] ], 3), Matrix(IsTropicalMinPlusMatrix, [ [ infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity ], [ infinity, infinity, 0, infinity, infinity, infinity ] ], 3) ] );
<semigroup of 6x6 tropical min-plus matrices with 3 generators>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 2x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsNTPMatrixSemigroup to IsReesZeroMatrixSemigroup
gap> S := Semigroup( [ Matrix(IsNTPMatrix, [ [ 0, 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 1, 0 ], [ 0, 0, 1, 0, 0, 0 ], [ 1, 0, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0 ], [ 1, 0, 0, 0, 0, 0 ] ], 4, 1), Matrix(IsNTPMatrix, [ [ 1, 0, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 1, 0 ], [ 0, 1, 0, 0, 0, 0 ] ], 4, 1), Matrix(IsNTPMatrix, [ [ 0, 0, 1, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0 ] ], 4, 1) ] );
<semigroup of 6x6 ntp matrices with 3 generators>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 2x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsPBRMonoid to IsReesZeroMatrixSemigroup
gap> S := Monoid( [ PBR([ [ -3 ], [ -2 ], [ -1 ] ], [ [ 3 ], [ 2 ], [ 1 ] ]), PBR([ [ -2 ], [ -2 ], [ -2 ] ], [ [ ], [ 1, 2, 3 ], [ ] ]) ] );
<pbr monoid of degree 3 with 2 generators>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsFpMonoid to IsReesZeroMatrixSemigroup
gap> F := FreeMonoid(2);; AssignGeneratorVariables(F);;
gap> rels := [ [ m1^2, One(F) ], [ m1*m2, m2 ], [ m2*m1, m2 ], [ m2^2, m2 ] ];;
gap> S := F / rels;
<fp monoid on the generators [ m1, m2 ]>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsBipartitionMonoid to IsReesZeroMatrixSemigroup
gap> S := Monoid( [ Bipartition([ [ 1, -3 ], [ 2, -2 ], [ 3, -1 ] ]), Bipartition([ [ 1, 2, 3, -2 ], [ -1 ], [ -3 ] ]) ] );
<bipartition monoid of degree 3 with 2 generators>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> (IsActingSemigroup(S) and UnderlyingSemigroup(T) = Group([ (1,3) ])) 
> or (not IsActingSemigroup(S) and UnderlyingSemigroup(T) = Group([(1,2)]));
true
gap> Length(Rows(T)) = 1 and Length(Columns(T)) = 1;
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsTransformationMonoid to IsReesZeroMatrixSemigroup
gap> S := Monoid( [ Transformation( [ 3, 2, 1 ] ), Transformation( [ 2, 2, 2 ] ) ] );
<transformation monoid of degree 3 with 2 generators>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> (IsActingSemigroup(S) and UnderlyingSemigroup(T) = Group([ (1,3) ])) 
> or (not IsActingSemigroup(S) and UnderlyingSemigroup(T) = Group([(1,2)]));
true
gap> Length(Rows(T)) = 1 and Length(Columns(T)) = 1;
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsBooleanMatMonoid to IsReesZeroMatrixSemigroup
gap> S := Monoid( [ Matrix(IsBooleanMat, [ [ false, false, true ], [ false, true, false ], [ true, false, false ] ]), Matrix(IsBooleanMat, [ [ false, true, false ], [ false, true, false ], [ false, true, false ] ]) ] );
<monoid of 3x3 boolean matrices with 2 generators>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsMaxPlusMatrixMonoid to IsReesZeroMatrixSemigroup
gap> S := Monoid( [ Matrix(IsMaxPlusMatrix, [ [ -infinity, -infinity, 0 ], [ -infinity, 0, -infinity ], [ 0, -infinity, -infinity ] ]), Matrix(IsMaxPlusMatrix, [ [ -infinity, 0, -infinity ], [ -infinity, 0, -infinity ], [ -infinity, 0, -infinity ] ]) ] );
<monoid of 3x3 max-plus matrices with 2 generators>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsMinPlusMatrixMonoid to IsReesZeroMatrixSemigroup
gap> S := Monoid( [ Matrix(IsMinPlusMatrix, [ [ infinity, infinity, 0 ], [ infinity, 0, infinity ], [ 0, infinity, infinity ] ]), Matrix(IsMinPlusMatrix, [ [ infinity, 0, infinity ], [ infinity, 0, infinity ], [ infinity, 0, infinity ] ]) ] );
<monoid of 3x3 min-plus matrices with 2 generators>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsProjectiveMaxPlusMatrixMonoid to IsReesZeroMatrixSemigroup
gap> S := Monoid( [ Matrix(IsProjectiveMaxPlusMatrix, [ [ -infinity, -infinity, 0 ], [ -infinity, 0, -infinity ], [ 0, -infinity, -infinity ] ]), Matrix(IsProjectiveMaxPlusMatrix, [ [ -infinity, 0, -infinity ], [ -infinity, 0, -infinity ], [ -infinity, 0, -infinity ] ]) ] );
<monoid of 3x3 projective max-plus matrices with 2 generators>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsIntegerMatrixMonoid to IsReesZeroMatrixSemigroup
gap> S := Monoid( [ Matrix(IsIntegerMatrix, [ [ 0, 0, 1 ], [ 0, 1, 0 ], [ 1, 0, 0 ] ]), Matrix(IsIntegerMatrix, [ [ 0, 1, 0 ], [ 0, 1, 0 ], [ 0, 1, 0 ] ]) ] );
<monoid of 3x3 integer matrices with 2 generators>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsTropicalMaxPlusMatrixMonoid to IsReesZeroMatrixSemigroup
gap> S := Monoid( [ Matrix(IsTropicalMaxPlusMatrix, [ [ -infinity, -infinity, 0 ], [ -infinity, 0, -infinity ], [ 0, -infinity, -infinity ] ], 1), Matrix(IsTropicalMaxPlusMatrix, [ [ -infinity, 0, -infinity ], [ -infinity, 0, -infinity ], [ -infinity, 0, -infinity ] ], 1) ] );
<monoid of 3x3 tropical max-plus matrices with 2 generators>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsTropicalMinPlusMatrixMonoid to IsReesZeroMatrixSemigroup
gap> S := Monoid( [ Matrix(IsTropicalMinPlusMatrix, [ [ infinity, infinity, 0 ], [ infinity, 0, infinity ], [ 0, infinity, infinity ] ], 3), Matrix(IsTropicalMinPlusMatrix, [ [ infinity, 0, infinity ], [ infinity, 0, infinity ], [ infinity, 0, infinity ] ], 3) ] );
<monoid of 3x3 tropical min-plus matrices with 2 generators>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsNTPMatrixMonoid to IsReesZeroMatrixSemigroup
gap> S := Monoid( [ Matrix(IsNTPMatrix, [ [ 0, 0, 1 ], [ 0, 1, 0 ], [ 1, 0, 0 ] ], 4, 1), Matrix(IsNTPMatrix, [ [ 0, 1, 0 ], [ 0, 1, 0 ], [ 0, 1, 0 ] ], 4, 1) ] );
<monoid of 3x3 ntp matrices with 2 generators>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsFpMonoid to IsReesZeroMatrixSemigroup
gap> F := FreeMonoid(1);; AssignGeneratorVariables(F);;
gap> rels := [ [ m1^2, m1 ] ];;
gap> S := F / rels;
<fp monoid on the generators [ m1 ]>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 1x1 over Group(())>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsPBRMonoid to IsReesMatrixSemigroup
gap> S := Monoid( [ PBR([ [ -2 ], [ -1 ] ], [ [ 2 ], [ 1 ] ]) ] );
<commutative pbr monoid of degree 2 with 1 generator>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsFpMonoid to IsReesMatrixSemigroup
gap> F := FreeMonoid(1);; AssignGeneratorVariables(F);;
gap> rels := [ [ m1^2, One(F) ] ];;
gap> S := F / rels;
<fp monoid on the generators [ m1 ]>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsBipartitionMonoid to IsReesMatrixSemigroup
gap> S := InverseMonoid( [ Bipartition([ [ 1, -1 ], [ 2, -2 ] ]), Bipartition([ [ 1, -2 ], [ 2, -1 ] ]) ] );
<block bijection group of degree 2 with 1 generator>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsBipartitionSemigroup to IsReesMatrixSemigroup
gap> S := InverseSemigroup( [ Bipartition([ [ 1, -1 ], [ 2, -2 ] ]), Bipartition([ [ 1, -2 ], [ 2, -1 ] ]) ] );
<block bijection group of degree 2 with 1 generator>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsBipartitionMonoid to IsReesZeroMatrixSemigroup
gap> S := InverseMonoid(Bipartition([[1, -1], [2, -2]]), 
> Bipartition([[1, -2], [2, -1]]),
> Bipartition([[1, 2, -1, -2]]));
<inverse block bijection monoid of degree 2 with 2 generators>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsBipartitionSemigroup to IsReesZeroMatrixSemigroup
gap> S := InverseSemigroup(Bipartition([[1, -1], [2, -2]]), 
> Bipartition([[1, -2], [2, -1]]),
> Bipartition([[1, 2, -1, -2]]));
<inverse block bijection monoid of degree 2 with 2 generators>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsPartialPermSemigroup to IsReesMatrixSemigroup
gap> S := InverseSemigroup(PartialPerm([1, 2], [2, 1]));;
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsPartialPermMonoid to IsReesMatrixSemigroup
gap> S := InverseMonoid(PartialPerm([1, 2], [2, 1]));;
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsPartialPermSemigroup to IsReesZeroMatrixSemigroup
gap> S := InverseSemigroup(PartialPerm([1, 2], [2, 1]), 
>                          PartialPerm([]));;
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsPartialPermMonoid to IsReesZeroMatrixSemigroup
gap> S := InverseMonoid(PartialPerm([1, 2], [2, 1]), 
>                       PartialPerm([]));;
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsTransformationMonoid to IsReesMatrixSemigroup
gap> S := Monoid( [ Transformation( [ 2, 1 ] ) ] );
<commutative transformation monoid of degree 2 with 1 generator>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsBooleanMatMonoid to IsReesMatrixSemigroup
gap> S := Monoid( [ Matrix(IsBooleanMat, [ [ false, true ], [ true, false ] ]) ] );
<commutative monoid of 2x2 boolean matrices with 1 generator>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsMaxPlusMatrixMonoid to IsReesMatrixSemigroup
gap> S := Monoid( [ Matrix(IsMaxPlusMatrix, [ [ -infinity, 0 ], [ 0, -infinity ] ]) ] );
<commutative monoid of 2x2 max-plus matrices with 1 generator>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsMinPlusMatrixMonoid to IsReesMatrixSemigroup
gap> S := Monoid( [ Matrix(IsMinPlusMatrix, [ [ infinity, 0 ], [ 0, infinity ] ]) ] );
<commutative monoid of 2x2 min-plus matrices with 1 generator>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsProjectiveMaxPlusMatrixMonoid to IsReesMatrixSemigroup
gap> S := Monoid( [ Matrix(IsProjectiveMaxPlusMatrix, [ [ -infinity, 0 ], [ 0, -infinity ] ]) ] );
<commutative monoid of 2x2 projective max-plus matrices with 1 generator>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsIntegerMatrixMonoid to IsReesMatrixSemigroup
gap> S := Monoid( [ Matrix(IsIntegerMatrix, [ [ 0, 1 ], [ 1, 0 ] ]) ] );
<commutative monoid of 2x2 integer matrices with 1 generator>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsTropicalMaxPlusMatrixMonoid to IsReesMatrixSemigroup
gap> S := Monoid( [ Matrix(IsTropicalMaxPlusMatrix, [ [ -infinity, 0 ], [ 0, -infinity ] ], 1) ] );
<commutative monoid of 2x2 tropical max-plus matrices with 1 generator>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsTropicalMinPlusMatrixMonoid to IsReesMatrixSemigroup
gap> S := Monoid( [ Matrix(IsTropicalMinPlusMatrix, [ [ infinity, 0 ], [ 0, infinity ] ], 3) ] );
<commutative monoid of 2x2 tropical min-plus matrices with 1 generator>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsNTPMatrixMonoid to IsReesMatrixSemigroup
gap> S := Monoid( [ Matrix(IsNTPMatrix, [ [ 0, 1 ], [ 1, 0 ] ], 4, 1) ] );
<commutative monoid of 2x2 ntp matrices with 1 generator>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 1x1 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsFpMonoid to IsReesMatrixSemigroup
gap> F := FreeMonoid(0);; AssignGeneratorVariables(F);;
gap> rels := [ ];;
gap> S := F / rels;
<fp group on the generators [  ]>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 1x1 over Group(())>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsPermGroup to IsReesMatrixSemigroup
gap> S := DihedralGroup(IsPermGroup, 4);
Group([ (1,2), (3,4) ])
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 1x1 over Group([ (1,3)(2,4), (1,2)(3,4) ])>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsGroup to IsReesMatrixSemigroup
gap> S := DihedralGroup(4);
<pc group of size 4 with 2 generators>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 1x1 over Group([ (1,2)(3,4), (1,3)(2,4) ])>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsReesMatrixSemigroup to IsReesMatrixSemigroup
gap> S := ReesMatrixSemigroup(Group([(1, 2)]), [[(1, 2), (1, 2)], [(), ()]]);
<Rees matrix semigroup 2x2 over Group([ (1,2) ])>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 2x2 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsReesZeroMatrixSemigroup to IsReesZeroMatrixSemigroup
gap> S := ReesZeroMatrixSemigroup(Group([(1, 2)]),
>                                 [[(1, 2), (1, 2)], [0, ()]]);
<Rees 0-matrix semigroup 2x2 over Group([ (1,2) ])>
gap> T := AsSemigroup(IsReesZeroMatrixSemigroup, S);
<Rees 0-matrix semigroup 2x2 over Group([ (1,2) ])>
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
gap> map := IsomorphismSemigroup(IsReesZeroMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

#T# AsSemigroup: 
#   convert from IsGraphInverseSemigroup to IsReesMatrixSemigroup
gap> S := GraphInverseSemigroup(Digraph([[]]));
<finite graph inverse semigroup with 1 vertex, 0 edges>
gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
<Rees matrix semigroup 1x1 over Group(())>
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
gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
gap> BruteForceIsoCheck(map);
true
gap> BruteForceInverseCheck(map);
true

# FIXME this test currently fails since there are not enough methods for free
# band Green's classes.
#T# AsSemigroup: 
#   convert from a free band to IsReesMatrixSemigroup
#gap> S := FreeBand(1);
#<free band on the generators [ x1 ]>
#gap> T := AsSemigroup(IsReesMatrixSemigroup, S);
#<Rees matrix semigroup 1x1 over Group(())>
#gap> Size(S) = Size(T);
#true
#gap> NrDClasses(S) = NrDClasses(T);
#true
#gap> NrRClasses(S) = NrRClasses(T);
#true
#gap> NrLClasses(S) = NrLClasses(T);
#true
#gap> NrIdempotents(S) = NrIdempotents(T);
#true
#gap> map := IsomorphismSemigroup(IsReesMatrixSemigroup, S);;
#gap> BruteForceIsoCheck(map);
#true
#gap> BruteForceInverseCheck(map);
#true

#T# RMSNormalization 1:
# for a Rees matrix semigroup over a group without an inverse op
gap> G := Semigroup([
> Transformation([4, 4, 2, 3, 4]),
> Transformation([4, 4, 3, 2, 4])]);
<transformation semigroup of degree 5 with 2 generators>
gap> IsGroup(G);
false
gap> IsGroupAsSemigroup(G);
true
gap> mat := [
> [Transformation([4, 4, 2, 3, 4]), Transformation([4, 4, 3, 2, 4])],
> [Transformation([2, 2, 4, 3, 2]), Transformation([3, 3, 4, 2, 3])]];;
gap> R := ReesMatrixSemigroup(G, mat);
<Rees matrix semigroup 2x2 over <transformation group of degree 5 with
   2 generators>>
gap> iso := RMSNormalization(R);;
gap> inv := InverseGeneralMapping(iso);;
gap> ForAll(R, x -> (x ^ iso) ^ inv = x);
true

#T# RMSNormalization 2:
# for a Rees matrix semigroup over IsGroup
gap> R := ReesMatrixSemigroup(SymmetricGroup(4),
> [[(1, 3, 2), (), (1, 4, 2)],
>  [(), (1, 3)(2, 4), (1, 2, 3, 4)],
>  [(3, 4), (1, 3), (1, 2, 4, 3)],
>  [(), (2, 4, 3), (1, 2)]]);
<Rees matrix semigroup 3x4 over Sym( [ 1 .. 4 ] )>
gap> iso := RMSNormalization(R);;
gap> Matrix(Range(iso));
[ [ (), (), () ], [ (), (1,2,4), (1,4) ], [ (), (1,2)(3,4), (1,4)(2,3) ], 
  [ (), (1,3)(2,4), (1,4,3,2) ] ]

#T# RMSNormalization 3:
# error checking
gap> G := FullTransformationMonoid(4);;
gap> RMSNormalization(ReesMatrixSemigroup(G, [[IdentityTransformation]]));
Error, Semigroups: RMSNormalization: usage,
the underlying semigroup <G> of the Rees matrix semigroup <R> must be a group,

#T# RZMSNormalization 1:
# for a Rees 0-matrix semigroup over a group without an inverse op
gap> G := Semigroup([
> Transformation([1, 3, 2, 1]),
> Transformation([3, 1, 2, 3])]);
<transformation semigroup of degree 4 with 2 generators>
gap> IsGroup(G);
false
gap> IsGroupAsSemigroup(G);
true
gap> mat := [
> [Transformation([2, 1, 3, 2]), 0, 0],
> [0, 0, Transformation([2, 3, 1, 2])],
> [0, Transformation([3, 1, 2, 3]), Transformation([2, 3, 1, 2])]];;
gap> R := ReesZeroMatrixSemigroup(G, mat);
<Rees 0-matrix semigroup 3x3 over <transformation group of degree 4 with
   2 generators>>
gap> iso := RZMSNormalization(R);;
gap> inv := InverseGeneralMapping(iso);;
gap> ForAll(R, x -> (x ^ iso) ^ inv = x);
true

#T# RZMSNormalization 2:
# for a Rees 0-matrix semigroup over the symmetric group S4
gap> G := SymmetricGroup(4);;
gap> R := ReesZeroMatrixSemigroup(G,
> [[0, (1, 4)(2, 3), 0], [0, 0, (4, 2, 3)], [(2, 4, 3), 0, 0]]);
<Rees 0-matrix semigroup 3x3 over Sym( [ 1 .. 4 ] )>
gap> IsInverseSemigroup(R);
true
gap> iso := RZMSNormalization(R);
MappingByFunction( <Rees 0-matrix semigroup 3x3 over Sym( [ 1 .. 4 ] )>, 
<Rees 0-matrix semigroup 3x3 over Sym( [ 1 .. 4 ] )>
 , function( x ) ... end, function( x ) ... end )
gap> S := Range(iso);
<Rees 0-matrix semigroup 3x3 over Sym( [ 1 .. 4 ] )>
gap> Matrix(S);
[ [ (), 0, 0 ], [ 0, (), 0 ], [ 0, 0, () ] ]
gap> inv := InverseGeneralMapping(iso);;
gap> x := MultiplicativeZero(R) ^ iso;
0
gap> x ^ inv = MultiplicativeZero(R);
true
gap> x := RMSElement(R, 1, (), 1);
(1,(),1)
gap> x ^ iso;
(1,(2,4,3),2)
gap> (x ^ iso) ^ inv = x;
true
gap> G := SymmetricGroup(4);;
gap> mat := [
> [0, 0, (1, 3, 2), 0, (), 0, 0, (1, 2, 3)],
> [(), 0, 0, 0, 0, (1, 3, 4, 2), 0, (2, 4)],
> [0, 0, 0, (1, 2, 3), 0, 0, (1, 3, 2), 0],
> [0, 0, 0, 0, 0, 0, (1, 4, 2, 3), 0],
> [(), (1, 2, 3), (1, 2), 0, 0, 0, 0, 0],
> [0, (), 0, 0, 0, (1, 2), 0, 0]];;
gap> R := ReesZeroMatrixSemigroup(G, mat);
<Rees 0-matrix semigroup 8x6 over Sym( [ 1 .. 4 ] )>
gap> iso := RZMSNormalization(R);
MappingByFunction( <Rees 0-matrix semigroup 8x6 over Sym( [ 1 .. 4 ] )>, 
<Rees 0-matrix semigroup 8x6 over Sym( [ 1 .. 4 ] )>
 , function( x ) ... end, function( x ) ... end )
gap> S := Range(iso);
<Rees 0-matrix semigroup 8x6 over Sym( [ 1 .. 4 ] )>

# check that mat is in the 'normal' form
gap> mat := Matrix(S);
[ [ (), (), (), 0, 0, 0, 0, 0 ], [ (), 0, 0, (), (), 0, 0, 0 ], 
  [ 0, 0, (), (1,4,2), 0, (), 0, 0 ], [ 0, 0, 0, 0, (), (2,3,4), 0, 0 ], 
  [ 0, 0, 0, 0, 0, 0, (), () ], [ 0, 0, 0, 0, 0, 0, 0, () ] ]
gap> first_occurrence := l -> First([1 .. Length(l)], i -> l[i] <> 0);;
gap> x := Length(mat);;
gap> ForAll([1 .. x - 1],
> i -> first_occurrence(mat[i]) <= first_occurrence(mat[i + 1]));
true
gap> ForAll([1 .. Length(mat[1]) - 1], i ->
> first_occurrence(mat{[1 .. x]}[i]) <= first_occurrence(mat{[1 .. x]}[i + 1]));
true

# check that the connected components are grouped together
gap> comps := RZMSConnectedComponents(S);
[ [ [ 1, 2, 3, 4, 5, 6 ], [ 1, 2, 3, 4 ] ], [ [ 7, 8 ], [ 5, 6 ] ] ]
gap> Concatenation(List(comps, x -> x[1])) = Rows(R);
true
gap> Concatenation(List(comps, x -> x[2])) = Columns(R);
true

#T# RZMSNormalization 3:
# for a Rees 0-matrix semigroup over a non-IsGroup group,
# and a non-group semigroup
gap> T := FullTransformationMonoid(4);;
gap> G := GroupOfUnits(T);
<transformation group of degree 4 with 2 generators>
gap> R := ReesZeroMatrixSemigroup(T,
> [[0, IdentityTransformation], [IdentityTransformation, 0]]);
<Rees 0-matrix semigroup 2x2 over <full transformation monoid of degree 4>>
gap> RZMSNormalization(R);;
gap> Matrix(Range(last));
[ [ IdentityTransformation, 0 ], [ 0, IdentityTransformation ] ]
gap> R := ReesZeroMatrixSemigroup(G, [[Transformation([3, 1, 4, 2])]]);
<Rees 0-matrix semigroup 1x1 over <transformation group of degree 4 with
   2 generators>>
gap> RZMSNormalization(R);;
gap> Matrix(Range(last));
[ [ IdentityTransformation ] ]

#T# RZMSNormalization 4:
# for a Rees 0-matrix semigroup with some all-zero rows/columns
gap> G := Group(());;
gap> R := ReesZeroMatrixSemigroup(G, [[0, 0], [0, ()]]);;
gap> Matrix(Range(RZMSNormalization(R)));
[ [ (), 0 ], [ 0, 0 ] ]
gap> R := ReesZeroMatrixSemigroup(G, [[0, 0], [(), ()]]);;
gap> Matrix(Range(RZMSNormalization(R)));
[ [ (), () ], [ 0, 0 ] ]
gap> R := ReesZeroMatrixSemigroup(G, [[0, ()], [0, ()]]);;
gap> Matrix(Range(RZMSNormalization(R)));
[ [ (), 0 ], [ (), 0 ] ]

#T# IsInverseSemigroup for a Rees 0-matrix semigroup 1:
# easy true examples
gap> R := ReesZeroMatrixSemigroup(Group(()), [[()]]);
<Rees 0-matrix semigroup 1x1 over Group(())>
gap> IsInverseSemigroup(R);
true
gap> IsInverseSemigroup(AsSemigroup(IsTransformationSemigroup, R));
true

#
gap> T := Semigroup(Transformation([2, 1]));
<commutative transformation semigroup of degree 2 with 1 generator>
gap> IsGroupAsSemigroup(T);
true
gap> R := ReesZeroMatrixSemigroup(T, [[Transformation([2, 1])]]);
<Rees 0-matrix semigroup 1x1 over <transformation group of degree 2 with
   1 generator>>
gap> IsInverseSemigroup(R);
true
gap> IsInverseSemigroup(AsSemigroup(IsTransformationSemigroup, R));
true

#T# IsInverseSemigroup for a Rees 0-matrix semigroup 2:
# false because of underlying semigroup
gap> x := Transformation([1, 1, 2]);;
gap> T := Semigroup(x);;
gap> IsInverseSemigroup(T);
false
gap> R := ReesZeroMatrixSemigroup(T, [[0, x], [0, x ^ 2]]);
<Rees 0-matrix semigroup 2x2 over <commutative transformation semigroup of 
  degree 3 with 1 generator>>
gap> IsInverseSemigroup(R);
false
gap> IsInverseSemigroup(AsSemigroup(IsTransformationSemigroup, R));
false

# T is known not to be regular
gap> T := Semigroup(x);;
gap> IsRegularSemigroup(T);
false
gap> R := ReesZeroMatrixSemigroup(T, [[0, x], [0, x ^ 2]]);;
gap> IsInverseSemigroup(R);
false
gap> IsInverseSemigroup(AsSemigroup(IsTransformationSemigroup, R));
false

# T is known not to be a monoid
gap> T := Semigroup(x);;
gap> IsMonoidAsSemigroup(T);
false
gap> R := ReesZeroMatrixSemigroup(T, [[0, x], [0, x ^ 2]]);;
gap> IsInverseSemigroup(R);
false
gap> IsInverseSemigroup(AsSemigroup(IsTransformationSemigroup, R));
false

# T is known not to have group of units
gap> T := Semigroup(x);;
gap> GroupOfUnits(T);
fail
gap> R := ReesZeroMatrixSemigroup(T, [[0, x], [0, x ^ 2]]);;
gap> IsInverseSemigroup(R);
false
gap> IsInverseSemigroup(AsSemigroup(IsTransformationSemigroup, R));
false

# T does not have a group of units
gap> T := Semigroup(x);;
gap> R := ReesZeroMatrixSemigroup(T, [[x, 0], [0, x ^ 2]]);;
gap> IsInverseSemigroup(R);
false
gap> IsInverseSemigroup(AsSemigroup(IsTransformationSemigroup, R));
false

#T# IsInverseSemigroup for a Rees 0-matrix semigroup 3:
# false because of matrix
gap> S := Semigroup(SymmetricInverseMonoid(3));
<partial perm monoid of rank 3 with 4 generators>
gap> id := Identity(S);
<identity partial perm on [ 1, 2, 3 ]>
gap> zero := MultiplicativeZero(S);
<empty partial perm>

# Non-diagonal matrix: Rows or columns without precisely one non-zero entry
gap> R := ReesZeroMatrixSemigroup(S, [[0, id, 0], [id, 0, 0], [0, 0, 0]]);;
gap> IsInverseSemigroup(R);
false
gap> R := ReesZeroMatrixSemigroup(S, [[0, 0, 0], [id, 0, 0], [0, id, 0]]);;
gap> IsInverseSemigroup(R);
false
gap> R := ReesZeroMatrixSemigroup(S, [[0, 0, id], [id, id, 0], [0, id, 0]]);;
gap> IsInverseSemigroup(R);
false
gap> R := ReesZeroMatrixSemigroup(S, [[0, id, 0], [0, id, 0], [0, id, 0]]);;
gap> IsInverseSemigroup(R);
false
gap> R := ReesZeroMatrixSemigroup(S, [[id, 0, 0], [id, id, 0], [0, id, 0]]);;
gap> IsInverseSemigroup(R);
false
gap> R := ReesZeroMatrixSemigroup(S, [[zero, id]]);
<Rees 0-matrix semigroup 2x1 over <partial perm monoid of rank 3 with 4 
  generators>>
gap> IsInverseSemigroup(R); # Non-square matrix
false
gap> R := ReesZeroMatrixSemigroup(S, [[id, 0, 0], [0, 0, id], [0, zero, 0]]);;
gap> IsInverseSemigroup(R); # Matrix entries not in the group of units
false
gap> y := PartialPerm([1, 2, 0]);
<identity partial perm on [ 1, 2 ]>
gap> R := ReesZeroMatrixSemigroup(S, [[id, 0, 0], [0, 0, id], [0, y, 0]]);;
gap> IsInverseSemigroup(R);
false
gap> T := FullTransformationMonoid(3);;
gap> R := ReesZeroMatrixSemigroup(T, [[Identity(T)]]);;
gap> IsInverseSemigroup(R); # Semigroup is not an inverse monoid
false
gap> y := PartialPerm([3, 2, 1]);;
gap> R := ReesZeroMatrixSemigroup(S, [[id, 0, 0], [0, id, 0], [0, 0, y]]);;
gap> IsInverseSemigroup(R);
true

#T# NrIdempotents and Idempotents 1:
# for an inverse Rees 0-matrix semigroup
gap> S := SymmetricInverseMonoid(4);
<symmetric inverse monoid of degree 4>
gap> x := PartialPerm([2, 1, 4, 3]);;
gap> y := PartialPerm([2, 4, 3, 1]);;
gap> R := ReesZeroMatrixSemigroup(S, [[0, x], [y, 0]]);
<Rees 0-matrix semigroup 2x2 over <symmetric inverse monoid of degree 4>>
gap> IsInverseSemigroup(R);
true
gap> NrIdempotents(R);
33
gap> NrIdempotents(R) = NrIdempotents(S) * Length(Rows(R)) + 1;
true
gap> idems := Idempotents(R);;
gap> IsDuplicateFreeList(idems);
true
gap> Length(idems) = NrIdempotents(R);
true
gap> ForAll(idems, IsIdempotent);
true

#T# NrIdempotents and Idempotents 2:
# for an inverse Rees 0-matrix semigroup over a group
gap> R := ReesZeroMatrixSemigroup(Group(()), [[()]]);
<Rees 0-matrix semigroup 1x1 over Group(())>
gap> NrIdempotents(R);
2
gap> Idempotents(R);
[ 0, (1,(),1) ]
gap> Idempotents(R) = Elements(R);
true
gap> IsBand(R);
true
gap> x := Transformation([2, 1]);;
gap> T := Semigroup(x);
<commutative transformation semigroup of degree 2 with 1 generator>
gap> R := ReesZeroMatrixSemigroup(T, [[x, 0], [x, x ^ 2]]);
<Rees 0-matrix semigroup 2x2 over <commutative transformation semigroup of 
  degree 2 with 1 generator>>
gap> NrIdempotents(R);
4
gap> Idempotents(R);
[ 0, (1,Transformation( [ 2, 1 ] ),1), (1,Transformation( [ 2, 1 ] ),2), 
  (2,IdentityTransformation,2) ]
gap> ForAll(Idempotents(R), IsIdempotent);
true
gap> x := Transformation([1, 1, 2]);;
gap> T := Semigroup(x);
<commutative transformation semigroup of degree 3 with 1 generator>
gap> R := ReesZeroMatrixSemigroup(T, [[x, 0], [0, x ^ 2]]);
<Rees 0-matrix semigroup 2x2 over <commutative transformation semigroup of 
  degree 3 with 1 generator>>
gap> NrIdempotents(R);
3
gap> i := ShallowCopy(Idempotents(R));;
gap> Sort(i);
gap> i;
[ 0, (1,Transformation( [ 1, 1, 1 ] ),1), (2,Transformation( [ 1, 1, 1 ] ),2) 
 ]
gap> ForAll(Idempotents(R), IsIdempotent);
true

#T# NrIdempotents and Idempotents 3:
# for an sub-RZMS of an Rees 0-matrix semigroup
gap> S := SymmetricInverseMonoid(4);;
gap> x := PartialPerm([2, 1, 4, 3]);;
gap> y := PartialPerm([2, 4, 3, 1]);;
gap> z := PartialPerm([0, 0, 0, 0]);;
gap> R := ReesZeroMatrixSemigroup(S, [[x, x, 0], [y, 0, 0], [0, 0, x]]);;
gap> IsInverseSemigroup(R);
false

#
gap> T := Semigroup(RMSElement(R, 1, x, 1));;
gap> IsReesZeroMatrixSemigroup(T);
false
gap> NrIdempotents(T);
1
gap> Idempotents(T);
[ (1,(1,2)(3,4),1) ]
gap> T := Semigroup(RMSElement(R, 1, x, 1));;
gap> IsReesZeroMatrixSemigroup(T);
false
gap> NrIdempotents(T);
1
gap> Idempotents(T);
[ (1,(1,2)(3,4),1) ]
gap> T := Semigroup(RMSElement(R, 1, y ^ -1, 2));;
gap> IsInverseSemigroup(T);
true
gap> NrIdempotents(T);
1
gap> T := Semigroup(RMSElement(R, 1, y ^ -1, 2));;
gap> IsInverseSemigroup(T);
true
gap> Idempotents(T);
[ (1,(1,4,2)(3),2) ]
gap> T := Semigroup(RMSElement(R, 1, y ^ -1, 2));;
gap> NrIdempotents(T);
1
gap> T := Semigroup(RMSElement(R, 1, y ^ -1, 2));;
gap> Idempotents(T);
[ (1,(1,4,2)(3),2) ]
gap> T := Semigroup(RMSElement(R, 1, y ^ -1, 2));;
gap> SetIsInverseSemigroup(T, true);
gap> Idempotents(T);
[ (1,(1,4,2)(3),2) ]

#
gap> S := SymmetricInverseMonoid(4);;
gap> x := PartialPerm([2, 1, 4, 3]);;
gap> y := PartialPerm([2, 4, 3, 1]);;
gap> z := PartialPerm([0, 0, 0, 0]);;
gap> R := ReesZeroMatrixSemigroup(S, [[x, x, 0], [y, 0, 0], [0, 0, x]]);;
gap> IsInverseSemigroup(R);
false
gap> T := ReesZeroMatrixSubsemigroup(R, [2, 3], S, [1, 2, 3]);
<Rees 0-matrix semigroup 2x3 over <symmetric inverse monoid of degree 4>>
gap> IsInverseSemigroup(T);
false
gap> T := ReesZeroMatrixSubsemigroup(R, [2, 3], S, [1, 2]);
<Rees 0-matrix semigroup 2x2 over <symmetric inverse monoid of degree 4>>
gap> IsInverseSemigroup(T);
false
gap> T := ReesZeroMatrixSubsemigroup(R, [1, 2], S, [2, 3]);
<Rees 0-matrix semigroup 2x2 over <symmetric inverse monoid of degree 4>>
gap> IsInverseSemigroup(T);
false
gap> T := ReesZeroMatrixSubsemigroup(R, [2, 3], S, [1, 3]);;
gap> IsInverseSemigroup(T) and NrIdempotents(T) = 33;
true
gap> idems := Idempotents(T);;
gap> ForAll(idems, IsIdempotent);
true

#T# MatrixEntries: Test for Issue #164
gap> mat := [
>  [Bipartition([[1, 2, 3, 4, -2, -3], [-1], [-4]]), 0, 0, 0],
>  [0, Bipartition([[1, 3, -1], [2, 4, -2, -3], [-4]]), 0,
>   Bipartition([[1, 4, -1], [2, 3], [-2], [-3, -4]])],
>  [0, 0, Bipartition([[1, 2, 3, -3], [4, -1, -4], [-2]]), 0]];;
gap> R := ReesZeroMatrixSemigroup(PartitionMonoid(4), mat);;
gap> MatrixEntries(R);
[ 0, <bipartition: [ 1, 2, 3, 4, -2, -3 ], [ -1 ], [ -4 ]>, 
  <bipartition: [ 1, 2, 3, -3 ], [ 4, -1, -4 ], [ -2 ]>, 
  <bipartition: [ 1, 3, -1 ], [ 2, 4, -2, -3 ], [ -4 ]>, 
  <bipartition: [ 1, 4, -1 ], [ 2, 3 ], [ -2 ], [ -3, -4 ]> ]
gap> mat := [
>  [Bipartition([[1, 2, 4], [3, -1, -2], [-3], [-4]]),
>   Bipartition([[1, -2, -4], [2, 3, 4, -3], [-1]])],
>  [Bipartition([[1, 2, 4, -1, -4], [3], [-2, -3]]),
>   Bipartition([[1, 3, -1], [2, 4, -2, -3], [-4]])],
>  [Bipartition([[1, 2, -2, -3], [3, 4, -1], [-4]]),
>   Bipartition([[1, -1, -2], [2, 3, -3, -4], [4]])]];;
gap> R := ReesZeroMatrixSemigroup(PartitionMonoid(4), mat);;
gap> MatrixEntries(R);
[ <bipartition: [ 1, 2, 4, -1, -4 ], [ 3 ], [ -2, -3 ]>, 
  <bipartition: [ 1, 2, 4 ], [ 3, -1, -2 ], [ -3 ], [ -4 ]>, 
  <bipartition: [ 1, 2, -2, -3 ], [ 3, 4, -1 ], [ -4 ]>, 
  <bipartition: [ 1, 3, -1 ], [ 2, 4, -2, -3 ], [ -4 ]>, 
  <bipartition: [ 1, -2, -4 ], [ 2, 3, 4, -3 ], [ -1 ]>, 
  <bipartition: [ 1, -1, -2 ], [ 2, 3, -3, -4 ], [ 4 ]> ]

#T# IsomorphismReesMatrixSemigroup, infinite
gap> IsomorphismReesMatrixSemigroup(FreeInverseSemigroup(2));
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `CayleyGraphSemigroup' on 1 arguments

#T# IsomorphismReesZeroMatrixSemigroup, infinite
gap> IsomorphismReesZeroMatrixSemigroup(FreeSemigroup(2));
Error, usage: the semigroup must be a finite 0-simple semigroup,

#T# IsomorphismReesZeroMatrixSemigroup, error, 1/1
gap> IsomorphismReesZeroMatrixSemigroup(RegularBooleanMatMonoid(2));
Error, Semigroups: IsomorphismReesZeroMatrixSemigroup: usage,
the argument must be a 0-simple semigroup,

#T# IsomorphismReesMatrixSemigroup: for a simple semigroup
gap> S := SemigroupIdeal(
> Semigroup([
>   Bipartition([[1, 2, 3, 6, 7, 8, -2, -4, -5, -6], [4, 5, -1, -8], [-3],
>                [-7]]),
>   Bipartition([[1, 5, 8], [2, 7, -3, -6], [3, 4, -4, -7], [6, -1, -5],
>                [-2, -8]])]),
> [Bipartition([[1, 2, 3, 4, 5, 6, 7, 8, -1, -2, -4, -5, -6, -8], [-3],
>               [-7]])]);;
gap> IsomorphismReesMatrixSemigroup(S);;

#T# IsomorphismReesMatrixSemigroup: for a 0-simple semigroup 1/2
gap> S := Semigroup([Transformation([1, 1, 5, 1, 3, 1, 9, 1, 7, 5]),
>   Transformation([1, 1, 2, 1, 4, 1, 6, 1, 8, 2]),
>   Transformation([1, 5, 1, 3, 1, 9, 1, 7, 1, 7])]);;
gap> IsomorphismReesZeroMatrixSemigroup(S);;

#T# IsomorphismReesMatrixSemigroup: for a 0-simple semigroup 2/2
gap> S := Semigroup([Transformation([1, 1, 5, 1, 3, 1, 9, 1, 7, 5]),
>   Transformation([1, 1, 2, 1, 4, 1, 6, 1, 8, 2]),
>   Transformation([1, 5, 1, 3, 1, 9, 1, 7, 1, 7])]);;
gap> S := Semigroup(MultiplicativeZero(S), S);;
gap> IsomorphismReesZeroMatrixSemigroup(S);;

#T# IsomorphismReesMatrixSemigroup: for a non-simple or non-0-simple
gap> S := Semigroup(Transformation([2, 1]), Transformation([2, 2]));;
gap> IsomorphismReesMatrixSemigroup(S);
Error, Semigroups: IsomorphismReesMatrixSemigroup: usage,
the argument must be a simple semigroup,

#T# IsomorphismReesZeroMatrixSemigroup, bug 1/1
gap> S := Semigroup(PartialPerm([1]), PartialPerm([]));
<partial perm monoid of rank 1 with 2 generators>
gap> IsomorphismReesMatrixSemigroup(S);
Error, Semigroups: IsomorphismReesMatrixSemigroup: usage,
the argument must be a simple semigroup,
gap> IsomorphismReesZeroMatrixSemigroup(S);;
gap> Size(Range(last));
2

#T# SEMIGROUPS_UnbindVariables
gap> Unbind(BruteForceInverseCheck);
gap> Unbind(BruteForceIsoCheck);
gap> Unbind(F);
gap> Unbind(G);
gap> Unbind(R);
gap> Unbind(S);
gap> Unbind(T);
gap> Unbind(comps);
gap> Unbind(i);
gap> Unbind(id);
gap> Unbind(idems);
gap> Unbind(inv);
gap> Unbind(iso);
gap> Unbind(map);
gap> Unbind(mat);
gap> Unbind(occurrence);
gap> Unbind(rels);
gap> Unbind(x);
gap> Unbind(y);
gap> Unbind(z);
gap> Unbind(zero);

#E#
gap> STOP_TEST("Semigroups package: standard/semirms.tst");
