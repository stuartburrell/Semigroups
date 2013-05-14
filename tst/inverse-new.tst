#############################################################################
##
#W  inverse.tst
#Y  Copyright (C) 2011-12                                James D. Mitchell
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##
gap> START_TEST("Semigroups package: inverse.tst");
gap> LoadPackage("semigroups", false);;

# 
gap> SemigroupsStartTest();

#
gap> gens:=[PartialPermNC( [ 1, 2, 4 ], [ 1, 5, 2 ] ),
> PartialPermNC( [ 1, 2, 3 ], [ 2, 3, 5 ] ),
> PartialPermNC( [ 1, 3, 4 ], [ 2, 5, 4 ] ),
> PartialPermNC( [ 1, 2, 4 ], [ 3, 1, 2 ] ),
> PartialPermNC( [ 1, 2, 3 ], [ 3, 1, 4 ] ),
> PartialPermNC( [ 1, 2, 4 ], [ 3, 5, 2 ] ),
> PartialPermNC( [ 1, 2, 3, 4 ], [ 4, 1, 5, 2 ] ),
> PartialPermNC( [ 1, 2, 4, 5 ], [ 4, 3, 5, 2 ] ),
> PartialPermNC( [ 1, 2, 3, 4, 5 ], [ 5, 2, 4, 3, 1 ] ),
> PartialPermNC( [ 1, 3, 5 ], [ 5, 4, 1 ] )];;
gap> s:=InverseSemigroup(gens);                 
<inverse partial perm semigroup on 5 pts with 10 generators>
gap> Size(s);
860
gap> NrRClasses(s);
31
gap> RClassReps(s);
[ [5,2,4](1), [3,4][5,1](2), [5,2,4,1], [3,1,2,4], [3,2](1,4), [5,1,4,2], 
  <identity partial perm on [ 1, 2, 4 ]>, [3,2][5,4](1), [3,4,1](2), 
  [3,2][5,4,1], [5,3](1,2,4), [5,1](2,3,4), 
  <identity partial perm on [ 1, 2, 3, 4 ]>, [5,2,4](1,3), (1,5)(2)(3,4), 
  [5,4](1), [2,1][3,4], [3,1,4], [3,1][5,4], 
  <identity partial perm on [ 1, 4 ]>, [2,4,1], [5,4,1], [3,4,1], [2,4][5,1], 
  [2,4](1), [2,1], [5,1], <identity partial perm on [ 1 ]>, [3,1], [4,1], 
  <empty partial perm> ]
gap> List(last, DomainOfPartialPerm);
[ [ 1, 2, 5 ], [ 2, 3, 5 ], [ 2, 4, 5 ], [ 1, 2, 3 ], [ 1, 3, 4 ], 
  [ 1, 4, 5 ], [ 1, 2, 4 ], [ 1, 3, 5 ], [ 2, 3, 4 ], [ 3, 4, 5 ], 
  [ 1, 2, 4, 5 ], [ 2, 3, 4, 5 ], [ 1, 2, 3, 4 ], [ 1, 2, 3, 5 ], 
  [ 1, 2, 3, 4, 5 ], [ 1, 5 ], [ 2, 3 ], [ 1, 3 ], [ 3, 5 ], [ 1, 4 ], 
  [ 2, 4 ], [ 4, 5 ], [ 3, 4 ], [ 2, 5 ], [ 1, 2 ], [ 2 ], [ 5 ], [ 1 ], 
  [ 3 ], [ 4 ], [  ] ]
gap> IsDuplicateFreeList(last);
true

#
gap> s:=InverseSemigroup(PartialPermNC([ 1, 2 ], [ 1, 2 ]),
> PartialPermNC([ 1, 2 ], [ 1, 3 ]));;
gap> GreensHClasses(s);
[ {PartialPerm( [ 1, 2 ], [ 1, 2 ] )}, {PartialPerm( [ 1, 3 ], [ 1, 2 ] )}, 
  {PartialPerm( [ 1, 2 ], [ 1, 3 ] )}, {PartialPerm( [ 1, 3 ], [ 1, 3 ] )}, 
  {PartialPerm( [ 1 ], [ 1 ] )} ]
