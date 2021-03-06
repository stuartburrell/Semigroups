#############################################################################
##
#W  standard/properties.tst
#Y  Copyright (C) 2011-15                                James D. Mitchell
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##
gap> START_TEST("Semigroups package: standard/properties.tst");
gap> LoadPackage("semigroups", false);;

#
gap> SEMIGROUPS.StartTest();

#T# properties: IsBand, for a semigroup, 1/2
gap> S := Semigroup(
> [Bipartition([[1, 2, 7, -1], [3, 4, 5, -2, -3], [6, -5], [-4],
>      [-6, -7]]),
>   Bipartition([[1, 3, 4, 7], [2, 6], [5, -3, -4, -5], [-1, -2, -6],
>      [-7]]), Bipartition([[1, 4, 6], [2, 3, 5, 7, -1, -4],
>      [-2, -5, -7], [-3, -6]]),
>   Bipartition([[1, 6, -1, -3, -5, -6], [2, 3, 4, 7, -2],
>      [5, -4, -7]]),
>   Bipartition([[1, 4, 5, -2], [2, 7, -5], [3, 6, -7], [-1],
>      [-3, -4, -6]]),
>   Bipartition([[1, 5], [2, 4, -1, -3], [3, 6, 7, -4, -5], [-2, -7],
>      [-6]])]);;
gap> IsBand(S);
false

#T# properties: IsBand, for an ideal, 2/2
gap> S := Semigroup(
>  PBR([[], [-2, 2], [-3, -1, 2]],
>        [[-3, -2, 3], [-2, 2], [-3, -2, 2]]),
>  PBR([[-2, -1, 1, 2, 3], [-3, -1, 1, 3], [-2, -1, 1]],
>        [[-2, -1], [-3, -1], [-2, -1, 2]]),
>  PBR([[-3, -2, -1, 1, 2, 3], [-2, 1], [-3, -2, 3]],
>        [[-2, -1, 1, 2, 3], [-3, -1, 1, 2, 3], [-3, -2, 1, 3]]),
>  PBR([[-2, 1, 2, 3], [-3, -2, -1, 2, 3], [-3, -1, 1, 2]],
>        [[-1, 3], [-2, -1, 2, 3], [3]]),
>  PBR([[-3, -1, 1, 2], [-2, -1, 2, 3], [-1, 1]],
>        [[1, 3], [-1, 1], [-3, -2, 1, 2, 3]]),
>  PBR([[-2, 1, 2], [-3, -2, -1, 2], [-3, -2, 2, 3]],
>        [[-3, -2, 1, 2, 3], [1, 2, 3], [-2, -1, 1]]),
>  PBR([[-2, 1, 2], [-3, 2], [-3, -2, 1, 2]],
>        [[2, 3], [-2, -1, 1, 2, 3], [-3, -2, -1, 1]]),
>  PBR([[-3, -1, 1, 3], [-2], [-3, 1, 3]],
>        [[-3, -1, 1, 2, 3], [-2, -1, 3], [-1, 1, 2]]),
>  PBR([[-2, 2, 3], [-3, -1, 1, 2, 3], [-3, 1, 2]],
>        [[-3, -2, -1, 1, 3], [-3, -1, 3], [-3, -1, 1, 2]]),
>  PBR([[-3, 2, 3], [-3, -1, 2], [-3, 3]],
>        [[-2, -1, 3], [-2, 1, 3], [-2, 1, 3]]),
>  PBR([[-2, -1], [-2, 1, 2], [-3, -1, 1]],
>        [[-1, 1, 2, 3], [-3, -1, 2, 3], [-3, 2, 3]]));;
gap> IsBand(S);
false
gap> I := SemigroupIdeal(S,
> PBR([[-3, -2, 2, 3], [-3, -2, 1, 2, 3], [-3, -2, 1, 2, 3]],
>     [[-3, -2], [-3, -2, -1], [-3, -2, -1]]));
<pbr semigroup ideal of degree 3 with 1 generator>
gap> IsBand(I);
true
gap> J := SemigroupIdeal(I,
> PBR([[-3, -2, 2, 3], [-3, -2, 1, 2, 3], [-3, -2, 1, 2, 3]],
>     [[-3, -2], [-3, -2, -1], [-3, -2, -1]]));
<regular pbr semigroup ideal of degree 3 with 1 generator>
gap> IsBand(J);
true

#T# properties: IsBand, for an inverse semigroup, 1/1
gap> S := InverseSemigroup(
> [Bipartition([[1, -6], [2, -2], [3, -1], [4, -4], [5], [6],
>      [-3], [-5]]), Bipartition([[1, -1], [2, -6], [3, -3],
>      [4, -2], [5, -4], [6], [-5]]),
>   Bipartition([[1, -1], [2, -6], [3, -5], [4], [5, -2], [6],
>      [-3], [-4]]), Bipartition([[1, -1], [2, -3], [3, -5],
>      [4], [5], [6, -6], [-2], [-4]]),
>   Bipartition([[1, -3], [2], [3], [4, -6], [5, -4], [6, -5],
>      [-1], [-2]]),
>   Bipartition([[1, -3], [2, -5], [3], [4, -4], [5, -1],
>      [6, -2], [-6]])]);;
gap> IsBand(S);
false
gap> IsBand(IdempotentGeneratedSubsemigroup(S));
true

#T# properties: IsBlockGroup, 1/?
gap> S := Semigroup([Transformation([6, 2, 8, 8, 7, 8, 4, 8]),
>   Transformation([6, 7, 4, 2, 8, 1, 5, 8])]);
<transformation semigroup of degree 8 with 2 generators>
gap> IsBlockGroup(S);
true
gap> I := SemigroupIdeal(S, Transformation([1, 8, 8, 8, 8, 8, 5, 8]));;
gap> IsBlockGroup(I);
true

#T# properties: IsBlockGroup, 2/?
gap> S := JonesMonoid(3);
<regular bipartition *-monoid of degree 3 with 2 generators>
gap> IsInverseSemigroup(S);
false
gap> IsBlockGroup(S);
false

#T# properties: IsBlockGroup, 3/?
gap> S := Semigroup([BooleanMat([[true, true], [true, true]]),
>  BooleanMat([[false, false], [false, true]])]);
<semigroup of 2x2 boolean matrices with 2 generators>
gap> IsBlockGroup(S);
false

#T# properties: IsBlockGroup, 4/?
gap> S := Semigroup(
>  Matrix(IsTropicalMaxPlusMatrix, [[0, 1, 1, 2, 0, 3, 0, -infinity],
>      [5, 1, 1, 2, -infinity, -infinity, 0, 2],
>      [0, 3, -infinity, 1, -infinity, -infinity, 2, 1],
>      [-infinity, -infinity, -infinity, 0, -infinity, 3, 1, 1],
>      [1, 2, 1, 2, 1, 1, 2, 1], [1, 2, 5, 2, -infinity, 2, 2, 1],
>      [1, 0, -infinity, 2, -infinity, 0, 0, 2],
>      [2, -infinity, 5, 2, 4, 1, 3, 3]], 6),
>  Matrix(IsTropicalMaxPlusMatrix, [[1, 3, 0, 4, -infinity, 2, 1, -infinity],
>      [2, 5, 2, 5, -infinity, 0, 1, -infinity],
>      [2, -infinity, -infinity, 1, 3, 2, 2, 1],
>      [1, 4, 1, 3, -infinity, 1, 1, 3],
>      [3, 0, 1, 1, 1, 2, -infinity, -infinity],
>      [1, 1, -infinity, 1, 2, 0, 1, 2], [3, 0, 1, 1, 1, 1, 1, 2],
>      [0, -infinity, 0, 3, 1, 1, 2, 1]], 6),
>  Matrix(IsTropicalMaxPlusMatrix, [[1, 4, -infinity, 2, 1, 3, 2, 1],
>      [-infinity, 1, 2, 0, 1, 1, 2, 1],
>      [1, 2, 0, -infinity, 0, 1, -infinity, -infinity],
>      [-infinity, 3, 1, -infinity, 2, 0, 2, 1],
>      [1, -infinity, 2, 2, -infinity, 5, 2, 0],
>      [-infinity, 0, -infinity, 0, -infinity, 1, 1, -infinity],
>      [-infinity, 1, 0, 1, 3, 2, 1, 1], [3, 2, -infinity, 0, 2, 2, 2, 1]], 6),
>  Matrix(IsTropicalMaxPlusMatrix, [[2, 3, 3, 0, -infinity, 1, 1, 2],
>      [-infinity, 2, 0, -infinity, -infinity, 0, -infinity, -infinity],
>      [3, 0, 4, -infinity, -infinity, -infinity, -infinity, 6],
>      [1, 0, 0, -infinity, 0, 2, 1, 3], [2, 3, 5, 2, 3, 0, -infinity, 0],
>      [0, -infinity, 2, -infinity, 0, 1, 2, -infinity],
>      [0, 0, 1, 0, -infinity, 2, 2, 4], [0, 3, 1, -infinity, 3, 1, 1, 1]], 6),
>  Matrix(IsTropicalMaxPlusMatrix, [[3, -infinity, -infinity, 1, 3, 1, 2, 1],
>      [4, 1, 1, 2, -infinity, 3, 1, 5], [2, 3, 1, 2, 3, 2, 1, 1],
>      [2, 2, -infinity, 3, 3, 3, 1, 0], [-infinity, 2, 1, 1, 2, 1, 1, 0],
>      [2, 1, -infinity, 2, 2, 1, 1, -infinity],
>      [1, 3, 2, 0, -infinity, 2, 4, 1],
>      [1, 2, -infinity, 1, -infinity, -infinity, -infinity, -infinity]], 6),
>  Matrix(IsTropicalMaxPlusMatrix, [[3, 0, 1, 1, 0, 0, 2, 3],
>      [4, 1, 0, 0, 3, 1, 2, 2], [2, -infinity, 0, 2, -infinity, 1, 2, 3],
>      [3, 0, 2, 1, -infinity, -infinity, 3, -infinity],
>      [2, 0, -infinity, 1, -infinity, 3, -infinity, -infinity],
>      [3, 1, 2, 2, 1, -infinity, 1, 0], [2, 3, -infinity, 1, 3, 1, 2, 0],
>      [2, 2, 1, 0, 3, 1, 1, 1]], 6),
>  Matrix(IsTropicalMaxPlusMatrix, [[3, 0, 2, -infinity, 0, 2, 0, -infinity],
>      [2, 4, 0, 1, -infinity, 1, 2, 1],
>      [-infinity, 3, 0, 3, -infinity, 3, -infinity, 2],
>      [4, -infinity, 2, -infinity, -infinity, 1, 1, 3],
>      [-infinity, 3, 0, 6, 2, 0, 0, 1], [-infinity, 2, 2, 1, 2, 0, 0, 0],
>      [5, 3, 2, 0, -infinity, 0, 5, 1],
>      [-infinity, 1, 4, 4, 2, -infinity, 4, 3]], 6),
>  Matrix(IsTropicalMaxPlusMatrix, [[3, 3, 1, 0, 2, 4, 1, -infinity],
>      [3, 0, 0, 0, 0, 5, -infinity, 2],
>      [-infinity, -infinity, 1, 4, 4, 4, 1, 2], [0, 1, 1, 0, 1, 2, 0, 0],
>      [3, 0, 1, 5, -infinity, 0, 1, 2],
>      [-infinity, 0, -infinity, 2, 1, 3, 1, 0],
>      [4, 2, 2, -infinity, 1, 2, -infinity, 2],
>      [1, -infinity, 2, 4, 1, 0, 4, 1]], 6));
<semigroup of 8x8 tropical max-plus matrices with 8 generators>
gap> IsBlockGroup(S);
true

