/*
 * Semigroups GAP package
 *
 * This file contains the interface from GAP to the C++ congruence objects.
 *
 */


#include <string>

#include "data.h"
#include "congpairs.h"

//#include "gap-debug.h"

#include "semigroups++/tc.h"

static inline word_t plist_to_word_t(Obj plist) {
  word_t word;
  for (size_t i = 1; i <= (size_t) LEN_PLIST(plist); i++) {
    Obj j = ELM_PLIST(plist, i);
    assert(IS_INTOBJ(j));
    word.push_back(INT_INTOBJ(j) - 1);
  }
  return word;
}

static inline bool cong_obj_has_cpp_cong(Obj cong) {
  initRNams();
  return IsbPRec(cong, RNam_cong_pairs_congruence)
         && CLASS_OBJ<Congruence>(ElmPRec(cong, RNam_cong_pairs_congruence))
                != nullptr;
}

static inline Semigroup* cong_obj_get_range(Obj o) {
  initRNams();
  // assert(IsSemigroupCongruenceByGeneratingPairsRep(o));
  return data_semigroup(ElmPRec(o, RNam_fin_cong_range));
}

static inline bool cong_obj_get_range_type(Obj o) {
  initRNams();
  // assert(IsSemigroupCongruenceByGeneratingPairsRep(o));
  return data_type(ElmPRec(o, RNam_fin_cong_range));
}

static void cong_obj_init_cpp_cong(Obj o) {
  // assert(IsSemigroupCongruenceByGeneratingPairsRep(o));
  assert(!cong_obj_has_cpp_cong(o));

  initRNams();

  Obj genpairs = ElmPRec(o, RNam_genpairs);
  Obj type     = ElmPRec(o, RNam_fin_cong_type);
  Obj data     = ElmPRec(o, RNam_fin_cong_range);
  Congruence* cong;
  word_t                  lhs, rhs;

  if (cong_obj_get_range_type(o) != UNKNOWN) {

    Semigroup* range = cong_obj_get_range(o);
    range->enumerate(-1, rec_get_report(o));

    std::vector<relation_t> extra;

    for (size_t i = 1; i <= (size_t) LEN_PLIST(genpairs); i++) {
      Obj lhs_obj = ELM_PLIST(ELM_PLIST(genpairs, i), 1);
      Obj rhs_obj = ELM_PLIST(ELM_PLIST(genpairs, i), 2);

      range->factorisation(
          lhs, INT_INTOBJ(SEMIGROUP_POSITION(0L, data, lhs_obj)) - 1);
      range->factorisation(
          rhs, INT_INTOBJ(SEMIGROUP_POSITION(0L, data, rhs_obj)) - 1);

      extra.push_back(make_pair(lhs, rhs));
      lhs.clear();
      rhs.clear();
    }
    cong = cong_pairs_enumerate(std::string(CSTR_STRING(type)),
                                range,
                                extra,
                                rec_get_report(o));
  } else {
    enumerate_semigroup(0L, data, INTOBJ_INT(-1), 0, False);

    Obj                     rules = ElmPRec(data, RNam_rules);
    Obj                     words = ElmPRec(data, RNam_words);
    std::vector<relation_t> rels;
    std::vector<relation_t> extra;

    for (size_t i = 1; i <= (size_t) LEN_PLIST(rules); i++) {
      Obj lhs_obj = ELM_PLIST(ELM_PLIST(rules, i), 1);
      Obj rhs_obj = ELM_PLIST(ELM_PLIST(rules, i), 2);
      for (size_t j = 1; j <= (size_t) LEN_PLIST(lhs_obj); j++) {
        lhs.push_back(INT_INTOBJ(ELM_PLIST(lhs_obj, j)) - 1);
      }
      for (size_t j = 1; j <= (size_t) LEN_PLIST(rhs_obj); j++) {
        rhs.push_back(INT_INTOBJ(ELM_PLIST(rhs_obj, j)) - 1);
      }

      rels.push_back(make_pair(lhs, rhs));
      lhs.clear();
      rhs.clear();
    }

    for (size_t i = 1; i <= (size_t) LEN_PLIST(genpairs); i++) {
      Obj lhs_obj = ELM_PLIST(ELM_PLIST(genpairs, i), 1);
      Obj rhs_obj = ELM_PLIST(ELM_PLIST(genpairs, i), 2);

      Obj lhs = ELM_PLIST(
          words, INT_INTOBJ(SEMIGROUP_POSITION(0L, data, lhs_obj)));
      Obj rhs = ELM_PLIST(
          words, INT_INTOBJ(SEMIGROUP_POSITION(0L, data, rhs_obj)));

      extra.push_back(make_pair(plist_to_word_t(lhs), plist_to_word_t(rhs)));
    }
    cong = new Congruence(std::string(CSTR_STRING(type)),
                          LEN_PLIST(ElmPRec(data, RNam_gens)),
                          rels,
                          extra);
    cong->set_report(rec_get_report(o));
    cong->todd_coxeter();
  }
  cong->compress();
  AssPRec(o, RNam_cong_pairs_congruence, OBJ_CLASS(cong, T_SEMI_SUBTYPE_CONG));
}

static Congruence* cong_obj_get_cpp (Obj cong) {
  initRNams();
  if (!cong_obj_has_cpp_cong(cong)) {
    cong_obj_init_cpp_cong(cong);
  }
  Obj tsemiobj = ElmPRec(cong, RNam_cong_pairs_congruence);
  assert(TNUM_OBJ(tsemiobj) == T_SEMI
         && SUBTYPE_OF_T_SEMI(tsemiobj) == T_SEMI_SUBTYPE_CONG);
  return CLASS_OBJ<Congruence>(tsemiobj);
}