gap> s:=InverseSemigroup(Generators(s));;
gap> HClassReps(s);
[ <identity partial perm on [ 1, 2 ]>, <identity partial perm on [ 1 ]>, 
  [2,3](1), <identity partial perm on [ 1 ]>, 
  <identity partial perm on [ 1 ]> ]
gap> GreensHClasses(s);
[ {PartialPerm( [ 1, 2 ], [ 1, 2 ] )}, {PartialPerm( [ 1, 3 ], [ 1, 2 ] )}, 
  {PartialPerm( [ 1, 2 ], [ 1, 3 ] )}, {PartialPerm( [ 1, 3 ], [ 1, 3 ] )}, 
  {PartialPerm( [ 1 ], [ 1 ] )} ]

#
gap> gens:=[PartialPermNC( [ 1, 2, 3, 5, 6, 7, 8, 11, 12, 16, 19 ], 
> [ 9, 18, 20, 11, 5, 16, 8, 19, 14, 13, 1 ] ),
> PartialPermNC( [ 1, 2, 3, 4, 5, 6, 8, 9, 10, 12, 14, 16, 18, 19, 20 ], 
> [ 13, 1, 8, 5, 4, 14, 11, 12, 9, 20, 2, 18, 7, 3, 19 ] )];;
gap> s:=InverseSemigroup(gens);;
gap> d:=DClass(s, Generators(s)[1]);
{PartialPerm( [ 1, 5, 8, 9, 11, 13, 14, 16, 18, 19, 20 ], 
 [ 1, 5, 8, 9, 11, 13, 14, 16, 18, 19, 20 ] )}
gap> Size(s);
60880
gap> h:=HClass(d, Generators(s)[1]);
{PartialPerm( [ 1, 2, 3, 5, 6, 7, 8, 11, 12, 16, 19 ], 
 [ 9, 18, 20, 11, 5, 16, 8, 19, 14, 13, 1 ] )}
gap> Generators(s)[1] in h;
true
gap> DClassOfHClass(h)=d;
true
gap> DClassOfHClass(h);  
{PartialPerm( [ 1, 5, 8, 9, 11, 13, 14, 16, 18, 19, 20 ], 
 [ 1, 5, 8, 9, 11, 13, 14, 16, 18, 19, 20 ] )}
gap> r:=RClassOfHClass(h);
{PartialPerm( [ 1, 2, 3, 5, 6, 7, 8, 11, 12, 16, 19 ], 
 [ 9, 18, 20, 11, 5, 16, 8, 19, 14, 13, 1 ] )}
gap> ForAll(h, x-> x in r);   
true
gap> l:=LClass(h);   
{PartialPerm( [ 1, 5, 8, 9, 11, 13, 14, 16, 18, 19, 20 ], 
 [ 1, 5, 8, 9, 11, 13, 14, 16, 18, 19, 20 ] )}