#T# properties: IsBlockGroup, for an infinite semigroup, 5/?
gap> S := FreeSemigroup(1);;
gap> IsBlockGroup(S);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsBlockGroup' on 1 arguments

#T# properties: IsBrandtSemigroup, 1
gap> S := Semigroup([Transformation([2, 1, 5, 5, 5]),
> Transformation([4, 5, 3, 1, 5])]);
<transformation semigroup of degree 5 with 2 generators>
gap> IsBrandtSemigroup(S);
false
gap> S := Semigroup(S);;
gap> x := Transformation([5, 5, 5, 4, 5]);;
gap> I := SemigroupIdeal(S, x);;
gap> IsBrandtSemigroup(I);
true
gap> S := FreeSemigroup(1);;
gap> IsBrandtSemigroup(S);
false

#T# properties: IsZeroSimpleSemigroup, bug, 1
gap> IsZeroSimpleSemigroup(ZeroSemigroup(2));
false

#T# properties: IsZeroSimpleSemigroup, inverse, 2
gap> S := DualSymmetricInverseMonoid(3);
<inverse block bijection monoid of degree 3 with 3 generators>
gap> IsZeroSimpleSemigroup(S);
false

#T# properties: IsZeroSimpleSemigroup, inverse, 3
gap> S := InverseSemigroup([
>   PartialPerm([1]),
>   PartialPerm([])]);
<inverse partial perm monoid of rank 1 with 2 generators>
gap> IsZeroSimpleSemigroup(S);
true

#T# properties: IsZeroSimpleSemigroup, infinite, 4
gap> IsZeroSimpleSemigroup(FreeSemigroup(5));
false

#T# properties: IsCongruenceFreeSemigroup, trivial, 1
gap> IsCongruenceFreeSemigroup(TrivialSemigroup());
true

#T# properties: IsCongruenceFreeSemigroup, group, 2
gap> S := AsSemigroup(IsTransformationSemigroup, AlternatingGroup(5));
<transformation group of size 60, degree 5 with 2 generators>
gap> IsCongruenceFreeSemigroup(S);
true

#T# properties: IsCongruenceFreeSemigroup, group, 3
gap> IsCongruenceFreeSemigroup(AlternatingGroup(5));
true

#T# properties: IsCongruenceFreeSemigroup, 4
gap> S := FullTransformationMonoid(3);;
gap> D := PrincipalFactor(DClass(S, S.3));
<Rees 0-matrix semigroup 3x3 over Group([ (1,2) ])>
gap> IsCongruenceFreeSemigroup(D);
false

#T# properties: IsCongruenceFreeSemigroup, 5
gap> R := ReesZeroMatrixSemigroup(Group([()]),
> [[(), (), 0], [(), 0, ()], [0, (), ()]]);;
gap> IsCongruenceFreeSemigroup(R);
true

#T# properties: IsCongruenceFreeSemigroup, 6
gap> R := ReesZeroMatrixSemigroup(Group([()]),
> [[(), (), 0], [(), (), 0], [0, (), ()]]);;
gap> IsCongruenceFreeSemigroup(R);
false

#T# properties: IsCongruenceFreeSemigroup, 7
gap> S := FreeSemigroup(1);;
gap> IsCongruenceFreeSemigroup(S);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsCongruenceFreeSemigroup' on 1 argumen\
ts

#T# properties: IsCliffordSemigroup, ideal, 1
gap> I := SemigroupIdeal(Semigroup(
>    [Transformation([1, 4, 3, 2]), Transformation([2, 1, 4, 3]), Tran\
> sformation([3, 2, 1, 3]), Transformation([3, 3, 1]), Transformation([\
> 4, 4, 4, 3])]), [Transformation([4, 3, 4, 4])]);;
gap> IsCliffordSemigroup(I);
false

#T# properties: IsCliffordSemigroup, parent, 2
gap> S := IdempotentGeneratedSubsemigroup(SymmetricInverseMonoid(3));;
gap> IsCliffordSemigroup(S);
true
gap> I := SemigroupIdeal(S, PartialPerm([1, 2, 3], [1, 2, 3]));
<inverse partial perm semigroup ideal of rank 3 with 1 generator>
gap> IsCliffordSemigroup(I);
true
gap> I := SemigroupIdeal(S, PartialPerm([1, 2, 3], [1, 2, 3]));
<inverse partial perm semigroup ideal of rank 3 with 1 generator>
gap> GeneratorsOfSemigroup(I);;
gap> IsCliffordSemigroup(I);
true

# doesn't know it is inverse
gap> S := ReesZeroMatrixSemigroup(Group(()), [[()]]);;
gap> S := Range(IsomorphismSemigroup(IsBooleanMatSemigroup, S));;
gap> IsCliffordSemigroup(S);
true
gap> I := SemigroupIdeal(S, Random(S));;
gap> IsCliffordSemigroup(I);
true
gap> I := SemigroupIdeal(S, Random(S));;
gap> GeneratorsOfSemigroup(I);;
gap> IsCliffordSemigroup(I);
true

#T# properties: IsCliffordSemigroup, non-inverse, 3
gap> S := ZeroSemigroup(2);;
gap> IsInverseSemigroup(S);
false
gap> IsCliffordSemigroup(S);
false

#T# properties: IsCliffordSemigroup, non-completely regular, 4
gap> S := ZeroSemigroup(2);;
gap> IsCompletelyRegularSemigroup(S);
false
gap> IsCliffordSemigroup(S);
false

#T# properties: IsCliffordSemigroup, group, 5
gap> S := AsSemigroup(IsPartialPermSemigroup, Group((1, 2, 3)));
<partial perm group of rank 3 with 1 generator>
gap> IsCliffordSemigroup(S);
true

#T# properties: IsCliffordSemigroup, non-regular, 6
gap> S := ZeroSemigroup(2);;
gap> IsCliffordSemigroup(S);
false

