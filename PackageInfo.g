############################################################################
##
#W  PackageInfo.g
#Y  Copyright (C) 2011-16                                James D. Mitchell
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##

##  <#GAPDoc Label="PKGVERSIONDATA">
##  <!ENTITY VERSION "3.0.0">
##  <!ENTITY GAPVERS "4.9.0">
##  <!ENTITY DIGRAPHSVERS "0.5.1">
##  <!ENTITY ORBVERS "4.7.3">
##  <!ENTITY IOVERS "4.4.4">
##  <!ENTITY GENSSVERS "1.5">
##  <!ENTITY ARCHIVENAME "semigroups-3.0.0">
##  <!ENTITY COPYRIGHTYEARS "2011-16">
##  <#/GAPDoc>

BindGlobal("_RecogsFunnyNameFormatterFunction",
function(st)
  if Length(st) = 0 then
    return st;
  else
    return Concatenation(" (", st, ")");
  fi;
end);

BindGlobal("_RecogsFunnyWWWURLFunction",
function(re)
  if IsBound(re.WWWHome) then
    return re.WWWHome;
  else
    return "";
  fi;
end);

SetPackageInfo(rec(
PackageName := "Semigroups",
Subtitle := "",
Version := "3.0.0",
Date := "01/01/3000",
ArchiveFormats := ".tar.gz",

SourceRepository := rec(
    Type := "git",
    URL := Concatenation( "https://github.com/gap-packages/", ~.PackageName ),
),

IssueTrackerURL := Concatenation(~.SourceRepository.URL, "/issues"),
PackageWWWHome  := Concatenation("https://gap-packages.github.io/",
                                 ~.PackageName),
README_URL      := Concatenation(~.PackageWWWHome, "/README.md"),
PackageInfoURL  := Concatenation(~.PackageWWWHome, "/PackageInfo.g"),
ArchiveURL      := Concatenation(~.SourceRepository.URL,
                                 "/releases/download/v", ~.Version,
                                 "/", "semigroups-", ~.Version),
Persons := [
  rec(
    LastName      := "Mitchell",
    FirstNames    := "J. D.",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "jdm3@st-and.ac.uk",
    WWWHome       := "http://www-groups.mcs.st-andrews.ac.uk/~jamesm/",
    PostalAddress := Concatenation( [
                       "Mathematical Institute,",
                       " North Haugh,", " St Andrews,", " Fife,", " KY16 9SS,",
                       " Scotland"] ),
    Place         := "St Andrews",
    Institution   := "University of St Andrews"
  ),

  rec(
    LastName     := "Delgado",
    FirstNames    := "M.",
    IsAuthor      := true,
    IsMaintainer  := false,
    Email         := "mdelgado@fc.up.pt",
    WWWHome       := "http://cmup.fc.up.pt/cmup/mdelgado/",
    Place         := "Porto",
    Institution   := "Universidade do Porto"
  ),

  rec(
    LastName      := "East",
    FirstNames    := "J.",
    IsAuthor      := true,
    IsMaintainer  := false,
    Email         := "j.east@uws.edu.au",
    WWWHome       := "http://goo.gl/MuiJu5",
    Place         := "Sydney",
    Institution   := "University of Western Sydney"
  ),

  rec(
    LastName      := "Egri-Nagy",
    FirstNames    := "A.",
    IsAuthor      := true,
    IsMaintainer  := false,
    Email         := "attila@egri-nagy.hu",
    WWWHome       := "http://www.egri-nagy.hu",
    Place         := "Akita, Japan",
    Institution   := "Akita International University"
  ),
  rec(
    LastName      := "Ham",
    FirstNames    := "N.",
    IsAuthor      := true,
    IsMaintainer  := false,
    Email         := "nicholas.charles.ham@gmail.com",
    WWWHome       := "https://n-ham.github.io",
    Place         := "Hobart, Tasmania",
    Institution   := "University of Tasmania"
  ),
  rec(
    LastName      := "Jonusas",
    FirstNames    := "J.",
    IsAuthor      := true,
    IsMaintainer  := false,
    Email         := "jj252@st-and.ac.uk",
    PostalAddress := Concatenation( [
                       "Mathematical Institute,",
                       " North Haugh,", " St Andrews,", " Fife,", " KY16 9SS,",
                       " Scotland"] ),
    WWWHome       := "http://www-circa.mcs.st-and.ac.uk/~julius/",
    Place         := "St Andrews",
    Institution   := "University of St Andrews"
  ),

   rec(
    LastName      := "Pfeiffer",
    FirstNames    := "M.",
    IsAuthor      := true,
    IsMaintainer  := false,
    Email         := "markus.pfeiffer@morphism.de",
    WWWHome       := "http://www.morphism.de/~markusp/",
    PostalAddress := Concatenation( [
                       "Mathematical Institute,",
                       " North Haugh,", " St Andrews,", " Fife,", " KY16 9SS,",
                       " Scotland"] ),
    Place         := "St Andrews",
    Institution   := "University of St Andrews"
  ),

  rec(
    LastName      := "Steinberg",
    FirstNames    := "B.",
    IsAuthor      := true,
    IsMaintainer  := false,
    WWWHome       := "http://www.sci.ccny.cuny.edu/~benjamin/",
  ),

  rec(
    LastName      := "Smith",
    FirstNames    := "J.",
    IsAuthor      := true,
    IsMaintainer  := false,
    WWWHome       := "http://math.sci.ccny.cuny.edu/people?name=Jhevon_Smith",
  ),

  rec(
    LastName      := "Torpey",
    FirstNames    := "M.",
    IsAuthor      := true,
    IsMaintainer  := false,
    Email         := "mct25@st-and.ac.uk",
    WWWHome       := "http://www-circa.mcs.st-and.ac.uk/~mct25/",
    PostalAddress := Concatenation( [
                       "Mathematical Institute,",
                       " North Haugh,", " St Andrews,", " Fife,", " KY16 9SS,",
                       " Scotland"] ),
    Place         := "St Andrews",
    Institution   := "University of St Andrews",
    WWWHome       := "http://www-circa.mcs.st-and.ac.uk/~mct25/"
  ),

  rec(
    LastName      := "Wilson",
    FirstNames    := "W.",
    IsAuthor      := true,
    IsMaintainer  := false,
    Email         := "waw7@st-and.ac.uk",
    WWWHome       := "http://wilf.me",
    PostalAddress := Concatenation( [
                       "Mathematical Institute,",
                       " North Haugh,", " St Andrews,", " Fife,", " KY16 9SS,",
                       " Scotland"] ),
    Place         := "St Andrews",
    Institution   := "University of St Andrews"
  )],

Status := "deposited",
#FIXME update the AbstractHTML
AbstractHTML :=
"<p>The <strong class=\"pkg\">Semigroups</strong> package is a <strong class=\"pkg\">GAP</strong> package containing methods for semigroups, monoids, and inverse semigroups, principally of transformations, partial permutations, bipartitions, subsemigroups of regular Rees 0-matrix semigroups, free inverse semigroups, free bands, and semigroups of matrices over finite fields.</p> <p><strong class=\"pkg\">Semigroups</strong> contains more efficient methods than those available in the <strong class=\"pkg\">GAP</strong> library (and in many cases more efficient than any other software) for creating semigroups, monoids, and inverse semigroup, calculating their Green's structure, ideals, size, elements, group of units, small generating sets, testing membership, finding the inverses of a regular element, factorizing elements over the generators, and many more. It is also possible to test if a semigroup satisfies a particular property, such as if it is regular, simple, inverse, completely regular, and a variety of further properties.</p> <p>There are methods for finding congruences of certain types of semigroups, the normalizer of a semigroup in a permutation group, the maximal subsemigroups of a finite semigroup, and smaller degree partial permutation representations of inverse semigroups. There are functions for producing pictures of the Green's structure of a semigroup, and for drawing bipartitions.</p>",

PackageDoc := rec(
  BookName  := "Semigroups",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Semigroups",
  Autoload  := true
),

Dependencies := rec(
  GAP := ">=4.9.0",
  NeededOtherPackages := [["orb", ">=4.7.3"],
                          ["io", ">=4.4.4"],
                          ["digraphs", ">=0.5.1"],
                          ["genss", ">=1.5"]],
  SuggestedOtherPackages := [["gapdoc", ">=1.5.1"]],
  
  ExternalConditions := []),

  BannerString := Concatenation(
  "----------------------------------------------------------------------",
  "-------\n",
  "Loading  Semigroups ", ~.Version, "\n",
  "by ", ~.Persons[1].FirstNames, " ", ~.Persons[1].LastName,
        " (", ~.Persons[1].WWWHome, ")\n",
  "with contributions by:\n",
  Concatenation(Concatenation(List(~.Persons{[2..Length(~.Persons)-1]},
       p->["     ",p.FirstNames," ",p.LastName,
       _RecogsFunnyNameFormatterFunction(
         _RecogsFunnyWWWURLFunction(p)),",\n"]))),
  " and ",~.Persons[Length(~.Persons)].FirstNames," ",
  ~.Persons[Length(~.Persons)].LastName,
  _RecogsFunnyNameFormatterFunction(
    _RecogsFunnyWWWURLFunction(~.Persons[Length(~.Persons)])),".\n",
  "-----------------------------------------------------------------------",
  "------\n"),

  AvailabilityTest := function()
    if (not "semigroups" in SHOW_STAT()) and
      (Filename(DirectoriesPackagePrograms("semigroups"), "semigroups.so") = fail)
     then
      Info(InfoWarning, 1, "Semigroups: the kernel module is not compiled, ",
           "the package cannot be loaded.");
      return fail;
    fi;
    return true;
  end,

  Autoload := false,
  TestFile := "tst/testinstall.tst",
  Keywords := ["transformation semigroups", "partial permutations",
               "inverse semigroups", "Green's relations",
               "free inverse semigroup", "partition monoid", "bipartitions",
               "Rees matrix semigroups"]
));

MakeReadWriteGlobal("_RecogsFunnyWWWURLFunction");
MakeReadWriteGlobal("_RecogsFunnyNameFormatterFunction");
Unbind(_RecogsFunnyWWWURLFunction);
Unbind(_RecogsFunnyNameFormatterFunction);