gap> ForAll(h, x-> x in l);
true
gap> Representative(l) in l;
true
gap> IsGreensLClass(l);
true
gap> DClassOfLClass(l)=d;
true
gap> DClassOfRClass(r)=d;
true
gap> S:=InverseSemigroup(PartialPermNC([ 1, 2, 3, 6, 8, 10 ], 
> [ 2, 6, 7, 9, 1, 5 ]), PartialPermNC([ 1, 2, 3, 4, 6, 7, 8, 10 ], 
> [ 3, 8, 1, 9, 4, 10, 5, 6 ]));
<inverse partial perm semigroup on 10 pts with 2 generators>
gap> f:=Generators(S)[1];
[3,7][8,1,2,6,9][10,5]
gap> h:=HClass(S, f);
{PartialPerm( [ 1, 2, 3, 6, 8, 10 ], [ 2, 6, 7, 9, 1, 5 ] )}
gap> IsGreensHClass(h);
true
gap> RClassOfHClass(h);
{PartialPerm( [ 1, 2, 3, 6, 8, 10 ], [ 2, 6, 7, 9, 1, 5 ] )}
gap> LClassOfHClass(h);
{PartialPerm( [ 1, 2, 5, 6, 7, 9 ], [ 1, 2, 5, 6, 7, 9 ] )}
gap> r:=RClassOfHClass(h);
{PartialPerm( [ 1, 2, 3, 6, 8, 10 ], [ 2, 6, 7, 9, 1, 5 ] )}
gap> l:=LClass(h);
{PartialPerm( [ 1, 2, 5, 6, 7, 9 ], [ 1, 2, 5, 6, 7, 9 ] )}
gap> DClass(r)=DClass(l);
true
gap> DClass(h)=DClass(l);
true
gap> f:=PartialPermNC([ 1, 2, 3, 5, 6, 7, 8, 11, 12, 16, 19 ], 
> [ 9, 18, 20, 11, 5, 16, 8, 19, 14, 13, 1 ]);;
gap> h:=HClass(s, f);
{PartialPerm( [ 1, 2, 3, 5, 6, 7, 8, 11, 12, 16, 19 ], 
 [ 9, 18, 20, 11, 5, 16, 8, 19, 14, 13, 1 ] )}
gap> ForAll(h, x-> x in RClassOfHClass(h));
true
gap> Size(h);
1
gap> IsGroupHClass(h);
false
gap> iter:=IteratorOfHClasses(s);
<iterator of H-classes>
gap> repeat h:=NextIterator(iter); until Size(h)>1 or IsDoneIterator(iter);
gap> h;
{PartialPerm( [ 8, 20 ], [ 8, 20 ] )}
gap> IsDoneIterator(iter);
false
gap> ForAll(HClasses(s), IsTrivial);
false
gap> First(HClasses(s), x-> not IsTrivial(x));
{PartialPerm( [ 8, 20 ], [ 8, 20 ] )}
gap> Size(last);
2
gap> iter:=IteratorOfHClasses(s);                                          
<iterator of H-classes>
gap> repeat h:=NextIterator(iter); until Size(h)>1 or IsDoneIterator(iter);
gap> h;
{PartialPerm( [ 8, 20 ], [ 8, 20 ] )}
gap> IsDoneIterator(iter);
false
gap> s:=InverseSemigroup(Generators(s));
<inverse partial perm semigroup on 18 pts with 2 generators>
gap> iter:=IteratorOfHClasses(s);
<iterator of H-classes>
gap> repeat h:=NextIterator(iter); until Size(h)>1 or IsDoneIterator(iter);
gap> h;
{PartialPerm( [ 8, 20 ], [ 8, 20 ] )}
gap> Size(h);
2
gap> IsDoneIterator(iter);
false
gap> iter:=IteratorOfHClasses(s);
<iterator of H-classes>
gap> h:=NextIterator(iter);
{PartialPerm( [ 1, 5, 8, 9, 11, 13, 14, 16, 18, 19, 20 ], 
 [ 1, 5, 8, 9, 11, 13, 14, 16, 18, 19, 20 ] )}
gap> Size(h);
1
gap> h:=NextIterator(iter);
{PartialPerm( [ 1, 2, 3, 5, 6, 7, 8, 11, 12, 16, 19 ], 
 [ 9, 18, 20, 11, 5, 16, 8, 19, 14, 13, 1 ] )}
gap> Size(h);
1
gap> h:=NextIterator(iter);
{PartialPerm( [ 1, 5, 8, 9, 11, 13, 14, 16, 18, 19, 20 ], 
 [ 19, 6, 8, 1, 5, 16, 12, 7, 2, 11, 3 ] )}