#T# properties: IsCliffordSemigroup, infinite, 6
gap> S := FreeSemigroup(2);;
gap> IsCliffordSemigroup(S);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 4th choice method found for `IsCliffordSemigroup' on 1 arguments

#T# properties: IsCommutativeSemigroup, 1
gap> S := Semigroup([Transformation([1, 1, 3, 5, 4]),
>  Transformation([1, 2, 1, 5, 4])]);;
gap> IsCommutativeSemigroup(S);
true

#T# properties: IsCommutativeSemigroup, 2
gap> S := JonesMonoid(3);
<regular bipartition *-monoid of degree 3 with 2 generators>
gap> IsCommutativeSemigroup(S);
false

#T# properties: IsCommutativeSemigroup, 3
gap> S := FreeSemigroup(3);;
gap> IsCommutativeSemigroup(S);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsCommutativeSemigroup' on 1 arguments

#T# properties: IsCompletelyRegularSemigroup, 1
gap> S := Monoid(
> BooleanMat([[false, true, false],
>             [true, false, false],
>             [false, false, true]]),
> BooleanMat([[false, true, false],
>             [false, false, true],
>             [true, false, false]]));
<monoid of 3x3 boolean matrices with 2 generators>
gap> IsCompletelyRegularSemigroup(S);
true
gap> I := SemigroupIdeal(S, S.1);;
gap> IsCompletelyRegularSemigroup(I);
true

#T# properties: IsCompletelyRegularSemigroup, 2
gap> S := Semigroup(GroupOfUnits(FullTransformationMonoid(3)));
<transformation semigroup of degree 3 with 2 generators>
gap> IsCompletelyRegularSemigroup(S);
true
gap> I := SemigroupIdeal(S, S.1);;
gap> GeneratorsOfSemigroup(I);;
gap> IsCompletelyRegularSemigroup(I);
true

#T# properties: IsCompletelyRegularSemigroup, 3
gap> S := MonogenicSemigroup(IsBooleanMatSemigroup, 3, 2);;
gap> IsRegularSemigroup(S);
false
gap> IsCompletelyRegularSemigroup(S);
false
gap> S := FreeSemigroup(1);;
gap> IsCompletelyRegularSemigroup(S);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsCompletelyRegularSemigroup' on 1 argu\
ments

#T# properties: IsCompletelySimpleSemigroup, 1
gap> S := Semigroup(Matrix(IsMaxPlusMatrix, [[0, -4], [-4, -1]]),
>                   Matrix(IsMaxPlusMatrix, [[0, -3], [-3, -1]]));
<semigroup of 2x2 max-plus matrices with 2 generators>
gap> IsCompletelySimpleSemigroup(S);
false
gap> S := FreeSemigroup(2);;
gap> IsCompletelySimpleSemigroup(S);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsCompletelySimpleSemigroup' on 1 argum\
ents

#T# properties: IsEUnitaryInverseSemigroup, non-inverse op, 1
gap> S := Semigroup([Transformation([5, 7, 1, 6, 8, 8, 8, 8]),
>  Transformation([1, 3, 4, 8, 8, 7, 5, 8]),
>  Transformation([3, 8, 8, 8, 1, 4, 2, 8]),
>  Transformation([1, 8, 2, 3, 7, 8, 6, 8])]);
<transformation semigroup of degree 8 with 4 generators>
gap> IsEUnitaryInverseSemigroup(S);
false

#T# properties: IsEUnitaryInverseSemigroup, inverse op, 2
gap> S := InverseSemigroup([PartialPerm([1, 2, 3], [1, 3, 5]),
>  PartialPerm([1, 2, 3, 4, 6], [7, 5, 2, 6, 4])]);
<inverse partial perm semigroup of rank 7 with 2 generators>
gap> IsEUnitaryInverseSemigroup(S);
false

#T# properties: IsEUnitaryInverseSemigroup, infinite, 3
gap> S := FreeInverseSemigroup(3);;
gap> IsEUnitaryInverseSemigroup(S);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 4th choice method found for `IsEUnitaryInverseSemigroup' on 1 argume\
nts

#T# properties: IsFactorisableInverseMonoid, 1
gap> S := DualSymmetricInverseMonoid(3);
<inverse block bijection monoid of degree 3 with 3 generators>
gap> IsFactorisableInverseMonoid(S);
false
gap> T := InverseSemigroup(FactorisableDualSymmetricInverseSemigroup(3));
<inverse block bijection monoid of degree 3 with 3 generators>
gap> IsFactorisableInverseMonoid(T);
true

#T# properties: IsFactorisableInverseMonoid, 2
gap> S := InverseSemigroup(PartialPerm([1, 2], [3, 1]),
>                          PartialPerm([1, 2, 3], [1, 3, 4]));;
gap> IsFactorisableInverseMonoid(S);
false
gap> S := InverseMonoid(S);;
gap> IsFactorisableInverseMonoid(S);
false

#T# properties: IsFactorisableInverseMonoid, 3
gap> S := FreeInverseSemigroup(2);;
gap> IsFactorisableInverseMonoid(S);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsFactorisableInverseMonoid' on 1 argum\
ents

#T# properties: IsXTrivial, non-acting, 1
gap> S := Semigroup(
> Matrix(IsTropicalMaxPlusMatrix, [[-infinity, -infinity],
>                                  [4, 0]], 8),
> Matrix(IsTropicalMaxPlusMatrix, [[3, 1], [-infinity, 0]], 8));
<semigroup of 2x2 tropical max-plus matrices with 2 generators>
gap> IsHTrivial(S);
true
gap> IsLTrivial(S);
false
gap> IsRTrivial(S);
true
gap> I := SemigroupIdeal(S,
> Matrix(IsTropicalMaxPlusMatrix, [[8, 8], [7, 5]], 8));
<semigroup ideal of 2x2 tropical max-plus matrices with 1 generator>
gap> IsHTrivial(I);
true
gap> IsLTrivial(I);
false
gap> IsRTrivial(I);
true
gap> S := Semigroup(BooleanMat([[1, 0, 0], [1, 0, 0], [0, 1, 0]]));
<commutative semigroup of 3x3 boolean matrices with 1 generator>
gap> IsHTrivial(S);
true
gap> IsLTrivial(S);
true
gap> IsRTrivial(S);
true
gap> I := SemigroupIdeal(S, MultiplicativeZero(S));
<commutative semigroup ideal of 3x3 boolean matrices with 1 generator>
gap> IsHTrivial(I);
true
gap> IsLTrivial(I);
true
gap> IsRTrivial(I);
true

#T# properties: IsXTrivial, trans, 2
gap> S := Semigroup([Transformation([4, 1, 3, 5, 5, 1]),
> Transformation([6, 1, 6, 3, 2, 4])]);
<transformation semigroup of degree 6 with 2 generators>
gap> IsHTrivial(S);
false
gap> IsLTrivial(S);
false
gap> IsRTrivial(S);
false

#T# properties: IsXTrivial, pperm, 3
gap> S := Semigroup([
>  PartialPerm([1, 2, 3, 6, 7, 8, 9], [10, 5, 9, 6, 3, 8, 4]),
>  PartialPerm([1, 2, 3, 4, 7, 8, 10], [1, 4, 2, 5, 6, 11, 7]),
>  PartialPerm([1, 2, 3, 4, 5, 7, 10], [2, 8, 4, 7, 5, 3, 6]),
>  PartialPerm([1, 2, 4, 5, 7, 9, 11], [7, 10, 1, 11, 9, 4, 2]),
>  PartialPerm([1, 2, 4, 7, 8, 9, 11], [10, 7, 8, 5, 9, 1, 3])]);
<partial perm semigroup of rank 11 with 5 generators>
gap> IsHTrivial(S);
false
gap> IsLTrivial(S);
false
gap> IsRTrivial(S);
false

#T# properties: IsXTrivial, acting, true 4
gap> S := InverseSemigroup(
> [Bipartition([[1, 4, 5, -1, -4, -5], [2, -2], [3, -3]]),
>   Bipartition([[1, -1], [2, -2], [3, 4, 5, -3, -4, -5]]),
>   Bipartition([[1, -1], [2, 3, 5, -2, -3, -5], [4, -4]]),
>   Bipartition([[1, 2, 4, 5, -1, -2, -4, -5], [3, -3]]),
>   Bipartition([[1, 2, 3, 5, -1, -2, -3, -5], [4, -4]])]);
<inverse block bijection semigroup of degree 5 with 5 generators>
gap> IsHTrivial(S);
true
gap> IsLTrivial(S);
true
gap> IsRTrivial(S);
true
gap> I := SemigroupIdeal(S, S.1);
<inverse bipartition semigroup ideal of degree 5 with 1 generator>
gap> IsHTrivial(I);
true
gap> IsLTrivial(I);
true
gap> IsRTrivial(I);
true
gap> S := Semigroup(S);;
gap> IsHTrivial(S);
true
gap> IsLTrivial(S);
true
gap> IsRTrivial(S);
true
gap> I := SemigroupIdeal(S, S.1);;
gap> IsHTrivial(I);
true
gap> IsLTrivial(I);
true
gap> IsRTrivial(I);
true

#T# properties: IsXTrivial, acting, false, 5
gap> S := Semigroup(
>  Bipartition([[1, 2, 3, 4, 5, -6], [6, -1, -2, -3, -4, -5]]),
>  Bipartition([[1, 2, 6, -1, -5, -6], [3, 5, -2, -3], [4, -4]]));
<block bijection semigroup of degree 6 with 2 generators>
gap> IsHTrivial(S);
false
gap> IsLTrivial(S);
false
gap> IsRTrivial(S);
false

# #T# properties: IsXTrivial, D-class, 6
# gap> S := Semigroup(
# > [Matrix(GF(5), [[0 * Z(5), Z(5) ^ 3], [Z(5) ^ 2, Z(5) ^ 0]]),
# >  Matrix(GF(5), [[Z(5) ^ 0, Z(5)], [Z(5), Z(5) ^ 3]]),
# >  Matrix(GF(5), [[Z(5) ^ 0, Z(5) ^ 3], [0 * Z(5), 0 * Z(5)]]),
# >  Matrix(GF(5), [[Z(5), Z(5) ^ 0], [0 * Z(5), Z(5) ^ 3]]),
# >  Matrix(GF(5), [[Z(5), Z(5) ^ 0], [Z(5) ^ 0, Z(5)]]),
# >  Matrix(GF(5), [[Z(5) ^ 2, 0 * Z(5)], [Z(5), 0 * Z(5)]]),
# >  Matrix(GF(5), [[Z(5) ^ 2, Z(5)], [0 * Z(5), 0 * Z(5)]])]);;
# gap> D := GreensDClassOfElement(S,
# > Matrix(GF(5), [[Z(5) ^ 3, Z(5) ^ 2], [Z(5) ^ 3, Z(5)]]));
# <Green's D-class: Matrix(GF(5), [[Z(5)^3, Z(5)^2], [Z(5)^3, Z(5)]])>
# gap> IsHTrivial(D);
# false
# gap> IsLTrivial(D);
# false
# gap> IsRTrivial(D);
# false