Obj CONG_PAIRS_NR_CLASSES (Obj self, Obj o) {
  return INTOBJ_INT(cong_obj_get_cpp(o)->nr_classes());
}

Obj CONG_PAIRS_IN(Obj self, Obj o, Obj pair) {
  initRNams();
  Obj data = ElmPRec(o, RNam_fin_cong_range);

  Obj lhs_obj = ELM_LIST(pair, 1);
  Obj rhs_obj = ELM_LIST(pair, 2);
  word_t lhs, rhs;

  if (cong_obj_get_range_type(o) != UNKNOWN) {
    Semigroup* range = cong_obj_get_range(o);

    range->factorisation(lhs,
                         INT_INTOBJ(SEMIGROUP_POSITION(0L, data, lhs_obj)) - 1);
    range->factorisation(rhs,
                         INT_INTOBJ(SEMIGROUP_POSITION(0L, data, rhs_obj)) - 1);
  } else {
    enumerate_semigroup(0L, data, INTOBJ_INT(-1), 0, False);

    Obj words = ElmPRec(data, RNam_words);

    lhs = plist_to_word_t(
        ELM_PLIST(words, INT_INTOBJ(SEMIGROUP_POSITION(0L, data, lhs_obj))));
    rhs = plist_to_word_t(
        ELM_PLIST(words, INT_INTOBJ(SEMIGROUP_POSITION(0L, data, rhs_obj))));
  }

  Congruence* cong = cong_obj_get_cpp(o);
  return (cong->word_to_coset(lhs) == cong->word_to_coset(rhs) ? True
                                                                 : False);
}

Obj CONG_PAIRS_LOOKUP_PART(Obj self, Obj o) {
  initRNams();
  // TODO assert o is correct type of object
  if (IsbPRec(o, RNam_fin_cong_lookup)) {
    assert(IsbPRec(o, RNam_fin_cong_partition));
    return True;
  }

  Congruence* cong   = cong_obj_get_cpp(o);
  bool        report = rec_get_report(o);

  Obj partition = NEW_PLIST(T_PLIST_HOM, cong->nr_classes());
  SET_LEN_PLIST(partition, cong->nr_classes());

  for (size_t i = 0; i < cong->nr_classes(); i++) {
    Obj next = NEW_PLIST(T_PLIST_CYC, 0);
    SET_LEN_PLIST(next, 0);
    SET_ELM_PLIST(partition, i + 1, next);
    CHANGED_BAG(partition);
  }

  Obj lookup;

  if (cong_obj_get_range_type(o) != UNKNOWN) {
    Semigroup* range = cong_obj_get_range(o);

    lookup = NEW_PLIST(T_PLIST_CYC, range->size());
    SET_LEN_PLIST(lookup, range->size());

    word_t word;

    for (size_t i = 0; i < range->size(); i++) {
      range->factorisation(word, i, report); // changes word in place
      size_t coset = cong->word_to_coset(word);
      SET_ELM_PLIST(lookup, i + 1, INTOBJ_INT(coset));

      Obj c = ELM_PLIST(partition, coset);
      AssPlist(c, LEN_PLIST(c) + 1, INTOBJ_INT(i + 1));
      CHANGED_BAG(partition);

      word.clear();
    }
  } else {
    Obj data = ElmPRec(o, RNam_fin_cong_range);
    enumerate_semigroup(0L, data, INTOBJ_INT(-1), 0, False);
    Obj words = ElmPRec(data, RNam_words);

    lookup = NEW_PLIST(T_PLIST_CYC, LEN_PLIST(words));
    SET_LEN_PLIST(lookup, LEN_PLIST(words));

    for (size_t i = 1; i <= (size_t) LEN_PLIST(words); i++) {
      size_t coset = cong->word_to_coset(plist_to_word_t(ELM_PLIST(words, i)));
      SET_ELM_PLIST(lookup, i, INTOBJ_INT(coset));

      Obj c = ELM_PLIST(partition, coset);
      AssPlist(c, LEN_PLIST(c) + 1, INTOBJ_INT(i));
      CHANGED_BAG(partition);
    }
  }
  AssPRec(o, RNam_fin_cong_partition, partition);
  AssPRec(o, RNam_fin_cong_lookup, lookup);
  return True;
}

Obj CONG_PAIRS_CLASS_COSET_ID (Obj self, Obj o) {
  initRNams();
  //TODO assert o is correct type of object

  Obj rep      = ElmPRec(o, RNam_rep);
  Obj cong_obj = ElmPRec(o, RNam_cong);
  Obj data     = ElmPRec(cong_obj, RNam_fin_cong_range);

  if (IsbPRec(o, RNam_fin_cong_lookup)) {
    Obj lookup = ElmPRec(cong_obj, RNam_fin_cong_lookup);
    return ELM_PLIST(lookup, INT_INTOBJ(SEMIGROUP_POSITION(self, data, rep)));
  } else if (cong_obj_get_range_type(cong_obj) != UNKNOWN) {
    Congruence* cong = cong_obj_get_cpp(cong_obj);
    Semigroup* range = cong_obj_get_range(cong_obj);

    word_t word;
    range->factorisation(word,
                         INT_INTOBJ(SEMIGROUP_POSITION(self, data, rep)) - 1,
                         rec_get_report(o));
    return INTOBJ_INT(cong->word_to_coset(word));
  } else {
    enumerate_semigroup(0L, data, INTOBJ_INT(-1), 0, False);
    Congruence* cong = cong_obj_get_cpp(cong_obj);

    Obj word = ELM_PLIST(ElmPRec(data, RNam_words),
                         INT_INTOBJ(SEMIGROUP_POSITION(self, data, rep)));

    return INTOBJ_INT(cong->word_to_coset(plist_to_word_t(word)));
  }
}