gap> Size(h);
1
gap> iter:=IteratorOfHClasses(s);
<iterator of H-classes>
gap> Size(h);
1
gap> f:=PartialPermNC([8,20], [8,20]);
<identity partial perm on [ 8, 20 ]>
gap> iter:=IteratorOfHClasses(s);
<iterator of H-classes>
gap> repeat h:=NextIterator(iter); until Size(h)>1 or IsDoneIterator(iter);
gap> h;
{PartialPerm( [ 8, 20 ], [ 8, 20 ] )}
gap> f in h;
true
gap> f in s;
true
gap> hh:=HClass(s, f);
{PartialPerm( [ 8, 20 ], [ 8, 20 ] )}
gap> iter:=IteratorOfHClasses(s);
<iterator of H-classes>
gap> repeat h:=NextIterator(iter); until h=hh or IsDoneIterator(iter);     
gap> h;
{PartialPerm( [ 8, 20 ], [ 8, 20 ] )}
gap> IsDoneIterator(iter);
false
gap> NrHClasses(s);
40715
gap> i:=0;                                                         
0
gap> iter:=IteratorOfHClasses(s);;
gap> repeat i:=i+1; NextIterator(iter); until IsDoneIterator(iter);
gap> i;
40715
gap> IsGreensHClass(h);
true
gap> IsGreensHClass(hh);
true
gap> f in HClassReps(s);
true
gap> Representative(h) in HClassReps(s);
true
gap> iter:=IteratorOfHClassReps(s);
<iterator of H-class reps>
gap> s:=InverseSemigroup(Generators(s));
<inverse partial perm semigroup on 18 pts with 2 generators>
gap> iter:=IteratorOfHClassReps(s);
<iterator of H-class reps>
gap> i:=0;
0

#JDM this breaks when i=38360 fairly reliably, it seems to be a problem in 
# IsDoneIterator of iter. 
#gap> for f in iter do i:=i+1; if not
#f in s then Print("yikes"); break; fi; if i=38360 then break; fi; od;
gap> iter:=IteratorOfHClasses(s);                                  
<iterator of H-classes>
gap> repeat h:=NextIterator(iter); until Size(h)>1 or IsDoneIterator(iter);
gap> h;
{PartialPerm( [ 8, 20 ], [ 8, 20 ] )}
gap> Size(h);
2
gap> Size(DClass(h));
40328
gap> RClass(h);
{PartialPerm( [ 8, 20 ], [ 8, 20 ] )}
gap> Size(last);
284
gap> 284^2;
80656
gap> d:=DClass(h);
{PartialPerm( [ 8, 20 ], [ 8, 20 ] )}
gap> IsGreensDClass(d);
true
gap> d;
{PartialPerm( [ 8, 20 ], [ 8, 20 ] )}
gap> Size(DClass(h))=Size(RClass(h))^2/2;
true

#
gap> file:=Concatenation(SemigroupsDir(), "/examples/graph7c.semigroups.gz");;
gap> s:=Semigroup(ReadSemigroups(file, 600));
<transformation semigroup on 7 pts with 2 generators>
gap> iso:=IsomorphismPartialPermSemigroup(s);;
gap> inv:=InverseGeneralMapping(iso);;
gap> f:=Transformation( [ 1, 7, 3, 4, 5, 6, 7 ] );;
gap> f^iso;
<identity partial perm on [ 1, 3, 4, 5, 6, 7 ]>
gap> (f^iso)^inv;
Transformation( [ 1, 7, 3, 4, 5, 6, 7 ] )
gap> ForAll(s, f-> (f^iso)^inv=f);
true

#
gap> s:=Semigroup( Transformation( [ 2, 5, 1, 7, 3, 7, 7 ] ), 
> Transformation( [ 3, 6, 5, 7, 2, 1, 7 ] ) );;
gap> iso:=IsomorphismPartialPermSemigroup(s);;
gap> inv:=InverseGeneralMapping(iso);;
gap> f:=Transformation( [ 7, 1, 7, 7, 7, 7, 7 ] );;

#
gap> SemigroupsStopTest();

#
gap> STOP_TEST("Semigroups package: inverse.tst", 10000);