#T# properties: IsXTrivial, infinite semigroup, 7
gap> S := FreeSemigroup(2);;
gap> IsHTrivial(S);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsHTrivial' on 1 arguments
gap> IsLTrivial(S);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsLTrivial' on 1 arguments
gap> IsRTrivial(S);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsRTrivial' on 1 arguments
gap> IsDTrivial(S);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsRTrivial' on 1 arguments

#T# properties: IsLTrivial, rho, 1/1
gap> S := FullTransformationMonoid(3);;
gap> IsLTrivial(S);
false
gap> S := Semigroup(S);
<transformation monoid of degree 3 with 3 generators>
gap> Size(S);
27
gap> IsLTrivial(S);
false
gap> IsRTrivial(S);
false

#T# properties: IsRTrivial, trans, 1/1
gap> S := Semigroup(Transformation([1, 2, 2, 2]));
<commutative transformation semigroup of degree 4 with 1 generator>
gap> IsRTrivial(S);
true

#T# properties: IsRTrivial, pperm, 1/1
gap> S := Semigroup(PartialPerm([1, 2], [1, 2]));
<trivial partial perm group of rank 2 with 1 generator>
gap> IsRTrivial(S);
true

#T# properties: IsGroupAsSemigroup, parent, non-acting, 1
gap> S := AsSemigroup(IsBooleanMatSemigroup, Group((1, 2, 3)));
<commutative semigroup of 3x3 boolean matrices with 1 generator>
gap> I := SemigroupIdeal(S, S.1);
<commutative semigroup ideal of 3x3 boolean matrices with 1 generator>
gap> IsGroupAsSemigroup(S);
true
gap> IsGroupAsSemigroup(I);
true

#T# properties: IsGroupAsSemigroup, infinite, 2
gap> IsGroupAsSemigroup(FreeSemigroup(2));
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsGroupAsSemigroup' on 1 arguments

#T# properties: IsGroupAsSemigroup, parent, acting, 3
gap> S := AsSemigroup(IsBipartitionSemigroup, Group((1, 2, 3)));
<block bijection group of degree 3 with 1 generator>
gap> IsGroupAsSemigroup(S);
true
gap> I := SemigroupIdeal(S, S.1);
<commutative inverse bipartition semigroup ideal of degree 3 with 1 generator>
gap> IsGroupAsSemigroup(I);
true

#T# properties: IsGroupAsSemigroup, 4
gap> S := Semigroup(Transformation([1, 2, 3, 1, 2, 3]) * (1, 2, 3));
<commutative transformation semigroup of degree 6 with 1 generator>
gap> IsGroupAsSemigroup(S);
true

#T# properties: IsGroupAsSemigroup, for IsGroup groups, 5
gap> IsGroupAsSemigroup(SymmetricGroup(5));
true
gap> IsGroupAsSemigroup(Semigroup(Transformation([1])));
true

#T# properties: IsIdempotentGenerated, 1
gap> S :=
> Semigroup(
> [Bipartition([[1, 2, 3, 4, 5, 6, 7, -1, -2, -3, -4, -5, -6, -7]]),
>   Bipartition([[1, 2, 3, 4, 5, 6, -1, -2, -3, -4, -5, -6], [7, -7]]),
>   Bipartition([[1, 5, -1, -5], [2, 3, 4, 6, 7, -2, -3, -4, -6, -7]]),
>   Bipartition([[1, 2, 7, -1, -2, -7], [3, 4, 5, 6, -3, -4, -5, -6]])]);
<block bijection semigroup of degree 7 with 4 generators>
gap> IsIdempotentGenerated(S);
true

#T# properties: IsIdempotentGenerated, 2
gap> S := Monoid([BooleanMat([[true, true], [true, true]]),
>  BooleanMat([[true, false], [true, true]]),
>  BooleanMat([[false, false], [true, true]])]);
<monoid of 2x2 boolean matrices with 3 generators>
gap> IsIdempotentGenerated(S);
true

#T# properties: IsIdempotentGenerated, 3
gap> S := Semigroup([PartialPerm([1, 2, 4, 5], [2, 5, 3, 6]),
>  PartialPerm([1, 2, 4, 5], [5, 1, 3, 4])]);
<partial perm semigroup of rank 4 with 2 generators>
gap> IsIdempotentGenerated(S);
false

#T# properties: IsIdempotentGenerated, 4
gap> S := Semigroup([PartialPerm([1, 2, 4, 5], [1, 2, 4, 5]),
>  PartialPerm([1, 2, 4, 5], [5, 1, 3, 4])]);
<partial perm semigroup of rank 4 with 2 generators>
gap> IsIdempotentGenerated(S);
false

#T# properties: IsIdempotentGenerated, 4
gap> S := FreeSemigroup(1);;
gap> IsIdempotentGenerated(S);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsIdempotentGenerated' on 1 arguments

#T# properties: IsInverseSemigroup, 1
gap> S := Semigroup([PartialPerm([1, 2, 3, 5], [2, 3, 5, 7]),
>  PartialPerm([1, 2, 3, 6], [2, 5, 3, 1]),
>  PartialPerm([2, 3, 5, 7], [1, 2, 3, 5]),
>  PartialPerm([1, 2, 3, 5], [6, 1, 3, 2])]);;
gap> IsInverseSemigroup(S);
true

#T# properties: IsInverseSemigroup, 2
gap> IsInverseSemigroup(FullTransformationMonoid(3));
false

#T# properties: IsInverseSemigroup, 3
gap> S := Semigroup(
> [BooleanMat([[true, false, true, true, true, false, false, true],
>       [true, false, true, true, true, true, true, false],
>       [true, true, true, false, false, false, false, false],
>       [true, false, true, true, false, false, false, true],
>       [true, false, true, false, true, true, true, true],
>       [false, true, false, true, true, true, false, true],
>       [true, false, false, false, true, false, true, false],
>       [false, true, true, false, true, false, true, false]]),
>   BooleanMat([[true, false, true, false, true, false, true, false],
>       [false, false, true, true, true, true, false, true],
>       [false, false, false, true, false, false, true, false],
>       [true, true, false, true, false, false, true, false],
>       [true, true, true, false, false, true, true, true],
>       [false, true, true, true, true, false, true, false],
>       [false, true, false, false, false, false, true, false],
>       [true, true, false, true, true, true, true, false]])]);;
gap> GreensDClasses(S);;
gap> IsInverseSemigroup(S);
false

#T# properties: IsInverseSemigroup, infinite, 4
gap> S := FreeSemigroup(2);;
gap> IsInverseSemigroup(S);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `CayleyGraphDualSemigroup' on 1 argument\
s

#T# properties: IsLeftSimple, non-regular, 1
gap> S := RegularBooleanMatMonoid(3);
<monoid of 3x3 boolean matrices with 4 generators>
gap> IsRegularSemigroup(S);
false
gap> IsLeftSimple(S);
false

#T# properties: IsLeftSimple, left zero, 2
gap> S := TrivialSemigroup();
<trivial transformation group of degree 0 with 1 generator>
gap> IsLeftZeroSemigroup(S);
true
gap> IsLeftSimple(S);
true

# #T# properties: IsLeftSimple, known L-classes, 3
# gap> S := Monoid([Matrix(GF(11), [[0 * Z(11)]]),
# >  Matrix(GF(11), [[Z(11)]]),
# >  Matrix(GF(11), [[Z(11) ^ 4]]),
# >  Matrix(GF(11), [[Z(11) ^ 5]]),
# >  Matrix(GF(11), [[Z(11) ^ 8]]),
# >  Matrix(GF(11), [[Z(11) ^ 9]])]);
# <monoid of 1x1 prime field matrices with 6 generators>
# gap> NrLClasses(S);
# 2
# gap> IsLeftSimple(S);
# false

#T# properties: IsLeftSimple, acting, 4
gap> S := JonesMonoid(3);
<regular bipartition *-monoid of degree 3 with 2 generators>
gap> IsLeftSimple(S);
false

#T# properties: IsLeftSimple, non-acting, 5
gap> S := RegularBooleanMatMonoid(3);
<monoid of 3x3 boolean matrices with 4 generators>
gap> IsLeftSimple(S);
false

#T# properties: IsLeftSimple, infinite, 6
gap> S := FreeSemigroup(4);;
gap> IsLeftSimple(S);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsLeftSimple' on 1 arguments

#T# properties: IsLeftZeroSemigroup, 1
gap> S := LeftZeroSemigroup(4);;
gap> IsLeftZeroSemigroup(S);
true
gap> I := SemigroupIdeal(S, S.1);;
gap> IsLeftZeroSemigroup(I);
true

#T# properties: IsLeftZeroSemigroup, 2
gap> S := AsSemigroup(IsTransformationSemigroup, 
> RectangularBand(IsReesMatrixSemigroup, 2, 2));
<transformation semigroup of size 4, degree 5 with 2 generators>
gap> IsLeftZeroSemigroup(S);
false

#T# properties: IsLeftZeroSemigroup, 2
gap> S := FreeSemigroup(1);;
gap> IsLeftZeroSemigroup(S);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsLeftZeroSemigroup' on 1 arguments

#T# properties: IsMonogenicSemigroup, 1
gap> S := Semigroup(MonogenicSemigroup(10, 10));
<commutative transformation semigroup of degree 20 with 1 generator>
gap> IsMonogenicSemigroup(S);
true

#T# properties: IsMonogenicSemigroup, 2
gap> S := Semigroup(Elements(MonogenicSemigroup(10, 10)));
<transformation semigroup of degree 20 with 19 generators>
gap> IsMonogenicSemigroup(S);
true

#T# properties: IsMonogenicSemigroup, 3
gap> IsMonogenicSemigroup(BrauerMonoid(3));
false

#T# properties: IsMonogenicSemigroup, 4
gap> IsMonogenicSemigroup(SymmetricInverseMonoid(3));
false

#T# properties: IsMonogenicSemigroup, 5
gap> IsMonogenicSemigroup(AsSemigroup(IsBooleanMatSemigroup, Group((1, 2, 3), (2, 3))));
false

#T# properties: IsMonogenicSemigroup, 6
gap> IsMonogenicSemigroup(FreeSemigroup(1));
true

#T# properties: IsMonogenicSemigroup, 7
gap> IsMonogenicSemigroup(FreeInverseSemigroup(1));
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsMonogenicSemigroup' on 1 arguments

#T# properties: IsMonogenicSemigroup, 8
gap> S := SymmetricInverseSemigroup(3);;
gap> GreensDClasses(S);;
gap> IsMonogenicSemigroup(S);
false

#T# properties: IsMonogenicSemigroup, 9
gap> S := MonogenicSemigroup(IsTransformationSemigroup, 3, 2);;
gap> S := Semigroup(S.1, S.1 ^ 2);;
gap> GreensDClasses(S);;
gap> IsMonogenicSemigroup(S);
true

#T# properties: IsMonogenicSemigroup, 10
gap> S := Semigroup([
>  Transformation([2, 6, 7, 2, 6, 9, 9, 1, 1, 5]),
>  Transformation([6, 9, 9, 6, 9, 1, 1, 2, 2, 6]),
>  Transformation([2, 6, 7, 2, 6, 9, 9, 1, 1, 5])]);;
gap> HasIsMonogenicSemigroup(S);
false
gap> IsMonogenicSemigroup(S);
true

#T# properties: IsMonogenicSemigroup, 11
# test for the ImmediateMethod
gap> S := CyclicGroup(IsPermGroup, 10);;
gap> GeneratorsOfSemigroup(S);;
gap> HasIsMonogenicSemigroup(S);
true
gap> IsMonogenicSemigroup(S);
true

#T# properties: IsMonogenicInverseSemigroup, 1
gap> IsMonogenicInverseSemigroup(AsSemigroup(IsBooleanMatSemigroup, 
>                                            Group((1, 2, 3), (2, 3))));
false

#T# properties: IsMonogenicInverseSemigroup, 2
gap> IsMonogenicInverseSemigroup(SymmetricInverseMonoid(3));
false

#T# properties: IsMonogenicInverseSemigroup, 3
gap> IsMonogenicInverseSemigroup(InverseSemigroup(
> PartialPerm([1, 2, 3, 4, 5, 6, 7, 8], [10, 7, 2, 5, 6, 9, 3, 8])));
true

#T# properties: IsMonogenicInverseSemigroup, 4
gap> IsMonogenicInverseSemigroup(InverseSemigroup(
> PartialPerm([1, 2, 3, 4, 5, 6, 7, 8], [10, 7, 2, 5, 6, 9, 3, 8]),
> PartialPerm([1, 2, 3, 4, 5, 6, 7, 8], [10, 7, 2, 5, 6, 9, 3, 8])));
true

#T# properties: IsMonogenicInverseSemigroup, 5
gap> IsMonogenicInverseSemigroup(
> InverseSemigroup(Elements(InverseSemigroup(
> PartialPerm([1, 2, 3, 4, 5, 6, 7, 8], [10, 7, 2, 5, 6, 9, 3, 8])))));
true

#T# properties: IsMonogenicInverseSemigroup, 6
gap> IsMonogenicInverseSemigroup(BrauerMonoid(3));
false

#T# properties: IsMonogenicInverseSemigroup, 7
gap> S := FreeInverseSemigroup(1);;
gap> IsMonogenicInverseSemigroup(S);
true
gap> S := FreeInverseSemigroup(2);;
gap> IsMonogenicInverseSemigroup(S);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 4th choice method found for `IsMonogenicInverseSemigroup' on 1 argum\
ents

#T# properties: IsMonogenicMonoid, 1
gap> S := AsSemigroup(IsBooleanMatSemigroup, 
>                     Group((1, 2, 3), (2, 3)));;
gap> S := Monoid(S);;
gap> IsMonogenicMonoid(S);
false

#T# properties: IsMonogenicMonoid, 2
gap> IsMonogenicMonoid(SymmetricInverseMonoid(3));
false

#T# properties: IsMonogenicMonoid, 3
gap> IsMonogenicMonoid(Monoid(
> PartialPerm([1, 2, 3, 4, 5, 6, 7, 8], [10, 7, 2, 5, 6, 9, 3, 8])));
true

#T# properties: IsMonogenicMonoid, 4
gap> IsMonogenicMonoid(Monoid(
> PartialPerm([1, 2, 3, 4, 5, 6, 7, 8], [10, 7, 2, 5, 6, 9, 3, 8]),
> PartialPerm([1, 2, 3, 4, 5, 6, 7, 8], [10, 7, 2, 5, 6, 9, 3, 8])));
true

#T# properties: IsMonogenicMonoid, 5
gap> IsMonogenicMonoid(
> Monoid(Elements(Monoid(
> PartialPerm([1, 2, 3, 4, 5, 6, 7, 8], [10, 7, 2, 5, 6, 9, 3, 8])))));
true

#T# properties: IsMonogenicMonoid, 6
gap> IsMonogenicMonoid(BrauerMonoid(3));
false

#T# properties: IsMonogenicMonoid, 7
gap> S := FreeMonoid(1);;
gap> IsMonogenicMonoid(S);
true
gap> S := FreeMonoid(2);;
gap> IsMonogenicMonoid(S);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsMonogenicMonoid' on 1 arguments

#T# properties: IsMonogenicMonoid, 8
gap> S := SymmetricInverseMonoid(3);;
gap> GreensDClasses(S);;
gap> IsMonogenicMonoid(S);
false

#T# properties: IsMonogenicMonoid, 9
gap> S := MonogenicSemigroup(IsTransformationSemigroup, 3, 2);;
gap> S := Monoid(S.1, S.1 ^ 2);;
gap> GreensDClasses(S);;
gap> IsMonogenicMonoid(S);
true

#T# properties: IsMonogenicInverseMonoid, 1
gap> S := AsSemigroup(IsBooleanMatSemigroup, SymmetricGroup(3));;
gap> S := Monoid(S);;
gap> IsMonogenicInverseMonoid(S);
false

#T# properties: IsMonogenicInverseMonoid, 2
gap> IsMonogenicInverseMonoid(SymmetricInverseMonoid(3));
false

#T# properties: IsMonogenicInverseMonoid, 3
gap> IsMonogenicInverseMonoid(InverseMonoid(
> PartialPerm([1, 2, 3, 4, 5, 6, 7, 8], [10, 7, 2, 5, 6, 9, 3, 8])));
true

#T# properties: IsMonogenicInverseMonoid, 4
gap> IsMonogenicInverseMonoid(InverseMonoid(
> PartialPerm([1, 2, 3, 4, 5, 6, 7, 8], [10, 7, 2, 5, 6, 9, 3, 8]),
> PartialPerm([1, 2, 3, 4, 5, 6, 7, 8], [10, 7, 2, 5, 6, 9, 3, 8])));
true

#T# properties: IsMonogenicInverseMonoid, 5
gap> IsMonogenicInverseMonoid(
> InverseMonoid(Elements(InverseMonoid(
> PartialPerm([1, 2, 3, 4, 5, 6, 7, 8], [10, 7, 2, 5, 6, 9, 3, 8])))));
true

#T# properties: IsMonogenicInverseMonoid, 6
gap> IsMonogenicInverseMonoid(BrauerMonoid(3));
false

#T# properties: IsMonogenicInverseMonoid, 7
gap> S := FreeGroup(2);;
gap> GeneratorsOfInverseMonoid(S);;
gap> IsMonogenicInverseMonoid(S);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsMonogenicInverseMonoid' on 1 argument\
s

#T# properties: IsMonoidAsSemigroup, 1
gap> S := Semigroup(Transformation([1, 4, 6, 2, 5, 3, 7, 8, 9, 9]),
> Transformation([6, 3, 2, 7, 5, 1, 8, 8, 9, 9]));;
gap> IsMonoidAsSemigroup(S);
true

#T# properties: IsMonoidAsSemigroup, 2
gap> S := FreeGroup(1);;
gap> IsMonoidAsSemigroup(S);
true
gap> S := FreeSemigroup(1);;
gap> IsMonoidAsSemigroup(S);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `MultiplicativeNeutralElement' on 1 argu\
ments

#T# properties: IsOrthodoxSemigroup, 1
gap> gens := [Transformation([1, 1, 1, 4, 5, 4]),
>  Transformation([1, 2, 3, 1, 1, 2]),
>  Transformation([1, 2, 3, 1, 1, 3]),
>  Transformation([5, 5, 5, 5, 5, 5])];;
gap> S := Semigroup(gens);
<transformation semigroup of degree 6 with 4 generators>
gap> IsOrthodoxSemigroup(S);
true

#T# properties: IsOrthodoxSemigroup, 2
gap> S := Semigroup(
>   PBR(
>       [[-5, -4, -3, -2, -1, 1, 2, 4, 5], [-3, -1, 2, 6], [-6, -4, -3, -2, \
> 2, 5], [-6, -3, -2, 1, 2, 3, 4, 6], [-5, -4, -2, 1, 2, 5], [-4, -3, -2, \
> -1, 6]],
>         [[-6, -5, -4, -1, 1, 3, 4, 6], [-4, -2, 1, 2, 4, 6], [-5, -4, -3,
> -2, 3, 5, 6], [-6, -5, -4, -2, 1, 2, 3, 4], [-6, -5, -4, 1, 3], [-6, -\
> 5, -4, -2, 1, 4, 5]]),
>   PBR(
>       [[-6, -5, -3, -2, 1, 3, 4], [-6, -5, -4, -3, -2, -1, 1, 2, 3, 6], [\
> -1, 1, 2, 3, 4, 5], [-6, -5, -3, -1, 1, 6], [-5, -4, -2, -1, 1, 4, 5, 6],
> [-6, -4, -3, -2, -1, 1, 3]],
>         [[-4, 1, 6], [-6, -5, -4, -3, -1, 3, 5, 6], [-5, -4, -3, -2, 4, \
> 5, 6], [-2, -1, 1, 2, 3, 4, 6], [-5, -4, -3, -1, 2, 4, 5], [-6, -5, -3, \
> 1, 3, 4]]),
>   PBR(
>       [[-6, -5, -4, 2, 3, 5, 6], [-6, -5, -4, -3, -2, -1, 1, 2, 4], [-6, \
> -5, -4, -3, -2, -1, 1, 3, 6], [-6, -2, -1, 2, 4], [-5, -1, 1, 2, 3], [-6,
> -5, -3, -2, -1, 1, 2, 4, 6]],
>         [[-5, -4, -3, -2, 1, 5, 6], [-5, -3, -1, 2, 3, 5, 6], [-6, -4, -\
> 3, -1, 1, 2, 3, 4, 5], [-5, -4, 1, 4, 5], [-5, -4, -2, 4, 6], [-5, -3, -\
> 1, 1, 2, 3, 4, 5, 6]]),
>   PBR(
>       [[-4, -2, -1, 2, 5], [-6, -5, -2, -1, 1, 4], [-6, -3, -1, 3, 5],
> [-6, -4, -2, -1, 3, 6], [-5, -4, -2, 2, 4, 6], [-4, -2, -1, 1, 3, 5, 6]],
>         [[-4, 1, 4, 6], [-3, -2, 1, 4, 5, 6], [-4, -2, 1, 2, 4, 5], [-6,
> -5, -1, 1, 3, 4, 5, 6], [-6, -5, -4, -3, 1, 3, 5, 6], [-6, -5, -4, 3, 6]]),
>   PBR(
>       [[-6, -4, -3, 3, 6], [-5, -3, 2, 5, 6], [-6, -2, -1, 1, 3, 4, 5],
> [-3, -2, -1, 1, 2, 3, 4, 5], [-6, -5, -2, 3, 5], [-5, -4, -3, 2, 3, 5]],
>         [[-3, 1, 2, 3, 6], [-5, -4, -3, -1, 1, 2, 4, 6], [-6, -4, -3, -2,
> -1, 2], [-5, -4, 1, 3, 4, 5, 6], [-6, -5, -4, 5, 6], [-6, -4, -1, 1, 2, 3,
> 5, 6]]),
>   PBR(
>       [[-5, -3, -1, 4, 5], [-5, -3, 2, 4, 5, 6], [-6, -5, -4, -2, -1, 1, \
> 3, 5, 6], [-6, -5, 4, 5, 6], [-6, -1, 1, 2, 5, 6], [-3, -1, 1, 2, 4]],
>         [[-6, -4, -3, -2, -1, 1, 2, 3, 4, 6], [-6, -5, -2, 1, 2, 4], [-5,
> -3, -1, 3, 5, 6], [-6, -5, -4, -3, -1, 3, 4, 6], [-4, -3, 1, 3, 4, 6],
> [-6, -5, -4, -2, 1, 2, 3, 4, 6]]));
<pbr semigroup of degree 6 with 6 generators>
gap> IsOrthodoxSemigroup(S);
false

#T# properties: IsOrthodoxSemigroup, 3
gap> IsOrthodoxSemigroup(FullTransformationMonoid(3));
false

#T# properties: IsRectangularBand, 1
gap> S := Semigroup(RectangularBand(IsReesMatrixSemigroup, 4, 4));
<subsemigroup of 4x4 Rees matrix semigroup with 16 generators>
gap> IsRectangularBand(S);
true

#T# properties: IsRectangularBand, 2
gap> S := FullTransformationMonoid(3);;
gap> IsRectangularBand(S);
false

#T# properties: IsRectangularBand, 3
gap> IsRectangularBand(FreeBand(2));
false

#T# properties: IsRectangularBand, 4
gap> S := ReesMatrixSemigroup(Group([(1, 2)]),
> [[(), (), (), (), ()], [(), (), (), (), ()], [(), (), (), (), ()],
>  [(), (), (), (), ()], [(), (), (), (), ()]]);;
gap> IsBand(S);
false
gap> IsRectangularBand(S);
false

#T# properties: IsRectangularBand, 5
gap> S := ReesMatrixSemigroup(Group([(1, 2)]),
> [[(), (), (), (), ()], [(), (), (), (), ()], [(), (), (), (), ()],
>  [(), (), (), (), ()], [(), (), (), (), ()]]);;
gap> IsRectangularBand(S);
false

#T# properties: IsRectangularBand, 5
gap> IsRectangularBand(FreeSemigroup(2));
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsRectangularBand' on 1 arguments

#T# properties: IsRegularSemigroup, 1/7
gap> S := ReesMatrixSemigroup(Group([(1, 2)]),
> [[(), (), (), (), ()], [(), (), (), (), ()], [(), (), (), (), ()],
>  [(), (), (), (), ()], [(), (), (), (), ()]]);;
gap> IsRegularSemigroup(S);
true
gap> IsRegularSemigroup(AsSemigroup(IsTransformationSemigroup, S));
true

#T# properties: IsRegularSemigroup, 2/7
gap> S := ReesMatrixSemigroup(Group([(1, 2)]),
> [[(), (), (), (), ()], [(), (), (), (), ()], [(), (), (), (), ()],
>  [(), (), (), (), ()], [(), (), (), (), ()]]);;
gap> IsRegularSemigroup(S);
true

#T# properties: IsRegularSemigroup, 3/7
gap> gens := [Transformation([1, 2, 4, 3, 6, 5, 4]),
>  Transformation([1, 2, 5, 6, 3, 4, 5]),
>  Transformation([2, 1, 2, 2, 2, 2, 2])];;
gap> S := Semigroup(gens);
<transformation semigroup of degree 7 with 3 generators>
gap> IsCompletelyRegularSemigroup(S);
true
gap> IsRegularSemigroup(S);
true

#T# properties: IsRegularSemigroup, 4/7
gap> S := AsSemigroup(IsTransformationSemigroup, PartitionMonoid(3));
<transformation monoid of size 203, degree 203 with 4 generators>
gap> DClasses(S);;
gap> IsRegularSemigroup(S);
true
gap> S := Semigroup(PartitionMonoid(3));
<bipartition monoid of degree 3 with 4 generators>
gap> DClasses(S);;
gap> IsRegularSemigroup(S);
true

#T# properties: IsRegularSemigroup, 5/7
gap> S := Semigroup([Bipartition([[1, 2, 3, 4, -1, -3], [-2], [-4]]),
>  Bipartition([[1, 2, 4, -4], [3, -3], [-1], [-2]]),
>  Bipartition([[1, 3], [2, 4, -1], [-2, -3, -4]]),
>  Bipartition([[1, -4], [2, 4, -1, -3], [3, -2]])]);;
gap> IsRegularSemigroup(S);
false

#T# properties: IsRegularSemigroup, 6/7
gap> gens := [Transformation([1, 2, 4, 3, 6, 5, 4]),
>  Transformation([1, 2, 5, 6, 3, 4, 5]),
>  Transformation([2, 1, 2, 2, 2, 2, 2])];;
gap> S := AsSemigroup(IsBipartitionSemigroup, Semigroup(gens));
<bipartition semigroup of degree 7 with 3 generators>
gap> IsCompletelyRegularSemigroup(S);
true
gap> IsRegularSemigroup(S);
true

#T# properties: IsRegularSemigroup, 7/7
gap> S := ReesMatrixSemigroup(Group([(1, 2)]),
> [[(), (), (), (), ()], [(), (), (), (), ()]]);;
gap> IsRegularSemigroup(AsSemigroup(IsBipartitionSemigroup, S));
true

#T# properties: IsRegularElementSemigroup, 1/8
gap> S := Semigroup([Transformation([6, 9, 10, 1, 11, 3, 6, 6, 2, 10, 12, 2]),
>  Transformation([7, 8, 8, 11, 2, 11, 10, 2, 11, 4, 4, 7])]);
<transformation semigroup of degree 12 with 2 generators>
gap> x := Transformation([3, 10, 5, 10, 7, 2, 5, 6, 12, 11, 11, 9]);;
gap> IsRegularSemigroupElement(S, x);
false
gap> IsRegularSemigroupElementNC(S, x);
false
gap> x := Transformation([1, 1, 1, 10, 1, 10, 12, 1, 10, 10, 10, 1]);;
gap> IsRegularSemigroupElement(S, x);
false
gap> IsRegularSemigroupElementNC(S, x);
false

#T# properties: IsRegularElementSemigroup, 2/8
gap> S := Semigroup([Transformation([6, 9, 10, 1, 11, 3, 6, 6, 2, 10, 12, 2]),
>  Transformation([7, 8, 8, 11, 2, 11, 10, 2, 11, 4, 4, 7])]);
<transformation semigroup of degree 12 with 2 generators>
gap> Size(S);
2030
gap> x := Transformation([1, 1, 1, 10, 1, 10, 12, 1, 10, 10, 10, 1]);;
gap> IsRegularSemigroupElement(S, x);
false
gap> IsRegularSemigroupElementNC(S, x);
false

#T# properties: IsRegularElementSemigroup, 3/8
gap> IsRegularSemigroupElement(FullTransformationMonoid(3),
> Transformation([1, 1, 1]));
true
gap> IsRegularSemigroupElementNC(FullTransformationMonoid(3),
> Transformation([1, 1, 1]));
true

#T# properties: IsRegularElementSemigroup, 4/8
gap> S := Semigroup(FullTransformationMonoid(3));
<transformation monoid of degree 3 with 3 generators>
gap> IsRegularSemigroupElement(S, Transformation([1, 1, 1]));
true
gap> IsRegularSemigroupElementNC(S, Transformation([1, 1, 1]));
true

#T# properties: IsRegularElementSemigroup, 5/8
gap> S := Semigroup([Transformation([6, 9, 10, 1, 11, 3, 6, 6, 2, 10, 12, 2]),
>  Transformation([7, 8, 8, 11, 2, 11, 10, 2, 11, 4, 4, 7])]);
<transformation semigroup of degree 12 with 2 generators>
gap> IsRegularSemigroupElement(AsSemigroup(IsBipartitionSemigroup, S), Bipartition([[1,
> 2, 3, 4, 5, 7, -4, -10, -11, -12], [6, 11, -6, -7, -9],
>  [8, 9, 10, -2, -3, -5, -8], [12, -1]]));
false
gap> x := Bipartition([[1, 2, 6, 10, -1, -3, -4, -5, -7],
> [3, 5, 7, 11, -2, -8, -9], [4, 8, 9, 12, -10], [-6, -11, -12]]);;
gap> IsRegularSemigroupElement(AsSemigroup(IsBipartitionSemigroup, S), x);
false
gap> IsRegularSemigroupElementNC(AsSemigroup(IsBipartitionSemigroup, S), x);
false

#T# properties: IsRegularElementSemigroup, 6/8
gap> S := Semigroup([Transformation([6, 9, 10, 1, 11, 3, 6, 6, 2, 10, 12, 2]),
>  Transformation([7, 8, 8, 11, 2, 11, 10, 2, 11, 4, 4, 7])]);
<transformation semigroup of degree 12 with 2 generators>
gap> Size(S);
2030
gap> x := Bipartition([[1, 2, 6, 10, -1, -3, -4, -5, -7],
> [3, 5, 7, 11, -2, -8, -9], [4, 8, 9, 12, -10], [-6, -11, -12]]);;
gap> IsRegularSemigroupElement(AsSemigroup(IsBipartitionSemigroup, S), x);
false
gap> IsRegularSemigroupElementNC(AsSemigroup(IsBipartitionSemigroup, S), x);
false

#T# properties: IsRegularElementSemigroup, 7/8
gap> IsRegularSemigroupElement(PartitionMonoid(3), Bipartition([[1, 2, 3,
> -1, -2], [-3]]));
true
gap> IsRegularSemigroupElementNC(PartitionMonoid(3), Bipartition([[1, 2, 3,
> -1, -2], [-3]]));
true

#T# properties: IsRegularElementSemigroup, 8/8
gap> S := Semigroup(PartitionMonoid(3));
<bipartition monoid of degree 3 with 4 generators>
gap> IsRegularSemigroupElement(S, Bipartition([[1, -1], [2, 3, -2, -3]]));
true
gap> IsRegularSemigroupElementNC(S, Bipartition([[1, -1], [2, 3, -2, -3]]));
true

#T# properties: IsRightSimple, non-regular, 1
gap> S := RegularBooleanMatMonoid(3);
<monoid of 3x3 boolean matrices with 4 generators>
gap> IsRegularSemigroup(S);
false
gap> IsRightSimple(S);
false

#T# properties: IsRightSimple, right zero, 2
gap> S := TrivialSemigroup();
<trivial transformation group of degree 0 with 1 generator>
gap> IsRightZeroSemigroup(S);
true
gap> IsRightSimple(S);
true

# #T# properties: IsRightSimple, known L-classes, 3
# gap> S := Monoid([Matrix(GF(11), [[0 * Z(11)]]),
# >  Matrix(GF(11), [[Z(11)]]),
# >  Matrix(GF(11), [[Z(11) ^ 4]]),
# >  Matrix(GF(11), [[Z(11) ^ 5]]),
# >  Matrix(GF(11), [[Z(11) ^ 8]]),
# >  Matrix(GF(11), [[Z(11) ^ 9]])]);
# <monoid of 1x1 prime field matrices with 6 generators>
# gap> NrRClasses(S);
# 2
# gap> IsRightSimple(S);
# false

#T# properties: IsRightSimple, acting, 4
gap> S := JonesMonoid(3);
<regular bipartition *-monoid of degree 3 with 2 generators>
gap> IsRightSimple(S);
false

#T# properties: IsRightSimple, non-acting, 5
gap> S := RegularBooleanMatMonoid(3);
<monoid of 3x3 boolean matrices with 4 generators>
gap> IsRightSimple(S);
false

#T# properties: IsRightSimple, infinite, 6
gap> IsRightSimple(FreeSemigroup(2));
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsRightSimple' on 1 arguments

#T# properties: IsRightZeroSemigroup, 1
gap> S := RightZeroSemigroup(4);;
gap> IsRightZeroSemigroup(S);
true
gap> I := SemigroupIdeal(S, S.1);;
gap> IsRightZeroSemigroup(I);
true

#T# properties: IsRightZeroSemigroup, 2
gap> S := AsSemigroup(IsTransformationSemigroup, 
> RectangularBand(IsReesMatrixSemigroup, 2, 2));
<transformation semigroup of size 4, degree 5 with 2 generators>
gap> IsRightZeroSemigroup(S);
false

#T# properties: IsRightZeroSemigroup, 3
gap> IsRightZeroSemigroup(FreeSemigroup(10));
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsRightZeroSemigroup' on 1 arguments

#T# properties: IsSemilattice, 1/?
gap> T := Monoid([Transformation([6, 2, 3, 4, 6, 6]),
>   Transformation([1, 6, 6, 4, 5, 6]),
>   Transformation([1, 2, 6, 4, 6, 6]),
>   Transformation([6, 6, 3, 4, 5, 6]),
>   Transformation([1, 6, 6, 6, 5, 6]),
>   Transformation([1, 2, 6, 6, 6, 6]),
>   Transformation([6, 2, 3, 6, 6, 6]),
>   Transformation([6, 6, 3, 6, 5, 6])]);
<transformation monoid of degree 6 with 8 generators>
gap> IsSemilattice(T);
true
gap> I := SemigroupIdeal(T, T.1);
<inverse transformation semigroup ideal of degree 6 with 1 generator>
gap> IsSemilattice(I);
true
gap> T := Semigroup(T);
<transformation monoid of degree 6 with 8 generators>
gap> IsInverseSemigroup(T);
true
gap> IsSemilattice(T);
true
gap> I := SemigroupIdeal(T, T.1);
<inverse transformation semigroup ideal of degree 6 with 1 generator>
gap> IsSemilattice(I);
true
gap> T := Semigroup(T);;
gap> IsInverseSemigroup(T);;
gap> I := SemigroupIdeal(T, T.1);
<inverse transformation semigroup ideal of degree 6 with 1 generator>
gap> IsSemilattice(I);
true
gap> IsSemilattice(FreeInverseSemigroup(1));
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsCommutativeSemigroup' on 1 arguments

#T# properties: IsSimpleSemigroup, 1/?
gap> S := AsSemigroup(IsTransformationSemigroup, RegularBooleanMatMonoid(3));
<transformation monoid of degree 8 with 4 generators>
gap> IsRegularSemigroup(S);
false
gap> IsSimpleSemigroup(S);
false

#T# properties: IsSimpleSemigroup, 2/?
gap> S := AsSemigroup(IsTransformationSemigroup, RegularBooleanMatMonoid(3));
<transformation monoid of degree 8 with 4 generators>
gap> IsCompletelyRegularSemigroup(S);
false
gap> IsSimpleSemigroup(S);
false

#T# properties: IsSimpleSemigroup, 3/?
gap> S := AsSemigroup(IsTransformationSemigroup, RegularBooleanMatMonoid(3));
<transformation monoid of degree 8 with 4 generators>
gap> NrDClasses(S);
10
gap> IsSimpleSemigroup(S);
false

#T# properties: IsSimpleSemigroup, 3/?
gap> S := Semigroup([Transformation([4, 1, 6, 6, 6, 6]),
>  Transformation([5, 4, 2, 6, 3, 6]),
>  Transformation([2, 6, 6, 1, 6, 6]),
>  Transformation([6, 3, 5, 2, 1, 6])]);
<transformation semigroup of degree 6 with 4 generators>
gap> I := SemigroupIdeal(S, S.1);;
gap> IsSimpleSemigroup(I);
false

#T# properties: IsTrivial, 1
gap> S := TrivialSemigroup();
<trivial transformation group of degree 0 with 1 generator>
gap> Size(S);
1
gap> IsTrivial(S);
true

#T# properties: IsTrivial, 2
gap> S := FreeSemigroup(1);;
gap> x := GeneratorsOfSemigroup(S);;
gap> S := S / [[x[1] * x[1], x[1]]];
<fp semigroup on the generators [ s1 ]>
gap> IsTrivial(S);
true

#T# properties: IsTrivial, 3
gap> S := FreeSemigroup(1);;
gap> x := GeneratorsOfSemigroup(S);;
gap> S := S / [[x[1], x[1]]];
<fp semigroup on the generators [ s1 ]>
gap> IsTrivial(S);
false

#T# properties: IsUnitRegularMonoid, 1/7
gap> IsUnitRegularMonoid(FullTransformationMonoid(3));
true

#T# properties: IsUnitRegularMonoid, 2/7
gap> IsUnitRegularMonoid(SingularTransformationSemigroup(3));
false

#T# properties: IsUnitRegularMonoid, error, 3/7
gap> IsUnitRegularMonoid(FreeInverseSemigroup(3));
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsUnitRegularMonoid' on 1 arguments

#T# properties: IsUnitRegularMonoid, 4/7
gap> IsUnitRegularMonoid(Semigroup(SingularTransformationSemigroup(3),
> IdentityTransformation));
false

#T# properties: IsUnitRegularMonoid, 5/7
gap> S := AsSemigroup(IsTransformationSemigroup, RegularBooleanMatMonoid(3));
<transformation monoid of degree 8 with 4 generators>
gap> IsUnitRegularMonoid(S);
false

#T# properties: IsUnitRegularMonoid, 6/7
gap> IsUnitRegularMonoid(PartitionMonoid(3));
false

#T# properties: IsUnitRegularMonoid, 7/7
gap> S := Semigroup([Transformation([1, 2, 3, 3]),
>  Transformation([2, 3, 1, 1]), Transformation([2, 1, 3, 3]),
>  Transformation([4, 2, 3, 3]), Transformation([3, 4, 1, 1]),
>  Transformation([4, 1, 2, 2]), Transformation([2, 3, 3, 1]),
>  Transformation([1, 2, 3, 1]), Transformation([3, 3, 1, 2]),
>  Transformation([3, 2, 3, 1]), Transformation([2, 1, 3, 1]),
>  Transformation([2, 3, 1])]);;
gap> IsRegularSemigroup(S);
true
gap> IsUnitRegularMonoid(S);
false

#T# properties: IsZeroGroup, 1
gap> IsZeroGroup(JonesMonoid(3));
false

#T# properties: IsZeroGroup, 2
gap> IsZeroGroup(ZeroSemigroup(2));
false

#T# properties: IsZeroGroup, 3
gap> IsZeroGroup(SymmetricInverseMonoid(3));
false

#T# properties: IsZeroGroup, 4
gap> S := Semigroup(PartialPerm([1]), PartialPerm([]));
<partial perm monoid of rank 1 with 2 generators>
gap> IsZeroGroup(S);
true
gap> I := SemigroupIdeal(S, PartialPerm([]));;
gap> IsZeroGroup(I);
false

#T# properties: IsZeroGroup, 5
gap> IsZeroGroup(FreeSemigroup(2));
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsZeroGroup' on 1 arguments

#T# properties: IsZeroRectangularBand, 1
gap> S := ReesZeroMatrixSemigroup(Group([()]), [[(), ()], [(), ()]]);
<Rees 0-matrix semigroup 2x2 over Group(())>
gap> IsZeroRectangularBand(S);
true
gap> I := SemigroupIdeal(S, MultiplicativeZero(S));;
gap> IsZeroRectangularBand(I);
false

#T# properties: IsZeroRectangularBand, 2
gap> S := ReesZeroMatrixSemigroup(Group([(1, 2)]), [[(), ()], [(), ()]]);
<Rees 0-matrix semigroup 2x2 over Group([ (1,2) ])>
gap> IsZeroRectangularBand(S);
false

#T# properties: IsZeroRectangularBand, 3
gap> IsZeroRectangularBand(FullTransformationMonoid(2));
false

#T# properties: IsZeroRectangularBand, 4
gap> S := ReesZeroMatrixSemigroup(Group([()]), [[(), ()], [(), ()]]);
<Rees 0-matrix semigroup 2x2 over Group(())>

#T# properties: IsZeroRectangularBand, 5
gap> IsZeroRectangularBand(FreeSemigroup(20));
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsZeroRectangularBand' on 1 arguments

#T# properties: IsZeroSemigroup, 1
gap> S := Semigroup(ZeroSemigroup(IsPartialPermSemigroup, 3));
<partial perm semigroup of rank 2 with 2 generators>
gap> IsZeroSemigroup(S);
true
gap> T := SemigroupIdeal(S, S.1);;
gap> IsZeroSemigroup(T);
true

#T# properties: IsZeroSemigroup, 2
gap> S := Semigroup(BrauerMonoid(3));
<bipartition monoid of degree 3 with 3 generators>
gap> IsZeroSemigroup(S);
false

#T# properties: IsZeroSemigroup, 3
gap> S := Semigroup(DualSymmetricInverseMonoid(3));
<block bijection monoid of degree 3 with 3 generators>
gap> IsZeroSemigroup(S);
false

#T# properties: IsZeroSemigroup, 3
gap> IsZeroSemigroup(FreeSemigroup(3));
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsZeroSemigroup' on 1 arguments

#T# properties: IsNilpotentSemigroup, 1
gap> S := ReesZeroMatrixSemigroup(Group(()), [[()]]);
<Rees 0-matrix semigroup 1x1 over Group(())>
gap> IsNilpotentSemigroup(S);
false

#T# properties: IsNilpotentSemigroup, 2
gap> S := ReesMatrixSemigroup(Group(()), [[()]]);
<Rees matrix semigroup 1x1 over Group(())>
gap> IsNilpotentSemigroup(S);
true

#T# properties: IsNilpotentSemigroup, 3
gap> S := ReesZeroMatrixSemigroup(Group(()), [[0]]);
<Rees 0-matrix semigroup 1x1 over Group(())>
gap> IsNilpotentSemigroup(S);
true

#T# properties: IsNilpotentSemigroup, 4
gap> S := Semigroup(Transformation([1, 1, 2, 3, 4]));
<commutative transformation semigroup of degree 5 with 1 generator>
gap> IsNilpotentSemigroup(S);
true

#T# properties: IsNilpotentSemigroup, 5
gap> S := Semigroup([
>  PartialPerm([1, 2, 3, 4], [1, 2, 5, 3]),
>  PartialPerm([1, 2, 3, 5], [4, 1, 3, 5])]);
<partial perm semigroup of rank 5 with 2 generators>
gap> IsNilpotentSemigroup(S);
false

#T# properties: IsNilpotentSemigroup, 6
gap> S := Semigroup([
>  PartialPerm([1, 2, 3, 4], [1, 2, 5, 3]),
>  PartialPerm([1, 2, 3, 5], [4, 1, 3, 5])]);
<partial perm semigroup of rank 5 with 2 generators>
gap> NrIdempotents(S);
3
gap> IsNilpotentSemigroup(S);
false

#T# properties: IsNilpotentSemigroup, 7
gap> S := Semigroup([
>  PartialPerm([2], [1]), PartialPerm([1, 2], [3, 1]),
>  PartialPerm([1, 2], [4, 1]), PartialPerm([1, 2], [5, 1]),
>  PartialPerm([3], [5]), PartialPerm([2, 3], [3, 5]),
>  PartialPerm([1, 3], [3, 5]), PartialPerm([1, 2, 3], [3, 1, 5]),
>  PartialPerm([1, 2, 3], [3, 4, 5]), PartialPerm([3, 4], [5, 3]),
>  PartialPerm([2, 4], [4, 5]), PartialPerm([2, 3, 4], [4, 5, 3]),
>  PartialPerm([1, 2, 4], [3, 1, 5]), PartialPerm([1, 2, 4], [4, 1, 5]),
>  PartialPerm([1, 2, 3, 4], [4, 1, 5, 3])]);
<partial perm semigroup of rank 4 with 15 generators>
gap> IsNilpotentSemigroup(S);
true

#T# properties: IsNilpotentSemigroup, 8
gap> S := FreeSemigroup(1);;
gap> IsNilpotentSemigroup(S);
Error, no method found! For debugging hints type ?Recovery from NoMethodFound
Error, no 3rd choice method found for `IsNilpotentSemigroup' on 1 arguments
gap> S := Semigroup(Transformation([2, 1]));;
gap> IsNilpotentSemigroup(S);
false

#T# properties: IsRectangularGroup, 1
gap> R := RectangularBand(10, 10);;
gap> G := AsSemigroup(IsTransformationSemigroup, SymmetricGroup(5));;
gap> S := DirectProduct(R, G);
<transformation semigroup of size 12000, degree 18 with 11 generators>
gap> IsRectangularGroup(S);
true
gap> S := DirectProduct(G, R);
<transformation semigroup of size 12000, degree 18 with 11 generators>
gap> IsRectangularGroup(S);
true
gap> IsRectangularGroup(PartitionMonoid(3));
false

#T# PropertiesTest58: IsSemigroupWithAdjoinedZero
gap> S := SymmetricInverseMonoid(10);;
gap> IsSemigroupWithAdjoinedZero(S);
false
gap> S := FullTransformationMonoid(12);;
gap> IsSemigroupWithAdjoinedZero(S);
false
gap> S := ReesMatrixSemigroup(SymmetricGroup(4), [[(1,3,2), (4,2)]]);
<Rees matrix semigroup 2x1 over Sym( [ 1 .. 4 ] )>
gap> IsSemigroupWithAdjoinedZero(S);
false
gap> S := ReesZeroMatrixSemigroup(SymmetricGroup(4), [[(1,3,2), (4,2)]]);
<Rees 0-matrix semigroup 2x1 over Sym( [ 1 .. 4 ] )>
gap> IsSemigroupWithAdjoinedZero(S);
true

#T# SEMIGROUPS_UnbindVariables
gap> Unbind(D);
gap> Unbind(I);
gap> Unbind(J);
gap> Unbind(R);
gap> Unbind(S);
gap> Unbind(T);
gap> Unbind(gens);
gap> Unbind(x);

#E#
gap> STOP_TEST("Semigroups package: standard/properties.tst");
